import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'input_page.dart';
import 'results_page.dart';

class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[ Expanded(
          child: Column(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onPress: () { Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InputPage(

                        ),
                      )
                  );

                  },

                  cardChild: IconContent(
                    icon: FontAwesomeIcons.pager,
                    label: 'GPA',
                  ),
                ),
              ),Expanded(
                child: ReusableCard(
                  onPress: () { Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InputPage(

                        ),
                      )
                  );
                  },

                  cardChild: IconContent(
                    icon: FontAwesomeIcons.pager,
                    label: 'SGPA',
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InputPage(

                      ),
                    )
                  );

                  },

                  cardChild: IconContent(
                    icon: FontAwesomeIcons.pager,
                    label: 'CGPA',
                  ),
                ),
              ),
            ],
          )),

 ]));}}
