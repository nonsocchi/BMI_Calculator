import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const activeContainerColor = Color(0xFF1D1E33);
const inactiveContainerColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveContainerColor;
  Color femaleCardColor = inactiveContainerColor;

  // 1 = male; 2 = female
  void updateColor(Gender gender) {
    if (gender == Gender.male) {
      if (maleCardColor == inactiveContainerColor) {
        maleCardColor = activeContainerColor;
        femaleCardColor = inactiveContainerColor;
      } else {
        maleCardColor = inactiveContainerColor;
      }
    }
    if (gender == Gender.female) {
      if (femaleCardColor == inactiveContainerColor) {
        femaleCardColor = activeContainerColor;
        maleCardColor = inactiveContainerColor;
      } else {
        femaleCardColor = inactiveContainerColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    // when male card is tapped
                    onTap: () {
                      setState(() {
                        updateColor(Gender.male);
                      });
                    },
                    child: ReusableCard(
                      cardChild: const IconContentWidget(
                        cardIcon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                      cardColor: maleCardColor,
                    ),
                  ),
                ),
                Expanded(
                    child: GestureDetector(
                  // when female card is tapped
                  onTap: () {
                    setState(() {
                      updateColor(Gender.female);
                    });
                  },
                  child: ReusableCard(
                    cardChild: const IconContentWidget(
                      cardIcon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                    cardColor: femaleCardColor,
                  ),
                )),
              ],
            ),
          ),
          const Expanded(
              child: ReusableCard(
            cardColor: activeContainerColor,
          )),
          Expanded(
            child: Row(
              children: const [
                Expanded(
                  child: ReusableCard(
                    cardColor: activeContainerColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: activeContainerColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
