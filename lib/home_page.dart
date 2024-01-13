// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'chapters.dart';
import 'add_newcard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(
          'FlashPro',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              'FlashPro, your all in one FlashCard App',
              style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 17,
                fontStyle: FontStyle.italic,
              ),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Chapters()),
                );
              },
            
              child: const Text(' View Chapters '),
            ),
            
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddCardWidget()),
                );
              },
             
              child: const Text('Add Flashcards'),
            ),
          ],
        ),
      ),
    );
  }
}
