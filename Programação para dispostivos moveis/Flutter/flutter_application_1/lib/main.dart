import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Este widget é a raiz da sua aplicação.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: meuWidget(),
        ),
      ),
    );
  }

  Widget meuWidget() {
    // return const Text(
    //   'Olá, mundo',
    //   style: TextStyle(fontSize: 30.0),
    // );
    return FloatingActionButton(child: Text("Meu Botão"), backgroundColor: Colors.green, onPressed: () {
      
    },);
  }

}