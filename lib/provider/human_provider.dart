import 'package:flutter/foundation.dart';
import 'package:apalah/models/human_data.dart';

class HumanProvider with ChangeNotifier {
  List<Human> _humans = Human.dataHuman();

  List<Human> get humans => _humans;

  void toggleCheck(int index) {
    _humans[index].check = !_humans[index].check;
    notifyListeners();
  }

  int get totalSavedValue {
    int total = 0;

    for (int i = 0; i < _humans.length; i++) {
      if (_humans[i].check) {
        total += _humans[i].value;
      }
    }
    return total;
  }
}
