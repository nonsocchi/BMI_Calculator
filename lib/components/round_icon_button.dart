import 'package:flutter/material.dart';

import 'constants.dart';

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
      shape: const CircleBorder(),
      child: Icon(buttonIcon),
    );
  }
}
