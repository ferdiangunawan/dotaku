import 'package:dotaku/common/commons.dart';
import 'package:dotaku/model/hero.dart';
import 'package:dotaku/service/hero_services.dart';
import 'package:dotaku/utils/styles.dart';
import 'package:dotaku/view/page/detail_hero_page.dart';
import 'package:dotaku/view/widget/home/hero_card.dart';
import 'package:dotaku/views/page/failed_fetch_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: accentColor,
      appBar: Commons.appBar(context: context, title: 'Dotaku'),
      body: Scrollbar(
        isAlwaysShown: false,
        radius: const Radius.circular(2),
        interactive: true,
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                children: [
                  FutureBuilder(
                      future: Services.loadHero(),
                      builder: (_, snap) {
                        if (snap.connectionState == ConnectionState.done) {
                          if (snap.hasData) {
                            final data = snap.data as List<Heroes>;
                            return GridView.count(
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: 2,
                                children: List.generate(
                                  data.length,
                                  (index) {
                                    return Hero(
                                      tag: '$index',
                                      child: HeroCard(
                                        heroes: data[index],
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => DetailHeroPage(
                                                        heroes: data[index],
                                                        index: index,
                                                        heroesList: data,
                                                      )));
                                        },
                                      ),
                                    );
                                  },
                                ));
                          } else {
                            return const Center(child: FailedFetchPage());
                          }
                        } else {
                          return Center(child: Commons.loadingIndicator());
                        }
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
