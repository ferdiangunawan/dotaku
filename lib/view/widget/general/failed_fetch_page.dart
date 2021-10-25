import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dotaku/utils/theme/font.dart';
import 'package:dotaku/view_model/heroes_cubit/heroes_cubit.dart';
import 'package:dotaku/view_model/heroes_similar_cubit/similar_cubit.dart';

class FailedFetchPage extends StatelessWidget {
  final String pageId;
  final String? message;
  final String? attr;
  const FailedFetchPage({
    Key? key,
    required this.pageId,
    this.message,
    this.attr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/warn.png'), fit: BoxFit.cover)),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          message ?? "I'm sorry",
          style: FontTheme.whiteFontStyle,
          maxLines: 2,
        ),
        const SizedBox(
          height: 5,
        ),
        MaterialButton(
            color: Colors.grey,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {
              if (pageId == 'home') {
                context.read<HeroesCubit>().fetchHeroes();
              } else if (pageId == 'similar') {
                context.read<HeroesSimilarCubit>().fetchSimilarHeroes(attr!);
              }
            },
            child: Text('Try Again', style: FontTheme.blackFontStyle.copyWith(fontSize: 14))),
      ],
    );
  }
}
