import 'package:dars_1/controllers/contacts_controller.dart';
import 'package:dars_1/models/contact.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContactItem extends StatefulWidget {
  final Function() onDelete;
  final Function() edit;
  final Contact contact;
  const ContactItem(this.contact,
      {super.key, required this.onDelete,required this.edit});

  @override
  // ignore: no_logic_in_create_state
  State<ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<ContactItem> {
  final ContactsController contactsController = ContactsController();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: widget.contact.color,
      ),
      title: Text(widget.contact.name),
      subtitle: Text(widget.contact.phone),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: widget.edit,
              icon: const Icon(
                Icons.edit,
                color: Colors.blue,
              )),
          IconButton(
              onPressed: widget.onDelete,
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ))
        ],
      ),
    );
  }
}
