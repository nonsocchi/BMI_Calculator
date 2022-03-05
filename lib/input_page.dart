import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const activeContainerColor = Color(0xFF1D1E33);
const bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
              children: const [
                Expanded(
                  child: ReusableCard(
                    cardChild: IconContentWidget(
                      cardIcon: FontAwesomeIcons.mars,
                      cardText: 'MALE',
                    ),
                    cardColor: activeContainerColor,
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                  cardChild: IconContentWidget(
                    cardIcon: FontAwesomeIcons.venus,
                    cardText: 'FEMALE',
                  ),
                  cardColor: activeContainerColor,
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
