import 'package:flutter/material.dart';

import 'constants.dart';
import 'results_page.dart';

class BottomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback toPage;
  const BottomButton({Key? key, required this.buttonText, required this.toPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toPage,
      child: Container(
        child: Center(
          child: Text(
            buttonText,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: kBottomContainerColor,
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
