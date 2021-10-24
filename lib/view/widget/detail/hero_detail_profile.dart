import 'package:dotaku/utils/theme/font.dart';
import 'package:flutter/material.dart';

class HeroDetailProfile extends StatelessWidget {
  final String title;
  final String value;
  const HeroDetailProfile({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          title,
          style: FontTheme.greyFontStyle,
        ),
        FittedBox(
          child: Text(
            value,
            style: FontTheme.whiteFontStyle.copyWith(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
