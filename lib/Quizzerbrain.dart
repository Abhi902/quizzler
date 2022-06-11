import 'package:quizzler/questionclass.dart';

class Quizbrain {
  int questionnumber = 0;

  List<Question> _Questionbank = [
    Question(s: 'Some cats are actually allergic to humans', ans: true),
    Question(
        s: 'You can lead a cow down stairs but not up stairs.', ans: false),
    Question(
        s: 'Approximately one quarter of human bones are in the feet.',
        ans: true),
    Question(s: 'A slug\'s blood is green.', ans: true),
    Question(
        s: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', ans: true),
    Question(s: 'It is illegal to pee in the Ocean in Portugal.', ans: true),
    Question(
        s: 'No piece of square dry paper can be folded in half more than 7 times.',
        ans: false),
    Question(
        s: 'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        ans: true),
    Question(
        s: 'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        ans: false),
    Question(
        s: 'The total surface area of two human lungs is approximately 70 square metres.',
        ans: true),
    Question(s: 'Google was originally called \"Backrub\".', ans: true),
    Question(
        s: 'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        ans: true),
    Question(
        s: 'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        ans: true),
  ];

  void check() {
    print(questionnumber);
    if (questionnumber < _Questionbank.length - 1) {
      questionnumber++;
    }
  }

  bool isFinished() {
    if (questionnumber >= _Questionbank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    questionnumber = 0;
  }

  String getQuestionText() {
    return _Questionbank[questionnumber].a;
  }

  bool getans() {
    return _Questionbank[questionnumber].x;
  }
}
