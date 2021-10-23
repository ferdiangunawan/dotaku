import 'package:dotaku/common/commons.dart';
import 'package:dotaku/model/hero.dart';
import 'package:dotaku/service/hero_services.dart';
import 'package:dotaku/ui/page/detail_hero_page.dart';
import 'package:dotaku/ui/widget/hero_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: Commons.appBar(context: context, title: 'Dotaku'),
      appBar: AppBar(
        title: const Text('Dotaku'),
        backgroundColor: Colors.black26,
      ),
      body: ListView(
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
                                10,
                                (index) {
                                  return HeroCard(
                                    heroes: data[index],
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => DetailHeroPage(
                                                    heroes: data[index],
                                                  )));
                                    },
                                  );
                                },
                              ));
                        } else {
                          return const Center(child: Text("No data"));
                        }
                      } else {
                        return const Text('waiting ...');
                      }
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
