import 'package:flutter/material.dart';
// import 'package:audioplayers/audio_cache.dart';

class PracticeLessonScreen extends StatefulWidget {
  final String startAlphabet;
  final String endAlphabet;

  PracticeLessonScreen({required this.startAlphabet, required this.endAlphabet});

  @override
  _PracticeLessonScreenState createState() => _PracticeLessonScreenState();
}

class _PracticeLessonScreenState extends State<PracticeLessonScreen> {
  late List<String> alphabets;
  late String currentAlphabet;
  // late AudioCache audioCache;

  @override
  void initState() {
    super.initState();
    alphabets = [];
    currentAlphabet = widget.startAlphabet;
    // audioCache = AudioCache(prefix: 'assets/audio/');

    generateAlphabetList();
    playCurrentAlphabetAudio();
  }

  void generateAlphabetList() {
    int start = widget.startAlphabet.codeUnitAt(0);
    int end = widget.endAlphabet.codeUnitAt(0);

    for (int i = start; i <= end; i++) {
      alphabets.add(String.fromCharCode(i));
    }
  }

  void playCurrentAlphabetAudio() {
    // audioCache.play('$currentAlphabet.mp3');
  }

  void updateCurrentAlphabet() {
    int currentIndex = alphabets.indexOf(currentAlphabet);

    setState(() {
      if (currentIndex < alphabets.length - 1) {
        currentAlphabet = alphabets[currentIndex + 1];
      } else {
        currentAlphabet = alphabets[0];
      }
    });

    playCurrentAlphabetAudio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practice Lesson'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentAlphabet,
              style: TextStyle(fontSize: 120.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: updateCurrentAlphabet,
              child: Text('Next Alphabet'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}