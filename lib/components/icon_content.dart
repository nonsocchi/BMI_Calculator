import 'package:flutter/material.dart';
import 'constants.dart';

class IconContentWidget extends StatelessWidget {
  final IconData cardIcon;
  final String label;
  const IconContentWidget({
    Key? key,
    required this.cardIcon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
