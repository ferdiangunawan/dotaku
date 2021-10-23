import 'package:dotaku/model/hero.dart';
import 'package:dotaku/view/widget/detail/hero_detail_profile.dart';
import 'package:flutter/material.dart';

class DetailProfileCard extends StatelessWidget {
  const DetailProfileCard({
    Key? key,
    required this.heroes,
  }) : super(key: key);

  final Heroes heroes;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black45,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            child: HeroDetailProfile(
              title: 'Type',
              value: heroes.attackType ?? '-',
            ),
          ),
          Flexible(
            child: HeroDetailProfile(
              title: 'Max Atk',
              value: heroes.baseAttackMax.toString(),
            ),
          ),
          Flexible(
            child: HeroDetailProfile(
              title: 'Health',
              value: heroes.baseHealth.toString(),
            ),
          ),
          Flexible(
            child: HeroDetailProfile(
              title: 'MSPD',
              value: heroes.moveSpeed.toString(),
            ),
          ),
          Flexible(
            child: HeroDetailProfile(
              title: 'Attr',
              value: heroes.primaryAttr ?? '-',
            ),
          ),
        ],
      ),
    );
  }
}
