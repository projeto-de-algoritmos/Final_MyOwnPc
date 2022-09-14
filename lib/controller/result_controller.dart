import 'package:flutter/material.dart';
import 'package:my_own_pc/components/get_product_card.dart';
import 'package:my_own_pc/shared/variables.dart';

class ResultController {
  List<Widget> productsFromStore(int idStore) {
    List<Widget> resultWidgets = [];

    SharedPrefs.cartItems.forEach((element) {
      if (element.idStore == idStore) {
        resultWidgets.add(GetProductCard(product: element));
      }
    });

    if (idStore == 0) {
      return [
        Container(
          margin: EdgeInsets.only(top: 150),
          child: Text(
            "Todas as rotas são calculadas tendo início na sede central do Correios:",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ];
    }

    return resultWidgets;
  }

  void resetCart() {
    SharedPrefs.cartItems = [];
    SharedPrefs.itemsCartCount.value = 0;
    SharedPrefs.productsStores = [];
  }
}
