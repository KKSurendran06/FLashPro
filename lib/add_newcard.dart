// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'flashcard_model.dart'; 

class AddCardWidget extends StatefulWidget {
  @override
  _AddCardWidgetState createState() => _AddCardWidgetState();
}

class _AddCardWidgetState extends State<AddCardWidget> {
  String selectedChapter = 'Maths';
  TextEditingController questionController = TextEditingController();
  TextEditingController answerController = TextEditingController();

  List<String> chapters = ['Maths', 'Physics', 'Chemistry'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Flashcard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<String>(
              value: selectedChapter,
              onChanged: (String? newValue) {
                setState(() {
                  selectedChapter = newValue!;
                });
              },
              items: chapters.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.deepPurpleAccent),
                  ),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Select Chapter',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: questionController,
              decoration: InputDecoration(
                labelText: 'Question',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: answerController,
              decoration: InputDecoration(
                labelText: 'Answer',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final newFlashcard = Flashcard(
                  id: 0, 
                  question: questionController.text,
                  answer: answerController.text,
                  chapter: selectedChapter,
                );
                insertFlashcard(newFlashcard);
                Navigator.pop(context);
              },
              child: Text('Save Flashcard'),
            ),
          ],
        ),
      ),
    );
  }
}
