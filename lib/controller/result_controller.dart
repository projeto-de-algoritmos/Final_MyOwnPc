import 'package:flutter/material.dart';
import 'package:my_own_pc/components/get_product_card.dart';
import 'package:my_own_pc/shared/variables.dart';

import '../models/product.dart';

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

  double totalPrice() {
    double soma = 0;
    SharedPrefs.cartItems.forEach((element) {
      soma += element.value;
    });
    return soma;
  }

  String quality() {
    int soma = totalInversions();
    if (soma == 0) {
      return "Você montou o melhor computador possível";
    }
    if (soma < 9 && soma != 0) {
      return "Você montou um bom computador";
    }
    if (soma < 18 && soma != 0) {
      return "Você montou um computador mediano";
    }
    if (soma < 27 && soma != 0) {
      return "Você montou um computador básico";
    }
    return "Você comprou um computador simples";
  }

  int totalInversions() {
    int soma = 0;
    SharedPrefs.cartItems.forEach((element) {
      List<int> v = listaInversoes(element);
      soma += countInversions(v);
    });
    return soma;
  }

  List<int> listaInversoes(Product product) {
    if (product.quality == 2) {
      return [2, 1, 3, 4, 5];
    }
    if (product.quality == 3) {
      return [2, 3, 1, 4, 5];
    }
    if (product.quality == 4) {
      return [3, 1, 2, 4, 5];
    }
    if (product.quality == 5) {
      return [3, 1, 2, 5, 4];
    }
    return [1, 2, 3, 4, 5];
  }

  int countInversions(List<int> v) {
    int inversoes = 0;

    if (v.length == 1) return 0;

    List<int> ref1 = [];
    List<int> ref2 = [];

    for (int i = 0; i < v.length / 2; i++) {
      ref1.add(v[i]);
    }
    for (int i = v.length ~/ 2; i < v.length; i++) {
      ref2.add(v[i]);
    }

    inversoes += countInversions(ref1);
    inversoes += countInversions(ref2);

    ref1.add(10000);
    ref2.add(10000);

    int ini1 = 0, ini2 = 0;

    for (int i = 0; i < v.length; i++) {
      if (ref1[ini1] <= ref2[ini2]) {
        v[i] = ref1[ini1];
        ini1++;
      } else {
        v[i] = ref2[ini2];
        ini2++;
        inversoes += ref1.length - ini1 - 1;
      }
    }
    return inversoes;
  }

  void resetCart() {
    SharedPrefs.cartItems = [];
    SharedPrefs.itemsCartCount.value = 0;
    SharedPrefs.productsStores = [];
    SharedPrefs.typesInCart = [];
  }
}
