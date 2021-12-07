import 'dart:math';
import 'screens/input_page.dart';
class CalculatorBrain {
  CalculatorBrain({this.totle, this.Obtain});

  final int totle;
  final int Obtain;
  final int Credit=theoryCredit+labCredit;

  double _cgp;

  String calculateBMI() {
    _cgp=(Obtain/totle)*Credit;
    return _cgp.toStringAsFixed(1);
  }

  String getResult() {
    if (_cgp >= (Credit*(3/4))) {
      return 'Better';
    } else if (_cgp > Credit/2) {
      return 'Normal';
    } else {
      return 'Bad';
    }
  }
  final difference = endDate.difference(startDate).inDays;
  String getInterpretation() {
    if (_cgp >= (Credit*(3/4))) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_cgp > Credit/2) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }

    print(difference);print('Hello');
  }
}
