import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_own_pc/components/cart_equip_card.dart';
import 'package:my_own_pc/components/equip_card.dart';
import 'package:my_own_pc/models/product.dart';
import 'package:my_own_pc/shared/variables.dart';

class HomeController {
  Future transformProductList() async {
    List<Widget> result = [];
    var jsonText = await rootBundle.loadString('assets/product.json');
    List data = json.decode(jsonText);
    SharedPrefs.productsList = [];
    for (var element in data) {
      Product product = Product(
        element["id"],
        element["name"],
        element["priority"],
        element["value"],
        element["store"],
        element["type"],
        element["imageAsset"],
        element["quality"],
      );
      SharedPrefs.productsList.add(product);
    }
  }

  List<Widget> createHomeList() {
    List<Widget> homeList = [];

    for (Product product in SharedPrefs.productsList) {
      if (!SharedPrefs.cartItems.any((element) => element.id == product.id)) {
        homeList.add(ProductCard(product: product));
      }
    }

    if (homeList.isEmpty) {
      return [
        Center(
            child: Container(
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Expanded(
                child: Center(
                    child: Text(
                  "Nenhum produto a ser recomendado mais!",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              ),
            ],
          ),
        ))
      ];
    }
    return homeList;
  }

  static List<Widget> createCartList() {
    List<Widget> cartList = [];

    if (SharedPrefs.cartItems.isEmpty) {
      return [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Carrinho vazio!",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
      ];
    }
    for (Product element in SharedPrefs.cartItems)
      cartList.add(CartCard(product: element));

    return cartList;
  }
}
