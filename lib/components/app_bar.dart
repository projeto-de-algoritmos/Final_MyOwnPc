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
    );
  }
}
