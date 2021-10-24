import 'package:dotaku/utils/theme/font.dart';
import 'package:flutter/material.dart';
import 'package:dotaku/model/hero.dart';

class SimilarHeroCard extends StatelessWidget {
  final Heroes heroes;
  final Function() onTap;
  const SimilarHeroCard({
    Key? key,
    required this.heroes,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: NetworkImage(heroes.img!), fit: BoxFit.cover)),
        child: Center(child: Text(heroes.name!, style: FontTheme.blackFontStyle)),
      ),
    );
  }
}
