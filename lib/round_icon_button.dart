import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData buttonIcon;
  final VoidCallback? updateWeight;

  const RoundIconButton(
      {Key? key, required this.buttonIcon, required this.updateWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      onPressed: updateWeight,
      fillColor: kButtonColor,
      shape: CircleBorder(),
      child: Icon(buttonIcon),
    );
  }
}
