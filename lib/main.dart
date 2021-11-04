import 'package:blocpattern/bloc_pattern/dogs_query.dart';
import 'package:flutter/material.dart';
import 'package:blocpattern/views/dog_listview.dart';
import 'package:blocpattern/views/loading.dart';
import 'package:blocpattern/views/login.dart';

import 'bloc_pattern/bloc_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        bloc: DogsQueryBloc(),
        child: MaterialApp(
          theme: ThemeData(
              primarySwatch: Colors.blue
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const LoadingScreen(),
            '/home': (context) => HomePage(),
            '/login': (context) => const LoginScreen(),
          },
        )
    );
  }
}

class HomePage extends StatefulWidget {
  Widget actualPage = const LoginScreen();
  int currentIndex = 1;

  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: bottomNavBar(context),
        body: widget.actualPage,
      );
  }

  Widget bottomNavBar(context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.contacts),
          label: "Dogs list",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.alternate_email),
          label: "Connexion",
        ),
      ],
      onTap: (routeName) {
        setState(() {
          widget.currentIndex = routeName;
        });
        onTapHandler(routeName);
      },
    );
  }

  void onTapHandler(int index) {
    switch (index) {
      case 0:
        setState(() {
          widget.actualPage = const ListScreen();
        });
        break;
      case 1:
        setState(() {
          widget.actualPage = const LoginScreen();
        });
        break;
    }
  }
}