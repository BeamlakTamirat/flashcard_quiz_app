import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import '../models/flashcard.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  final List<Flashcard> flashcards = [
    Flashcard(
      question: 'What is Flutter?',
      answer: 'Flutter is Google\'s UI toolkit for building beautiful, natively compiled applications from a single codebase.',
    ),
    Flashcard(
      question: 'What is a Widget in Flutter?',
      answer: 'Widgets are the basic building blocks of Flutter applications. Everything in Flutter is a widget.',
    ),
    Flashcard(
      question: 'What is Hot Reload?',
      answer: 'Hot Reload allows you to quickly experiment, build UIs, add features, and fix bugs faster without restarting the app.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Card ${currentIndex + 1}/${flashcards.length}',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FlipCard(
              front: _buildCard(flashcards[currentIndex].question),
              back: _buildCard(flashcards[currentIndex].answer),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (currentIndex > 0)
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      currentIndex--;
                    });
                  },
                  child: const Text('Previous'),
                ),
              if (currentIndex < flashcards.length - 1)
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      currentIndex++;
                    });
                  },
                  child: const Text('Next'),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String text) {
    return Card(
      elevation: 4,
      child: Container(
        height: 200,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}