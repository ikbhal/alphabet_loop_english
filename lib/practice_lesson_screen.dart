import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PracticeLessonScreen extends StatefulWidget {
  final String startAlphabet;
  final String endAlphabet;

  PracticeLessonScreen(
      {required this.startAlphabet, required this.endAlphabet});

  @override
  _PracticeLessonScreenState createState() => _PracticeLessonScreenState();
}

class _PracticeLessonScreenState extends State<PracticeLessonScreen> {
  late List<String> alphabets;
  late String currentAlphabet;
  late AudioPlayer audioPlayer;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    alphabets = [];
    currentAlphabet = widget.startAlphabet;
    // cache assets from a to z from assets/audio
    //
    // AudioCache.instance.loadAsset('assets/audio/a.mp3');

    audioPlayer = AudioPlayer();
    audioCacheLoadAllAlphabets();
    // audioPlayer.
    audioPlayer.setReleaseMode(ReleaseMode.stop);
    audioPlayer.onPlayerStateChanged.listen((event) {
      if (isPlaying &&  event == PlayerState.completed) {
        int currentIndex = alphabets.indexOf(currentAlphabet);
         setState(() {
          if (currentIndex < alphabets.length - 1) {
            currentAlphabet = alphabets[currentIndex + 1];
          } else {
            currentAlphabet = alphabets[0];
          }
        });
        updateCurrentAlphabet();
      } 
    });

    generateAlphabetList();
  }

   @override
  void dispose() {
    audioPlayer.stop();
    audioPlayer.dispose();
    super.dispose();
  }

  void audioCacheLoadAllAlphabets(){
    int start = 'a'.codeUnitAt(0);
    int end = 'z'.codeUnitAt(0);

    List<String> alphabets = [];
    for (int i = start; i <= end; i++) {
      String currentAlphabet = String.fromCharCode(i);
      String assetPath = 'assets/audio/$currentAlphabet.mp3';
      AudioCache.instance.loadAsset('assets/audio/a.mp3');
      // alphabets.add(assetPath);
    }
  }


  void generateAlphabetList() {
    int start = widget.startAlphabet.codeUnitAt(0);
    int end = widget.endAlphabet.codeUnitAt(0);

    for (int i = start; i <= end; i++) {
      alphabets.add(String.fromCharCode(i));
    }
  }

  void playCurrentAlphabetAudio() {
    if (currentAlphabet != '') {
      audioPlayer.play(AssetSource('audio/$currentAlphabet.mp3'));
    }
  }

  Future<void> pauseAudio() async {
    await audioPlayer.pause();
  }

  Future<void> resumeAudio() async {
    await audioPlayer.resume();
  }

  void toggleLoop() {
    setState((){
      isPlaying = !isPlaying;
      updateCurrentAlphabet();
    });
  }

  void updateCurrentAlphabet() {
    print("inside updateCurrentAlphabet");
    if(!isPlaying){
      print("wont loop as isplaying false, returning");
      return;
    }
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
            // ElevatedButton(
            //   onPressed: updateCurrentAlphabet,
            //   child: Text('Next Alphabet'),
            // ),
            ElevatedButton(
              onPressed: toggleLoop,
              child: !isPlaying ?Text ('Start Loop') : Text('Stop Loop'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
              },
              child: Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}
