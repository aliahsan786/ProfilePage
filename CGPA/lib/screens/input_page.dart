import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:intl/intl.dart';
enum Gender {
  male,
  female,
}
int totle = 100;
int ObtainMarks = 20;
int theoryCredit = 2;
int labCredit = 2;
DateTime startDate;
DateTime endDate;
int gpf_value;
int height=1000;


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    void _presentDatePicker(bool hel) {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2010),
        lastDate: DateTime.now(),
      ).then((pickerDate) {
        if (pickerDate == null) {
          return;
        }
        if(hel==true){setState(() {
          startDate=pickerDate;
        });
        }if(hel==false){setState(() {
          endDate=pickerDate;
        });
        }
      });

    }
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('GPF CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(flex: 3,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Starting Date',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                     startDate==null ?Text('') : Text(
                       DateFormat.yMMMd().format(startDate,
                       ),)

                    ],
                  ),
                  FloatingActionButton(backgroundColor: Colors.redAccent,child: Center(child: Icon(Icons.add,color: Colors.white70,),),
                      onPressed:(){_presentDatePicker(true);
                  } )
                ],
              ),
            ),
          ),
          Expanded(flex: 3,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'End Date ',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      endDate==null ?Text('') : Text(
                        DateFormat.yMMMd().format(
                         endDate,
                        ),)

                    ],
                  ),
                  FloatingActionButton(backgroundColor: Colors.redAccent,child: Center(child: Icon(Icons.add,color: Colors.white70,),),
                      onPressed:(){_presentDatePicker(false);
                      } )
                ],
              ),
            ),
          ),
          Expanded(flex: 3,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Deduction OG Scale',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        '',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                      RoundSliderThumbShape(enabledThumbRadius: 10.0),
                      overlayShape:
                      RoundSliderOverlayShape(overlayRadius: 20.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 1.0,
                      max: 6000.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),


          Expanded(flex: 1,
            child: BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
          CalculatorBrain calc =
                    CalculatorBrain(totle: totle, Obtain: height);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
