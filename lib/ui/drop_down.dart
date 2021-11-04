import 'package:flutter/material.dart';

Widget dropDown() {
  MaterialColor _chosenValue = Colors.blue;

  return DropdownButton<MaterialColor>(
    value: _chosenValue,
    //elevation: 5,
    style: TextStyle(color: Colors.black),

    items: <MaterialColor>[
      Colors.blue,
      Colors.red,
      Colors.amber
    ].map<DropdownMenuItem<MaterialColor>>((MaterialColor value) {
      return DropdownMenuItem<MaterialColor>(
        value: value,
        child: Text('New color', style: TextStyle(color: value),),
      );
    }).toList(),
    hint: const Text(
      "Please choose a color theme",
      style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w600),
    ),
  );
}