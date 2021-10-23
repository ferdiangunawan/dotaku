import 'package:dotaku/model/hero.dart';
import 'package:dotaku/utils/styles.dart';
import 'package:flutter/material.dart';

class HeroCard extends StatelessWidget {
  final Heroes heroes;
  const HeroCard({
    Key? key,
    required this.heroes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 300,
        height: 400,
        decoration: const BoxDecoration(color: Colors.black87),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: 150,
                decoration:
                    BoxDecoration(color: Colors.grey.shade200, image: DecorationImage(image: NetworkImage(heroes.img ?? 'url'), fit: BoxFit.cover))),
            Text(
              heroes.name ?? 'unknown',
              style: whiteFontStyle.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(heroes.roles.toString(), style: whiteFontStyle.copyWith(fontWeight: FontWeight.bold)),
            Text(heroes.primaryAttr.toString(), style: whiteFontStyle.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
