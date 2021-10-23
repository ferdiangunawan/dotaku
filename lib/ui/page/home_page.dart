import 'package:dotaku/common/commons.dart';
import 'package:dotaku/model/hero.dart';
import 'package:dotaku/service/hero_services.dart';
import 'package:dotaku/ui/widget/hero_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Commons.appBar(context: context, title: 'Dotaku'),
      body: Column(
        children: [
          FutureBuilder(
              future: Services.loadHero(),
              builder: (_, snap) {
                if (snap.hasData) {
                  final data = snap.data as List<Heroes>;
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (_, index) {
                        return HeroCard(heroes: data[index]);
                      });
                } else {
                  return Commons.loadingIndicator;
                }
              })
        ],
      ),
    );
  }
}
