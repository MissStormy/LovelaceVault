import 'package:flutter/material.dart';

class EditPopup extends StatelessWidget {
  final String title;
  final String initialValue;
  final Function(String) onSubmit;

  const EditPopup({
    required this.title,
    required this.initialValue,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    String newValue = initialValue;

    return AlertDialog(
      title: Text(title),
      content: TextField(
        autofocus: true,
        onChanged: (value) => newValue = value,
        decoration: InputDecoration(hintText: initialValue),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            onSubmit(newValue);
            Navigator.of(context).pop();
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}
