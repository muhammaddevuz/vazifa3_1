import 'dart:math';

import 'package:dars_1/models/contact.dart';
import 'package:flutter/material.dart';

class ContactsController {
  final List<Contact> _lst = [
    Contact(name: "Ali", phone: "+998940276091", color: Colors.amber),
    Contact(name: "Vali", phone: "+998941404040", color: Colors.red),
    Contact(name: "Hali", phone: "+998940014011", color: Colors.green),
  ];

  List<Contact> get lst {
    return _lst;
  }

  void add(String name, String phone) {
    int red = Random().nextInt(255);
    int green = Random().nextInt(255);
    int blue = Random().nextInt(255);

    _lst.add(
      Contact(
          name: name,
          phone: phone,
          color: Color.fromARGB(255, red, green, blue)),
    );
  }

  void edit(String name, String phone, int i) {
    _lst[i].name = name;
    _lst[i].phone = phone;
  }

  void delete(int index) {
    _lst.removeAt(index);
  }
}
