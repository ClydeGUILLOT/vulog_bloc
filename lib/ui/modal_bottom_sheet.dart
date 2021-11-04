import 'package:flutter/material.dart';
import 'package:blocpattern/functions/capitalize_string.dart';

void showModal(BuildContext context, String title, String img) {
  showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(title.capitalize(), style: const TextStyle(fontSize: 26)),
            Image.network(
              img,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
            ),
            ElevatedButton(
              child: const Text('Close',),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  });
}