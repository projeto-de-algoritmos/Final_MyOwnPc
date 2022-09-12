import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_own_pc/components/equip_card.dart';
import 'package:my_own_pc/models/product.dart';

class HomeController {
  Future<List<Widget>> returnProductsList() async {
    List<Widget> result = [];
    var jsonText = await rootBundle.loadString('assets/product.json');
    List data = json.decode(jsonText);

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
      result.add(ProductCard(product: product));
    }
    return result;
  }
}
