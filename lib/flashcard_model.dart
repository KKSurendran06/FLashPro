// ignore_for_file: prefer_const_constructor
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Flashcard {
  final int id;
  final String question;
  final String answer;
  final String chapter;

  Flashcard({
    required this.id,
    required this.question,
    required this.answer,
    required this.chapter,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'answer': answer,
      'chapter': chapter,
    };
  }
}

Future<Database> initializeDatabase() async {
  final db = await openDatabase(
    join(await getDatabasesPath(), 'flashcards_database.db'),
    onCreate: (db, version) async {
  
      await db.execute(
        'CREATE TABLE flashcards(id INTEGER PRIMARY KEY, question TEXT, answer TEXT, chapter TEXT)',
      );

final List<Flashcard> defaultMathsFlashcards = [
  Flashcard(id: 1, question: 'What is the square root of 144?', answer: '12', chapter: 'Maths'),
  Flashcard(id: 2, question: 'Solve the equation: \(2x + 5 = 15\)', answer: 'x = 5', chapter: 'Maths'),
  Flashcard(id: 3, question: 'Find the area of a rectangle with length 8 units and width 5 units.', answer: '40 square units', chapter: 'Maths'),
  Flashcard(id: 4, question: 'What is the value of \π (pi) to two decimal places?', answer: '3.14', chapter: 'Maths'),
  Flashcard(id: 5, question: 'If a triangle has angles A, B, and C, and angle A is 90 degrees, what type of triangle is it?', answer: 'Right-angled triangle', chapter: 'Maths'),
];

final List<Flashcard> defaultPhysicsFlashcards = [
  Flashcard(id: 6, question: 'What is Newton\'s first law of motion?', answer: 'An object at rest stays at rest, and an object in motion stays in motion with the same speed and in the same direction unless acted upon by an external force.', chapter: 'Physics'),
  Flashcard(id: 7, question: 'Define velocity.', answer: 'Velocity is a vector quantity that represents the rate at which an object changes its position.', chapter: 'Physics'),
  Flashcard(id: 8, question: 'What is the formula for calculating kinetic energy?', answer: 'Kinetic Energy (KE) = 0.5 * mass * velocity^2', chapter: 'Physics'),
  Flashcard(id: 9, question: 'Explain the concept of electromagnetic induction.', answer: 'Electromagnetic induction is the process of generating an electromotive force (EMF) in a closed circuit by changing the magnetic flux through the circuit.', chapter: 'Physics'),
  Flashcard(id: 10, question: 'What is the relationship between force, mass, and acceleration according to Newton\'s second law?', answer: 'Force = mass * acceleration', chapter: 'Physics'),
];

final List<Flashcard> defaultChemistryFlashcards = [
  Flashcard(id: 11, question: 'Define a chemical element.', answer: 'A chemical element is a substance that consists of only one type of atom, characterized by its atomic number.', chapter: 'Chemistry'),
  Flashcard(id: 12, question: 'What is the pH scale used for?', answer: 'The pH scale is used to measure the acidity or alkalinity of a solution.', chapter: 'Chemistry'),
  Flashcard(id: 13, question: 'Name three types of chemical reactions.', answer: 'Synthesis, decomposition, and combustion.', chapter: 'Chemistry'),
  Flashcard(id: 14, question: 'What is the chemical symbol for gold?', answer: 'Au', chapter: 'Chemistry'),
  Flashcard(id: 15, question: 'Define exothermic reaction.', answer: 'An exothermic reaction is a chemical reaction that releases heat energy to the surroundings.', chapter: 'Chemistry'),
];


for (var flashcard in defaultMathsFlashcards) {
  await db.insert(
    'flashcards',
    flashcard.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

for (var flashcard in defaultPhysicsFlashcards) {
  await db.insert(
    'flashcards',
    flashcard.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

for (var flashcard in defaultChemistryFlashcards) {
  await db.insert(
    'flashcards',
    flashcard.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}
    },
    version: 1,
  );

  return db;
}

Future<void> insertFlashcard(Flashcard flashcard) async {
  final db = await initializeDatabase();
  await db.insert(
    'flashcards',
    flashcard.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Flashcard>> getChapterFlashcards(String chapter) async {
  final db = await initializeDatabase();
  final List<Map<String, dynamic>> maps = await db.query(
    'flashcards',
    where: 'chapter = ?',
    whereArgs: [chapter],
  );

  return List.generate(maps.length, (i) {
    return Flashcard(
      id: maps[i]['id'] as int,
      question: maps[i]['question'] as String,
      answer: maps[i]['answer'] as String,
      chapter: maps[i]['chapter'] as String,
    );
  });
}


Future<void> deleteFlashcard(int id) async {
  final db = await initializeDatabase();
  await db.delete(
    'flashcards',
    where: 'id = ?',
    whereArgs: [id],
  );
}
