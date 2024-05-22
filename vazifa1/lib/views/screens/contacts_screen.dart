import 'package:dars_1/controllers/contacts_controller.dart';
import 'package:dars_1/views/widget/contact_add_dialog.dart';
import 'package:dars_1/views/widget/contact_edit_dialog.dart';
import 'package:dars_1/views/widget/contact_item.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final ContactsController contactsController = ContactsController();

  void delete(int index) {
    contactsController.delete(index);
    setState(() {});
  }

  void edit(int index) async {
    Map<String, dynamic>? data = await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (ctx) {
          return const ContactEditDialog();
        });

    if (data != null) {
      contactsController.edit(data['name'], data['phone'], index);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: contactsController.lst.length,
          itemBuilder: (ctx, index) {
            return ContactItem(
              contactsController.lst[index],
              edit: () => edit(index),
              onDelete: () => delete(index),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Map<String, dynamic>? data = await showDialog(
              barrierDismissible: false,
              context: context,
              builder: (ctx) {
                return const ContactAddDialog();
              });
          if (data != null) {
            contactsController.add(data['name'], data['phone']);
            setState(() {});
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
