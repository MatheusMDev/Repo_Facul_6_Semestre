import 'package:flutter/material.dart';

import '../../widgets/app_bar_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C384A),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF2C384A),
        title: const AppBarTitle(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orange,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),
      body: const SafeArea(
        //captura as dimensones da tela e combina com
        //a estrutura do app
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: null,
        ),
      ),
    );
  }
}
