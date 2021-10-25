import 'package:flutter/material.dart';

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
