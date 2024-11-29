import 'package:flutter/material.dart';
import 'ques_ans.dart';

class AddFlashcardPage extends StatefulWidget {
  @override
  _AddFlashcardPageState createState() => _AddFlashcardPageState();
}

class _AddFlashcardPageState extends State<AddFlashcardPage> {
  final _questionController = TextEditingController();
  final _answerController = TextEditingController();

  void _addFlashcard() {
    if (_questionController.text.isNotEmpty && _answerController.text.isNotEmpty) {
      setState(() {
   
        qaList.add(Flashcard(
          question: _questionController.text,
          answer: _answerController.text,
        ));
      });

      _questionController.clear();
      _answerController.clear();

      Navigator.pop(context);
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter the Question and Answer of your choice"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _questionController,
              decoration: InputDecoration(
                labelText: 'Enter Question',
              ),
            ),
            TextField(
              controller: _answerController,
              decoration: InputDecoration(
                labelText: 'Enter Answer',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addFlashcard, 
              child: Text("Add Flashcard"),
            ),
          ],
        ),
      ),
    );
  }
}