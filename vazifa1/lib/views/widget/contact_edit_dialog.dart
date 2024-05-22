import 'package:flutter/material.dart';

class ContactEditDialog extends StatefulWidget {
   const ContactEditDialog({super.key});

  @override
  State<ContactEditDialog> createState() => _ContactEditDialogState();
}

class _ContactEditDialogState extends State<ContactEditDialog> {
  String name = '';
  String phone = '';

  final _formKey = GlobalKey<FormState>();

  void _edit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Edit contact"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'New name',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Iltimos ism kiriting";
                }
                return null;
              },
              onSaved: (newValue) {
                if (newValue != null) {
                  name = newValue;
                }
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'New phone number',
                  prefixIcon: Icon(Icons.add)),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Iltimos telefon raqam kiriting";
                } else if (!RegExp(r"^\d+$").hasMatch(value)) {
                  return "Iltimos to'g'ri telefon raqam kiriting";
                }

                return null;
              },
              onSaved: (newValue) {
                if (newValue != null) {
                  phone = newValue;
                }
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel")),
        ElevatedButton(
            onPressed: () {
              _edit();
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                Navigator.pop(context, {
                  "name": name,
                  "phone": phone,
                });
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, foregroundColor: Colors.white),
            child: const Text("O'zgartirish"))
      ],
    );
  }
}
