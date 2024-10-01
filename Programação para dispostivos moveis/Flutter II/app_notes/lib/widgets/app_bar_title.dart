import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget
{
  const AppBarTitle({super.key}); // super key é para saber qual é a tela pai e qual é a tela filho
  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('images/logo.png', height: 40),
                  const SizedBox(width: 15,),
                  const Text('Reminders', style: TextStyle(color: Colors.yellow, fontSize: 20),)
                ],);
  }
}