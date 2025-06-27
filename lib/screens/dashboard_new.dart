import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:audioplayers/audioplayers.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<String> _words = ['elephant', 'apple', 'banana', 'cat', 'dog'];
  int _currentIndex = 0;
  String _recognizedText = '';
  bool _isListening = false;
  bool _hasSpoken = false;

  late stt.SpeechToText _speech;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  Future<void> _playSound(String filename) async {
    await _audioPlayer.play(AssetSource('sounds/$filename'));
  }

  Future<void> _startListening() async {
    setState(() {
      _hasSpoken = false;
    });

    await _playSound('bip.mp3'); // Bunyi awal

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
          if (_hasSpoken) return; // batasi 1x proses per kata

          setState(() {
            _recognizedText = result.recognizedWords;
          });

          final input = _recognizedText.toLowerCase().trim();
          final target = _words[_currentIndex].toLowerCase();

          _speech.stop();
          _hasSpoken = true;

          if (input == target) {
            await _playSound('ding.mp3'); // suara benar
            Future.delayed(Duration(milliseconds: 500), () {
              _nextWord();
            });
          } else {
            await _playSound('tetot.mp3'); // suara salah
          }
        },
      );
    }
  }

  void _stopListening() {
    _speech.stop();
    setState(() {
      _isListening = false;
    });
  }

  void _nextWord() {
    if (_currentIndex < _words.length - 1) {
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
        content: Text("Anda telah menyelesaikan semua kata!"),
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
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String targetWord = _words[_currentIndex];

    return Scaffold(
      appBar: AppBar(title: Text("MyLingo Dashboard")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('Ucapkan Kata Berikut:', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text(
              '"$targetWord"',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton.icon(
              icon: Icon(_isListening ? Icons.mic : Icons.mic_none),
              label: Text(_isListening ? 'Mendengarkan...' : 'Mulai Ucapkan'),
              onPressed: _isListening ? _stopListening : _startListening,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              ),
            ),
            SizedBox(height: 30),
            Text('Yang Anda ucapkan:', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text(
              _recognizedText,
              style: TextStyle(
                fontSize: 20,
                color: _recognizedText.toLowerCase().trim() ==
                        targetWord.toLowerCase()
                    ? Colors.green
                    : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
