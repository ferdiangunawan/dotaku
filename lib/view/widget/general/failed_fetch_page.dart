import 'package:dotaku/utils/styles.dart';
import 'package:flutter/material.dart';

class FailedFetchPage extends StatelessWidget {
  const FailedFetchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/warn.png'), fit: BoxFit.cover)),
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
          onPressed: () {},
          child: Text('Try Again', style: whiteFontStyle.copyWith(fontSize: 18)),
        ),
      ],
    );
  }
}
