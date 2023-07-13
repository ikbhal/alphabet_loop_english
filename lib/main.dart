import 'package:flutter/material.dart';

import 'practice_lesson_screen.dart';
import 'record_lesson_screen.dart';

void main() {
  runApp(AlphabetApp());
}

class AlphabetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alphabet App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/record_lesson': (context) => RecordLessonScreen(),
      },
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/record_lesson');
              },
              child: Text('Record Lesson'),
            ),
            SizedBox(height: 20.0),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                // crossAxisCount: 4,
                 crossAxisCount: 10,
              ),
              itemCount: 26,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    String selectedAlphabet = String.fromCharCode(index + 65);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PracticeLessonScreen(
                          startAlphabet: selectedAlphabet,
                          endAlphabet: selectedAlphabet,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      String.fromCharCode(index + 65),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
