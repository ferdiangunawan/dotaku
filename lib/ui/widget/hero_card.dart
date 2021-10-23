import 'package:flutter/material.dart';
import 'package:dotaku/model/hero.dart';
import 'package:dotaku/utils/constant.dart';
import 'package:dotaku/utils/styles.dart';

class HeroCard extends StatelessWidget {
  final Heroes heroes;
  final Function() onTap;
  const HeroCard({
    Key? key,
    required this.heroes,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var roles = heroes.roles.toString();
    var primaryAtt = heroes.primaryAttr!;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                    color: Colors.grey.shade200,
                    image: DecorationImage(image: NetworkImage(ApiRef.heroImage + heroes.img!), fit: BoxFit.cover))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(heroes.name ?? 'unknown',
                      style: whiteFontStyle.copyWith(fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
                  Text(roles.substring(1, roles.length - 1), style: greyFontStyle, overflow: TextOverflow.ellipsis, maxLines: 1),
                  Row(
                    children: [
                      IndicatorAtt(primaryAtt: primaryAtt),
                      const SizedBox(width: 5),
                      Text(heroes.primaryAttr!, style: greyFontStyle),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IndicatorAtt extends StatelessWidget {
  const IndicatorAtt({
    Key? key,
    required this.primaryAtt,
  }) : super(key: key);

  final String primaryAtt;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 5,
        height: 5,
        decoration: BoxDecoration(
            color: primaryAtt == 'agi'
                ? Colors.green
                : primaryAtt == 'int'
                    ? Colors.blue
                    : Colors.red,
            shape: BoxShape.circle));
  }
}
