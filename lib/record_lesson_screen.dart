import 'package:alphabets_audio/practice_lesson_screen.dart';
import 'package:flutter/material.dart';

class RecordLessonScreen extends StatelessWidget {
  final TextEditingController startAlphabetController = TextEditingController();
  final TextEditingController endAlphabetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Record Lesson'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Start Alphabet:',
              style: TextStyle(fontSize: 16.0),
            ),
            TextFormField(
              controller: startAlphabetController,
              decoration: InputDecoration(
                hintText: 'Enter start alphabet',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'End Alphabet:',
              style: TextStyle(fontSize: 16.0),
            ),
            TextFormField(
              controller: endAlphabetController,
              decoration: InputDecoration(
                hintText: 'Enter end alphabet',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String startAlphabet = startAlphabetController.text.toUpperCase();
                String endAlphabet = endAlphabetController.text.toUpperCase();

                // Validate input here if needed

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PracticeLessonScreen(
                      startAlphabet: startAlphabet,
                      endAlphabet: endAlphabet,
                    ),
                  ),
                );
              },
              child: Text('Save and Practice'),
            ),
          ],
        ),
      ),
    );
  }
}
