import 'package:dotaku/view_model/controller/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dotaku/utils/common/common.dart';
import 'package:dotaku/utils/theme/color.dart';
import 'package:dotaku/view/page/detail_hero_page.dart';
import 'package:dotaku/view/widget/general/failed_fetch_page.dart';
import 'package:dotaku/view/widget/home/hero_card.dart';
import 'package:dotaku/view_model/heroes_cubit/heroes_cubit.dart';
import 'package:dotaku/view_model/heroes_similar_cubit/similar_cubit.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<HeroesCubit>();
    var con = Get.put(CategoryController());
    return Scaffold(
      backgroundColor: ColorTheme.accentColor,
      appBar: Commons.appBar(context: context, title: 'Dotaku'),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () async {
          bloc.fetchHeroes();
          con.resetSelected();
          setState(() {});
        },
        child: Scrollbar(
          isAlwaysShown: false,
          radius: const Radius.circular(2),
          interactive: true,
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  children: [
                    Obx(
                      () => Wrap(
                        children: con.chipList.map((e) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Chips(
                              title: e.title,
                              selected: e.selected,
                              onSelected: (value) {
                                con.setEnable(con.chipList.indexOf(e), value);
                                bloc.filterHeroes(e.title, value);
                                setState(() {});
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    ),
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
                                    onTap: () async {
                                      context.read<HeroesSimilarCubit>().fetchSimilarHeroes(data[index].primaryAttr!);
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
                      } else if (state is HeroesError) {
                        return FailedFetchPage(
                          pageId: 'home',
                          message: state.message,
                        );
                      } else {
                        return const FailedFetchPage(
                          pageId: 'home',
                        );
                      }
                    })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Chips extends StatelessWidget {
  final String title;
  final bool selected;
  final Function(bool) onSelected;
  const Chips({
    Key? key,
    required this.title,
    required this.selected,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        title,
      ),
      selected: selected,
      onSelected: onSelected,
    );
  }
}
