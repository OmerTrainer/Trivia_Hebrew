// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class Answer extends StatefulWidget {
//   const Answer({Key? key}) : super(key: key);

//   @override
//   State<Answer> createState() => _AnswerState();
// }

// class _AnswerState extends State<Answer> {
//   @override
//   Widget build(BuildContext context) {
//    return ElevatedButton(
//                     onPressed: () {
//                       if (widget.question.answers[index].correctAnswer) {
//                         setState(() {
//                           pressAttention = true;
//                         });
//                       } else {
//                           setState(() {
//                           pressAttention = true;
//                         });
//                       }
//                     },
//                     child: Text(widget.question.answers[index].title),
//                     style: ElevatedButton.styleFrom(
//                       primary:
                      
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(18), // <-- Radius
//                       ),
//                     ),
//                   );
//   }
// }