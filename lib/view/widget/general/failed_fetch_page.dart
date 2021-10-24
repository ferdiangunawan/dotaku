import 'package:dotaku/utils/theme/font.dart';
import 'package:flutter/material.dart';

class FailedFetchPage extends StatefulWidget {
  const FailedFetchPage({Key? key}) : super(key: key);

  @override
  State<FailedFetchPage> createState() => _FailedFetchPageState();
}

class _FailedFetchPageState extends State<FailedFetchPage> {
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
        TextButton(
          onPressed: () {
            setState(() {});
          },
          child: Text('Try Again', style: FontTheme.whiteFontStyle.copyWith(fontSize: 18)),
        ),
      ],
    );
  }
}
