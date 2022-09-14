import 'package:flutter/material.dart';
import 'package:my_own_pc/controller/home_controller.dart';
import 'package:my_own_pc/shared/variables.dart';
import 'package:my_own_pc/views/cart_sheet.dart';
import 'package:my_own_pc/views/config_sheet.dart';

class CustomToolBar extends StatelessWidget {
  const CustomToolBar({Key? key, required this.controller}) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * 0.11,
      child: Stack(
        children: [
          Center(
            child: Container(
              color: SharedPrefs.backgroundColor,
              width: size.width * 0.3,
            ),
          ),
          CustomPaint(
            size: Size(size.width, size.height * 0.11),
            painter: CustomPainterWakke(),
          ),
          Center(
            heightFactor: 0.5,
            child: MaterialButton(
              height: size.height * 0.07,
              color: SharedPrefs.greenButton,
              shape: const CircleBorder(),
              onPressed: () {
                print(SharedPrefs.productsStores);
                controller.createRoute();
              },
              highlightColor: Colors.transparent,
              child: const Icon(
                Icons.check,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: size.width,
            height: size.height * 0.11,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: () {
                      showBottomSheet(
                        context: context,
                        builder: ((context) => const ConfigSheet()),
                      );
                    },
                    icon: Icon(
                      Icons.settings,
                      size: size.height * 0.03,
                      color: const Color(0XFF6236FF),
                    ),
                    splashColor: SharedPrefs.backgroundColor,
                    highlightColor: SharedPrefs.backgroundColor,
                    splashRadius: 25,
                  ),
                ),
                SizedBox(width: size.width * 0.2),
                Stack(
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: IconButton(
                        onPressed: () {
                          showBottomSheet(
                            context: context,
                            builder: ((context) => const CartSheet()),
                          );
                        },
                        icon: Icon(
                          Icons.shopping_cart,
                          size: size.height * 0.03,
                          color: const Color(0XFF6236FF),
                        ),
                        splashColor: SharedPrefs.backgroundColor,
                        highlightColor: SharedPrefs.backgroundColor,
                        splashRadius: 25,
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: SharedPrefs.itemsCartCount,
                      builder: (context, value, child) => Positioned(
                        bottom: 4,
                        right: 2,
                        child: Container(
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 15,
                            minHeight: 15,
                          ),
                          child: Text(
                            SharedPrefs.itemsCartCount.value.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomPainterWakke extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);

    path.quadraticBezierTo(size.width * 0.2, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.4, 0, size.width * 0.4, 20);
    path.arcToPoint(Offset(size.width * 0.6, 20),
        radius: const Radius.circular(10.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.6, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.8, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, const Color(0XFFF5F5F5), 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
