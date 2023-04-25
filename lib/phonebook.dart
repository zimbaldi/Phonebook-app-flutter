import 'package:flutter/material.dart';
import 'pages/main_page.dart';

class Phonebook extends StatelessWidget {
  const Phonebook({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const MainPage(),
    );
  }
}
