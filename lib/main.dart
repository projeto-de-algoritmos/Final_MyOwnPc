import 'package:flutter/material.dart';
import 'package:my_own_pc/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Chakra_Petch'),
      home: const ProductsList(),
    );
  }
}
