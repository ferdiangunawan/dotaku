import 'package:dotaku/model/chips.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final _selectedList = [
    ChipModel(title: 'Support', selected: false),
    ChipModel(title: 'Disabler', selected: false),
    ChipModel(title: 'Jungler', selected: false),
    ChipModel(title: 'Pusher', selected: false),
    ChipModel(title: 'Carry', selected: false),
    ChipModel(title: 'Nuker', selected: false),
    ChipModel(title: 'Durable', selected: false),
    ChipModel(title: 'Escape', selected: false),
    ChipModel(title: 'Initiator', selected: false)
  ].obs;

  List<ChipModel> get chipList => _selectedList;

  void setEnable(int index, bool value) => _selectedList[index].selected = value;

  void resetSelected() {
    for (var i in _selectedList) {
      i.selected = false;
    }
  }
}
