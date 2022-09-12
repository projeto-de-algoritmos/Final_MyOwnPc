import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_own_pc/components/app_bar.dart';
import 'package:my_own_pc/components/tool_bar.dart';
import 'package:my_own_pc/shared/variables.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({Key? key}) : super(key: key);

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: SharedPrefs.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.06),
        child: CustomAppBar(context: context),
      ),
      body: Stack(children: const [
        Align(
          alignment: Alignment.bottomCenter,
          child: CustomToolBar(),
        )
      ]),
    );
  }
}
