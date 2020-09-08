import 'package:flutter/material.dart';

bool isNumeric(String value) {
  if (value.isEmpty) return false;
  final n = num.tryParse(value);

  return (n == null) ? false : true;
}

mostrarAlerta(BuildContext context, String mensaje) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Información Incorrecta'),
        content: Text(mensaje),
        actions: <Widget>[
          FlatButton(
              onPressed: () => Navigator.of(context).pop(), child: Text('Ok'))
        ],
      );
    },
  );
}
