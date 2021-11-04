import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:blocpattern/api/data.dart';
import 'package:blocpattern/api/request.dart';

Widget loginForm(BuildContext context) {
  final _formKey = GlobalKey<FormState>();
  Post post = Post(email: "", password: "");

  return Form(
    key: _formKey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          initialValue: "eve.holt@reqres.in",
          decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Email'
          ),
          // The validator receives the text that the user has entered.
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            } else {
              post.email = value;
            }
            return null;
          },
        ),
        TextFormField(
          initialValue: "cityslicka",
          decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Password'
          ),
          // The validator receives the text that the user has entered.
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            } else {
              post.password = value;
            }
            return null;
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ElevatedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                final client = ApiRequestUser(
                    Dio(BaseOptions(contentType: "application/json")),
                    baseUrl: 'https://reqres.in/api');
                print("TRY");
                try {
                  Future _future = client.login(post);
                  _future.then((value) {
//                    Provider.of<DATA>(context, listen: false).setToken = value.token.toString();
                    _future = client.getUserData("12");
                    _future.then((value) {
//                      Provider.of<DATA>(context, listen: false).userData = value.data;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Done! Token: ' + value.token.toString())),
                    );
                  });
                } catch(err) {
                  print(err);
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
            },
            child: const Text('Submit'),
          ),
        ),
      ],
    ),
  );
}