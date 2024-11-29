import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'add_flashcard_page.dart';
import '../ques_ans.dart';
import 'flash_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _curIndexNum = 0;


  final _questionController = TextEditingController();
  final _answerController = TextEditingController();

  // Function to add a new flashcard
  void _addFlashcard() {
    setState(() {
      qaList.add(Flashcard(
        question: _questionController.text,
        answer: _answerController.text,
      ));
      _questionController.clear();
      _answerController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: Colors.grey.shade100,

        appBar: AppBar(
            centerTitle: true,
            title: Text("Flashcards Learning App", style: TextStyle(fontSize: 25)),
            backgroundColor: Colors.green[700],
            toolbarHeight: 70,
            elevation: 5,
            shadowColor: Colors.green[700],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))
        ),

        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                          
              SizedBox(
                  width: 300,
                  height: 300,
                  child: FlipCard(
                      direction: FlipDirection.HORIZONTAL,
                      front: FlashCard(
                          text: qaList[_curIndexNum].question),
                      back: FlashCard(
                          text: qaList[_curIndexNum].answer)
                          )
              ),


              Text("Tap to view Answer", style: TextStyle(fontSize: 15)),
              
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ElevatedButton.icon(
                        onPressed: () {
                          showPreviousCard();
                        },
                        icon: Icon(Icons.arrow_left, size: 30,color: Color(0xFFE4E4E4),),
                        label: Text(""),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[700],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.only(
                                right: 20, left: 25, top: 15, bottom: 15))),
                    ElevatedButton.icon(//
                        onPressed: () {
                          showNextCard();
                        },
                        icon: Icon(Icons.arrow_right, size: 30, color:  Color(0xFFE4E4E4),),
                        label: Text(""),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[700],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.only(
                                right: 20, left: 25, top: 15, bottom: 15))
                                )
                  ],
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=> AddFlashcardPage())
                        );
                    },

                    child: Text("Add FlashCard",style: TextStyle(fontSize: 10, letterSpacing: 1.0,fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center,) ,

                    style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[700],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.only(
                                right: 20, left: 25, top: 15, bottom: 15))
                    
                    ),
            ]
          )
        )
      );
  }


  void showNextCard() {
    setState(() {
      _curIndexNum = (_curIndexNum + 1 < qaList.length)
          ? _curIndexNum + 1
          : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      _curIndexNum = (_curIndexNum - 1 >= 0)
          ? _curIndexNum - 1
          : qaList.length - 1;
    });
  }
}