import 'package:calculadora/controller/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:calculadora/widgets/calc_button.dart';
import 'package:calculadora/widgets/line_separator.dart';
import 'package:calculadora/widgets/main_result.dart';
import 'package:calculadora/widgets/sub_result.dart';
import 'package:get/get.dart';

class CalculatorScreen extends StatelessWidget {
  final calculatorCtrl = Get.put(CalculatorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: Container(),
            ),
            MathResults(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                  text: 'AC',
                  bgColor: Color(0xffA5A5A5),
                  onPressed: () => calculatorCtrl.clearAll(),
                ),
                CalculatorButton(
                  text: '+/-',
                  bgColor: Color(0xffA5A5A5),
                  onPressed: () => print('+/-'),
                ),
                CalculatorButton(
                  text: 'del',
                  bgColor: Color(0xffA5A5A5),
                  onPressed: () => calculatorCtrl.clear(),
                ),
                CalculatorButton(
                  text: '/',
                  bgColor: Color(0xffF0A23B),
                  onPressed: () => calculatorCtrl.inputOperator("/"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                  text: '7',
                  onPressed: () => calculatorCtrl.inputNumber("7"),
                ),
                CalculatorButton(
                  text: '8',
                  onPressed: () => calculatorCtrl.inputNumber("8"),
                ),
                CalculatorButton(
                  text: '9',
                  onPressed: () => calculatorCtrl.inputNumber("9"),
                ),
                CalculatorButton(
                  text: 'X',
                  bgColor: Color(0xffF0A23B),
                  onPressed: () => calculatorCtrl.inputOperator("*"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                  text: '4',
                  onPressed: () => calculatorCtrl.inputNumber("4"),
                ),
                CalculatorButton(
                  text: '5',
                  onPressed: () => calculatorCtrl.inputNumber("5"),
                ),
                CalculatorButton(
                  text: '6',
                  onPressed: () => calculatorCtrl.inputNumber("6"),
                ),
                CalculatorButton(
                  text: '-',
                  bgColor: Color(0xffF0A23B),
                  onPressed: () => calculatorCtrl.inputOperator("-"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                  text: '1',
                  onPressed: () => calculatorCtrl.inputNumber("1"),
                ),
                CalculatorButton(
                  text: '2',
                  onPressed: () => calculatorCtrl.inputNumber("2"),
                ),
                CalculatorButton(
                  text: '3',
                  onPressed: () => calculatorCtrl.inputNumber("3"),
                ),
                CalculatorButton(
                  text: '+',
                  bgColor: Color(0xffF0A23B),
                  onPressed: () => calculatorCtrl.inputOperator("+"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                  text: '0',
                  big: true,
                  onPressed: () => calculatorCtrl.inputNumber("0"),
                ),
                CalculatorButton(
                  text: '.',
                  onPressed: () => calculatorCtrl.inputNumber("."),
                ),
                CalculatorButton(
                  text: '=',
                  bgColor: Color(0xffF0A23B),
                  onPressed: () => calculatorCtrl.calculateResult(),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

class MathResults extends StatelessWidget {
  MathResults({Key? key}) : super(key: key);
  final calculatorCtrl = Get.find<CalculatorController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          SubResult(text: calculatorCtrl.firstOperand.value),
          SubResult(text: calculatorCtrl.operator.value),
          SubResult(text: calculatorCtrl.secondOperand.value),
          LineSeparator(),
          MainResultText(text: calculatorCtrl.display.value),
        ],
      ),
    );
  }
}
