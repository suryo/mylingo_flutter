import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_tts/flutter_tts.dart';

class LearningScreen extends StatefulWidget {
  final String filename;
  final String level;

  LearningScreen({required this.filename, required this.level});

  @override
  _LearningScreenState createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen> {
  String _selectedAccent = 'en-US'; // Default: American English
  late stt.SpeechToText _speech;
  final FlutterTts _flutterTts = FlutterTts();
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isListening = false;
  bool _hasSpoken = false;
  List<dynamic> _items = [];
  int _currentIndex = 0;
  String _recognizedText = '';
  bool _hasSpokenCorrectly = false;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _loadData();
  }

  Future<void> _speak(String text) async {
     await _flutterTts.setLanguage(_selectedAccent); // dynamic
    await _flutterTts.setPitch(1.0);
    await _flutterTts.setSpeechRate(0.45);
    await _flutterTts.speak(text);
  }

  Future<void> _loadData() async {
    final jsonStr = await rootBundle.loadString(
      'assets/data/${widget.filename}',
    );
    final data = json.decode(jsonStr);
    final levelData = data['levels'].firstWhere(
      (lvl) =>
          lvl['level'].toString().toLowerCase() == widget.level.toLowerCase(),
      orElse: () => null,
    );

    if (levelData != null) {
      setState(() {
        _items = levelData['items'];
      });
    }
  }

  Future<void> _playSound(String filename) async {
    await _audioPlayer.play(AssetSource('sounds/$filename'));
  }

  Future<void> _startListening() async {
    setState(() {
      _hasSpoken = false;
    });

    await _playSound('bip.mp3');

    bool available = await _speech.initialize(
      onStatus: (status) {
        setState(() {
          _isListening = status == 'listening';
        });
      },
      onError: (error) => print('Error: $error'),
    );

    if (available) {
      _speech.listen(
        onResult: (result) async {
          // Tangani hanya jika hasil sudah final
          if (!result.finalResult) return;

          if (_hasSpoken) return;

          setState(() {
            _recognizedText = result.recognizedWords;
          });

          String spoken = _recognizedText.toLowerCase().trim();
          String target =
              (_items[_currentIndex]['word'] ??
                      _items[_currentIndex]['sentence'] ??
                      _items[_currentIndex]['text'])
                  .toString()
                  .toLowerCase()
                  .trim();

          print(
            '=================================recognized: "$spoken"=================================',
          );
          print(
            '=================================target: "$target"=================================',
          );

          _speech.stop();
          _hasSpoken = true;

          if (spoken == target) {
            _hasSpokenCorrectly = true;
            await _playSound('ding.mp3');
            Future.delayed(Duration(milliseconds: 600), _nextItem);
          } else {
            await _playSound('tetot.mp3');
          }
        },
      );
    }
  }

  void _nextItem() {
    if (_currentIndex < _items.length - 1) {
      setState(() {
        _currentIndex++;
        _recognizedText = '';
        _hasSpoken = false;
      });
    } else {
      _showFinishDialog();
    }
  }

  void _showFinishDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Selesai!"),
        content: Text("Kamu telah menyelesaikan semua soal!"),
        actions: [
          TextButton(
            child: Text("Ulangi"),
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                _currentIndex = 0;
                _recognizedText = '';
                _hasSpoken = false;
              });
            },
          ),
          TextButton(
            child: Text("Kembali"),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_items.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text("Loading...")),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final item = _items[_currentIndex];
    String displayText = item['word'] ?? item['sentence'] ?? item['text'] ?? '';

    return Scaffold(
      appBar: AppBar(title: Text("Latihan Tema")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Ucapkan:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),

              Text("Aksen:", style: TextStyle(fontSize: 16)),
    SizedBox(width: 10),
    DropdownButton<String>(
      value: _selectedAccent,
      items: const [
        DropdownMenuItem(
          value: 'en-US',
          child: Text("🇺🇸 English (US)"),
        ),
        DropdownMenuItem(
          value: 'en-GB',
          child: Text("🇬🇧 English (UK)"),
        ),
      ],
      onChanged: (value) {
        if (value != null) {
          setState(() {
            _selectedAccent = value;
          });
        }
      },
    ),

            Text(
              '"$displayText"',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
              textAlign: TextAlign.center,
            ),

            if (item['ipa'] != null)
              Text(
                item['ipa'],
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.blueGrey,
                ),
                textAlign: TextAlign.center,
              ),

            SizedBox(height: 24),

            // 🔊 Play dan 🎙 Rekam dalam 1 baris
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _speak(displayText),
                  icon: Icon(Icons.volume_up),
                  label: Text("Play"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton.icon(
                  icon: Icon(_isListening ? Icons.mic : Icons.mic_none),
                  label: Text(
                    _isListening ? "Mendengarkan..." : "Mulai Ucapkan",
                  ),
                  onPressed: _isListening
                      ? () => _speech.stop()
                      : _startListening,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
              ],
            ),

            SizedBox(height: 32),

            Text(
              "Yang kamu ucapkan:",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              _recognizedText,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color:
                    _recognizedText.toLowerCase().trim() ==
                        displayText.toLowerCase()
                    ? Colors.green
                    : Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
