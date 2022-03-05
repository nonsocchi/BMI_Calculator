import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int _height = 180;

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
                  child: ReusableCard(
                    tapCard: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    cardChild: const IconContentWidget(
                      cardIcon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                    cardColor: selectedGender == Gender.male
                        ? kActiveContainerColor
                        : kInactiveContainerColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    tapCard: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    cardChild: const IconContentWidget(
                      cardIcon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                    cardColor: selectedGender == Gender.female
                        ? kActiveContainerColor
                        : kInactiveContainerColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'HEIGHT',
                  style: kLabelTextStyle,
                ),
                Row(
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      _height.toString(),
                      style: kNumberTextStyle,
                    ),
                    const Text(
                      'cm',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                Slider(
                  value: _height.toDouble(),
                  min: kMinHeight,
                  max: kMaxHeight,
                  activeColor: kBottomContainerColor,
                  inactiveColor: kInactiveSliderColor,
                  onChanged: (double newHeight) {
                    setState(() {
                      _height = newHeight.round();
                    });
                  },
                ),
              ],
            ),
            cardColor: kActiveContainerColor,
          )),
          Expanded(
            child: Row(
              children: const [
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveContainerColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveContainerColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: kBottomContainerColor,
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
