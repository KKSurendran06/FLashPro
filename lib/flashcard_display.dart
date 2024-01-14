// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'flashcard_model.dart';
import 'package:flutter_tex/flutter_tex.dart';

class FlashcardDisplay extends StatefulWidget {
  final List<Flashcard> flashcards;

  FlashcardDisplay({required this.flashcards});

  @override
  _FlashcardDisplayState createState() => _FlashcardDisplayState();
}

class _FlashcardDisplayState extends State<FlashcardDisplay> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(
          'FlashCards',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              SizedBox(
                height: 400.0,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlipCard(
                      direction: FlipDirection.HORIZONTAL,
                      front: _buildFlashcardSide(
                          widget.flashcards[currentIndex].question),
                      back: _buildFlashcardSide(
                          widget.flashcards[currentIndex].answer),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  deleteFlashcard(widget.flashcards[currentIndex].id);
                  setState(() {
                    widget.flashcards.removeAt(currentIndex);

                    currentIndex =
                        currentIndex.clamp(0, widget.flashcards.length - 1);
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    currentIndex = (currentIndex - 1)
                        .clamp(0, widget.flashcards.length - 1);
                  });
                },
                child: Text('Previous'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    currentIndex = (currentIndex + 1)
                        .clamp(0, widget.flashcards.length - 1);
                  });
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }

Widget _buildFlashcardSide(String latexEquation) {
  return Card(
    elevation: 4.0,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TeXView(
            renderingEngine: TeXViewRenderingEngine.katex(),
            child: TeXViewDocument(latexEquation),
          ),
          SizedBox(height: 8.0),
          Text(
            'Tap!!',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.purple[800],
            ),
          ),
        ],
      ),
    ),
  );
}

}
