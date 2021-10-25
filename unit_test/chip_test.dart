import 'package:dotaku/view_model/controller/category_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  group('Chip choice Filter', () {
    var con = Get.put(CategoryController());
    test('Chip initial -> all false', () {
      for (int i = 0; i < con.chipList.length; i++) {
        expect(con.chipList[i].selected, false);
      }
    });

    test('2 filter Selected', () {
      con.setEnable(1, true);
      con.setEnable(2, true);

      expect(con.chipList[1].selected && con.chipList[2].selected, true);
    });
  });
}
