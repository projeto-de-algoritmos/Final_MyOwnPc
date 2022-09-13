import 'package:flutter/material.dart';
import 'package:my_own_pc/models/product.dart';

class SharedPrefs {
  static Color backgroundColor = const Color(0XFFF5F5F5);
  static Color primaryPurple = const Color(0XFF6236FF);
  static Color greenButton = const Color.fromARGB(255, 57, 208, 195);
  static ValueNotifier<int> itemsCartCount = ValueNotifier(0);

  static List<Product> cartItems = [];
  static List<Product> productsList = [];
}
