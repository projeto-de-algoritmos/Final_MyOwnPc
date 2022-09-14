import 'package:flutter/material.dart';
import 'package:my_own_pc/models/product.dart';
import 'package:my_own_pc/models/store.dart';

class SharedPrefs {
  static Color backgroundColor = const Color(0XFFF5F5F5);
  static Color primaryPurple = const Color(0XFF6236FF);
  static Color greenButton = const Color.fromARGB(255, 57, 208, 195);
  static ValueNotifier<int> itemsCartCount = ValueNotifier(0);

  static List<Product> cartItems = [];
  static List<Product> productsList = [];
  static List<int> productsStores = [];

  static List<Store> stores = [
    Store(0, "Correios Central", "correios.jpeg"),
    Store(1, "Kalunga Central", "kalunga.jpeg"),
    Store(2, "Magazine Luiza Central", "magalu.jpeg"),
    Store(3, "Americanas Central", "americanas.jpeg"),
    Store(4, "Mercado Livre Central", "mercado.jpeg"),
    Store(5, "Kabum Central", "kabum.jpeg"),
    Store(6, "Amazon Central", "amazon.jpeg"),
    Store(7, "Submarino Central", "submarino.jpeg"),
    Store(8, "Best Buy Central", "bestbuy.jpeg"),
    Store(9, "Casas Bahia Central", "casasbahia.jpeg"),
    Store(10, "GamersStore Central", "gamersstore.jpeg")
  ];
}
