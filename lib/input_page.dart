import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'results_page.dart';
import 'bottom_button.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'round_icon_button.dart';
import 'constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int _height = 150;
  int _weight = 70;
  int _age = 19;

  void _weightDecrement() {
    setState(() {
      if (_weight > 0) {
        _weight--;
      }
    });
  }

  void _weightIncrement() {
    setState(() {
      _weight++;
    });
  }

  void _ageDecrement() {
    setState(() {
      if (_age > 0) {
        _age--;
      }
    });
  }

  void _ageIncrement() {
    setState(() {
      _age++;
    });
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
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 1.0,
                    inactiveTrackColor: kInactiveSliderColor,
                    activeTrackColor: Colors.white,
                    thumbColor: kBottomContainerColor,
                    overlayColor: const Color(0x1fEB1555),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 27.0),
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  ),
                  child: Slider(
                    value: _height.toDouble(),
                    min: kMinHeight,
                    max: kMaxHeight,
                    onChanged: (double newHeight) {
                      setState(() {
                        _height = newHeight.round();
                      });
                    },
                  ),
                ),
              ],
            ),
            cardColor: kActiveContainerColor,
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          _weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              updateWeight: _weightDecrement,
                              buttonIcon: FontAwesomeIcons.minus,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              updateWeight: _weightIncrement,
                              buttonIcon: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                    cardColor: kActiveContainerColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          _age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              updateWeight: _ageDecrement,
                              buttonIcon: FontAwesomeIcons.minus,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              updateWeight: _ageIncrement,
                              buttonIcon: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                    cardColor: kActiveContainerColor,
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonText: 'CALCULATE',
            toPage: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ResultsPage()));
            },
          ),
        ],
      ),
    );
  }
}
