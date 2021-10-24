class ChipModel {
  final String title;
  bool selected;
  ChipModel({
    required this.title,
    required this.selected,
  });
  static List<ChipModel> listChips = [
    ChipModel(title: 'Support', selected: false),
    ChipModel(title: 'Anti-Mage', selected: false),
    ChipModel(title: 'Disabler', selected: false),
    ChipModel(title: 'Jungler', selected: false),
    ChipModel(title: 'Pusher', selected: false),
    ChipModel(title: 'Carry', selected: false),
    ChipModel(title: 'Nuker', selected: false),
    ChipModel(title: 'Durable', selected: false),
    ChipModel(title: 'Escape', selected: false),
    ChipModel(title: 'Initiator', selected: false)
  ];
}
