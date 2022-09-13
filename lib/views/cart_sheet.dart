import 'package:flutter/material.dart';
import 'package:my_own_pc/controller/home_controller.dart';
import 'package:my_own_pc/shared/variables.dart';

class CartSheet extends StatefulWidget {
  const CartSheet({Key? key}) : super(key: key);

  @override
  State<CartSheet> createState() => _CartSheetState();
}

class _CartSheetState extends State<CartSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: SharedPrefs.primaryPurple.withOpacity(0.8),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: SingleChildScrollView(
        child: ValueListenableBuilder(
          valueListenable: SharedPrefs.itemsCartCount,
          builder: ((context, value, child) => Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 25),
                    child: Text(
                      "PRODUTOS SELECIONADOS",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ...HomeController.createCartList(),
                  const SizedBox(height: 20)
                ],
              )),
        ),
      ),
    );
  }
}
