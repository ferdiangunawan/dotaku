import 'package:dotaku/service/hero_services.dart';
import 'package:dotaku/view/page/failed_fetch_page.dart';
import 'package:dotaku/view/widget/detail/detail_profile_card.dart';
import 'package:dotaku/view/widget/detail/similar_hero_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:dotaku/common/commons.dart';
import 'package:dotaku/model/hero.dart';
import 'package:dotaku/utils/styles.dart';

class DetailHeroPage extends StatelessWidget {
  final List<Heroes> heroesList;
  final Heroes heroes;
  final int index;
  const DetailHeroPage({
    Key? key,
    required this.heroesList,
    required this.heroes,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '$index',
      child: Scaffold(
          backgroundColor: accentColor,
          appBar: Commons.appBar(context: context, title: heroes.name!),
          body: SingleChildScrollView(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(heroes.img!), fit: BoxFit.cover)),
                    child: Container(
                      width: double.infinity,
                      height: 250,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [Colors.black, Colors.transparent], begin: Alignment.bottomCenter, end: Alignment.center)),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(heroes.role, style: greyFontStyle.copyWith(fontSize: 16)),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DetailProfileCard(heroes: heroes),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      'Similar Heroes',
                      style: whiteFontStyle.copyWith(fontSize: 22),
                    ),
                  ),
                  FutureBuilder(
                      future: Services.similarHero(heroes.primaryAttr!),
                      builder: (_, snap) {
                        if (snap.connectionState == ConnectionState.done) {
                          if (snap.hasData) {
                            var data = snap.data as List<Heroes>;
                            if (heroes.primaryAttr == 'agi') {
                              data.sort((b, a) => (a.moveSpeed!.compareTo(b.moveSpeed!)));
                            } else if (heroes.primaryAttr == 'str') {
                              data.sort((b, a) => (a.baseAttackMax!.compareTo(b.baseAttackMax!)));
                            } else {
                              data.sort((b, a) => (a.baseMana!.compareTo(b.baseMana!)));
                            }
                            return ListView.builder(
                                itemCount: 3,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (_, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                    child: SimilarHeroCard(
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
                                });
                          } else {
                            return const FailedFetchPage();
                          }
                        } else {
                          return Center(child: Commons.loadingIndicator());
                        }
                      })
                ],
              ),
            ),
          )),
    );
  }
}
