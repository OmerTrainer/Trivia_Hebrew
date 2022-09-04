import '../entities/questions_class.dart';
import '../entities/answer.dart';
import 'dart:math';

var mock = [
  Questions(
      question: "?באיזו סדרה הם מופיעים",
      answers: [
        Answer(
          title: "אחת שיודעת",
          correctAnswer: true,
          id: Random().nextInt(2000),
        ),
        Answer(
          title: "בתאל הבתולה",
          correctAnswer: false,
          id: Random().nextInt(2000),
        ),
        Answer(
          title: "אחת asfljsangpsangpas",
          correctAnswer: false,
          id: Random().nextInt(2000),
        ),
        Answer(
          title: "sga[poskg[paskg[askgלה",
          correctAnswer: false,
          id: Random().nextInt(2000),
        )
      ],
      imageUrl: "https://data.whicdn.com/images/312976051/original.jpg")
];
