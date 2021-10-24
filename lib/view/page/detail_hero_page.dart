import 'package:dotaku/utils/theme/color.dart';
import 'package:dotaku/utils/theme/font.dart';
import 'package:dotaku/view/widget/detail/detail_profile_card.dart';
import 'package:dotaku/view/widget/detail/similar_hero_card.dart';
import 'package:dotaku/view/widget/general/failed_fetch_page.dart';
import 'package:dotaku/view_model/heroes_similar_cubit/similar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:dotaku/utils/common/common.dart';
import 'package:dotaku/model/hero.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          backgroundColor: ColorTheme.accentColor,
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
                            child: Text(heroes.role, style: FontTheme.greyFontStyle.copyWith(fontSize: 16)),
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
                      style: FontTheme.whiteFontStyle.copyWith(fontSize: 22),
                    ),
                  ),
                  SimilarHeroGroup(heroes: heroes)
                ],
              ),
            ),
          )),
    );
  }
}

class SimilarHeroGroup extends StatelessWidget {
  const SimilarHeroGroup({
    Key? key,
    required this.heroes,
  }) : super(key: key);

  final Heroes heroes;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HeroesSimilarCubit, HeroesSimilarState>(builder: (_, state) {
      if (state is HeroesSimilarLoaded) {
        var data = state.heroesList!;
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
      } else if (state is HeroesSimilarLoading) {
        return Center(
          child: Commons.loadingIndicator(),
        );
      } else if (state is HeroesSimilarError) {
        return FailedFetchPage(
          pageId: 'home',
          message: state.message,
        );
      } else {
        return const FailedFetchPage(
          pageId: 'home',
        );
      }
    });
  }
}
