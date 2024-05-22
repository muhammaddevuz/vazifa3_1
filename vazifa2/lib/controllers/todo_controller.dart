import 'package:dars_1/models/todo.dart';

class ToDoController {
  final List<ToDo> _lst = [
    ToDo(title: "Swimming", check: true),
    ToDo(title: "Eating", check: true),
    ToDo(title: "Driving", check: true)
  ];

  List<ToDo> get lst {
    return _lst;
  }

  void add(String title) {
    _lst.add(ToDo(title: title, check: true));
  }

  void changeposition(int i) {
    _lst[i].check = !_lst[i].check;
  }

  void edit(String title, int i) {
    _lst[i].title = title;
  }

  void delete(int index) {
    _lst.removeAt(index);
  }

  List counter() {
    int compleated = 0;
    int uncompleated = 0;
    for (var element in _lst) {
      if (element.check == true) {
        uncompleated++;
      } else {
        compleated++;
      }
    }

    return [compleated, uncompleated];
  }
}
