// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'flashcard_model.dart'; 
import 'flashcard_display.dart'; 

class Chapters extends StatelessWidget {
  const Chapters({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(
          'Chapters',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                List<Flashcard> chapterFlashcards = await getChapterFlashcards('Maths');
                _navigateToFlashcardDisplay(context, chapterFlashcards);
              },
              
              child: const Text('   Maths   '),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {

                List<Flashcard> chapterFlashcards = await getChapterFlashcards('Physics');
                _navigateToFlashcardDisplay(context, chapterFlashcards);
              },
              
              child: const Text('  Physics  '),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {

                List<Flashcard> chapterFlashcards = await getChapterFlashcards('Chemistry');
                _navigateToFlashcardDisplay(context, chapterFlashcards);
              },
              
              child: const Text('Chemistry'),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToFlashcardDisplay(BuildContext context, List<Flashcard> flashcards) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FlashcardDisplay(flashcards: flashcards),
      ),
    );
  }
}
