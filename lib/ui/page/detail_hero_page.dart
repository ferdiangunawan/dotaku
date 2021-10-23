import 'package:dotaku/service/hero_services.dart';
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
          backgroundColor: Colors.black,
          appBar: Commons.appBar(context: context, title: heroes.name!),
          body: SingleChildScrollView(
            child: Column(
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
                    child: Align(alignment: Alignment.bottomCenter, child: Text(heroes.role, style: whiteFontStyle)),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                DetailProfileCard(heroes: heroes),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Similar Heroes',
                  style: whiteFontStyle.copyWith(fontSize: 22),
                ),
                // heroes.primaryAttr == 'agi'
                //     ? Column(
                //         children: heroesList
                //             .where((element) => element.primaryAttr == 'agi')
                //             .map((e) => Text(
                //                   e.name!,
                //                   style: whiteFontStyle,
                //                 ))
                //             .take(3)
                //             .toList())
                //     : const SizedBox(),
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
                                return Text(data[index].name!, style: whiteFontStyle);
                              });
                        } else {
                          return Text(
                            'no data',
                            style: whiteFontStyle,
                          );
                        }
                      } else {
                        return Commons.loadingIndicator();
                      }
                    })
              ],
            ),
          )),
    );
  }
}

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
        color: accentColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          HeroDetailProfile(
            title: 'Type',
            value: heroes.attackType ?? '-',
          ),
          HeroDetailProfile(
            title: 'Max Atk',
            value: heroes.baseAttackMax.toString(),
          ),
          HeroDetailProfile(
            title: 'Health',
            value: heroes.baseHealth.toString(),
          ),
          HeroDetailProfile(
            title: 'MSPD',
            value: heroes.moveSpeed.toString(),
          ),
          HeroDetailProfile(
            title: 'Attr',
            value: heroes.primaryAttr ?? '-',
          )
        ],
      ),
    );
  }
}

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
          style: greyFontStyle,
        ),
        FittedBox(
          child: Text(
            value,
            style: whiteFontStyle.copyWith(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
