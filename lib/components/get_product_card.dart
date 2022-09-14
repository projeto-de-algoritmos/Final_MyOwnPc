import 'package:flutter/material.dart';
import 'package:my_own_pc/models/product.dart';

class GetProductCard extends StatelessWidget {
  const GetProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
      margin: EdgeInsets.symmetric(vertical: size.height * 0.015),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            spreadRadius: 0,
            offset: const Offset(0, 4),
            color: Colors.black.withOpacity(0.25),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            height: size.height * 0.05,
            width: size.width * 0.1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(product.imageAsset),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(width: size.width * 0.05),
          SizedBox(
            width: size.width * 0.55,
            child: Text(
              product.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
              softWrap: true,
              overflow: TextOverflow.clip,
            ),
          )
        ],
      ),
    );
  }
}
