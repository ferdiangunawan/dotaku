import 'package:dotaku/model/hero.dart';
import 'package:flutter/material.dart';

class DetailHeroPage extends StatelessWidget {
  final Heroes heroes;
  const DetailHeroPage({
    Key? key,
    required this.heroes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Hero'),
      ),
    );
  }
}
