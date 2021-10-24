import 'package:dotaku/utils/common/common.dart';
import 'package:dotaku/utils/theme/color.dart';
import 'package:dotaku/view/page/detail_hero_page.dart';
import 'package:dotaku/view/widget/general/failed_fetch_page.dart';
import 'package:dotaku/view/widget/home/hero_card.dart';
import 'package:dotaku/view_model/heroes_cubit/heroes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.accentColor,
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
                  BlocBuilder<HeroesCubit, HeroesState>(builder: (_, state) {
                    if (state is HeroesLoaded) {
                      final data = state.heroesList!;
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
                    } else if (state is HeroesLoading) {
                      return Center(child: Commons.loadingIndicator());
                    } else {
                      return const FailedFetchPage();
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
