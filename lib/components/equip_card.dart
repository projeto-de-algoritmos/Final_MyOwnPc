import 'package:flutter/material.dart';
import 'package:my_own_pc/models/product.dart';
import 'package:my_own_pc/shared/variables.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
      margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.05, vertical: size.height * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            spreadRadius: 0,
            offset: const Offset(0, 4),
            color: Colors.black.withOpacity(0.25),
          )
        ],
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: size.height * 0.15,
            width: size.height * 0.13,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: AssetImage(product.imageAsset), fit: BoxFit.fill),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width * 0.5,
                child: Text(
                  product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              SizedBox(
                width: size.width * 0.55,
                child: Text(
                  "R\$ ${product.value.toString()}",
                  style: TextStyle(
                      color: SharedPrefs.primaryPurple,
                      fontWeight: FontWeight.bold,
                      fontSize: size.height * 0.02),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              MaterialButton(
                onPressed: () {},
                color: SharedPrefs.primaryPurple,
                height: size.height * 0.03,
                minWidth: size.width * 0.5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: const Text(
                  "Comprar!",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
