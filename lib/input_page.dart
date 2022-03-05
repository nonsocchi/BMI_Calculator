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
  Gender? selectedGender;

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
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      cardChild: const IconContentWidget(
                        cardIcon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                      cardColor: selectedGender == Gender.male
                          ? activeContainerColor
                          : inactiveContainerColor,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    // when female card is tapped
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      cardChild: const IconContentWidget(
                        cardIcon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                      cardColor: selectedGender == Gender.female
                          ? activeContainerColor
                          : inactiveContainerColor,
                    ),
                  ),
                ),
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
