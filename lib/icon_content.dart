import 'package:flutter/material.dart';

class IconContentWidget extends StatelessWidget {
  final IconData cardIcon;
  final String cardText;
  const IconContentWidget({
    Key? key,
    required this.cardIcon,
    required this.cardText,
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
          cardText,
          style: const TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E98),
          ),
        ),
      ],
    );
  }
}
