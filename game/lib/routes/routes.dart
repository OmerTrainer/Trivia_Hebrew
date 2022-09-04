import 'package:flutter/material.dart';
import '../screens/quiz_page.dart';
import '../mock/questions_mock.dart';
import 'dart:math';

var rng = Random();

var questionsLength = mock.length;

var numberGenerated = rng.nextInt(questionsLength);

var customRoutes = <String, WidgetBuilder>{
  // '/': (context) => ScreenHome(),
  QuizScreen.routeName: (context) =>
      QuizScreen(question: mock[numberGenerated]),
};
