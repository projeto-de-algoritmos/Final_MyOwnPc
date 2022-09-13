import 'package:flutter/material.dart';
import 'package:my_own_pc/components/app_bar.dart';
import 'package:my_own_pc/components/tool_bar.dart';
import 'package:my_own_pc/shared/variables.dart';

import '../controller/home_controller.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({Key? key}) : super(key: key);

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  HomeController controller = HomeController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: SharedPrefs.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.06),
        child: CustomAppBar(context: context),
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: FutureBuilder(
            future: controller.transformProductList(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ValueListenableBuilder(
                  valueListenable: SharedPrefs.itemsCartCount,
                  builder: (context, value, child) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: size.width * 0.05),
                        margin:
                            EdgeInsets.symmetric(vertical: size.height * 0.02),
                        child: Text(
                          "Produtos",
                          style: TextStyle(
                              color: SharedPrefs.primaryPurple,
                              fontWeight: FontWeight.bold,
                              fontSize: size.height * 0.02),
                        ),
                      ),
                      ...(controller.createHomeList()),
                      SizedBox(height: size.height * 0.15)
                    ],
                  ),
                );
              }
              return const CircularProgressIndicator();
            }),
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: CustomToolBar(),
        )
      ]),
    );
  }
}
