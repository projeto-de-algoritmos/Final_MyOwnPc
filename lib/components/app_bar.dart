import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.context}) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AppBar(
      elevation: 0.4,
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(
          Icons.settings,
          size: size.height * 0.02,
          color: const Color(0XFF6236FF),
        ),
      ),
      title: SizedBox(
        child: Text(
          "MyOwnPc",
          style: TextStyle(
            color: const Color(0xFF6236FF),
            fontSize: size.height * 0.025,
            fontFamily: 'Chakra_Petch',
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.shopping_cart,
            size: size.height * 0.025,
            color: const Color(0XFF6236FF),
          ),
        ),
      ],
    );
  }
}
