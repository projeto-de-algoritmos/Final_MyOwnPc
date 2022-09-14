import 'package:flutter/material.dart';
import 'package:my_own_pc/controller/result_controller.dart';
import 'package:my_own_pc/models/store.dart';
import 'package:my_own_pc/shared/variables.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_own_pc/views/home.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key, required this.storesRoute});

  final List<int> storesRoute;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  ResultController controller = ResultController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Resultado da Compra",
                style: TextStyle(
                    fontSize: size.height * 0.025, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                  vertical: size.height * 0.02,
                ),
                padding: EdgeInsets.all(15),
                height: size.height * 0.12,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: SharedPrefs.primaryPurple,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        spreadRadius: 0,
                        offset: Offset(0, 4),
                        color: Colors.black.withOpacity(0.25))
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Preço final: R\$ ${controller.totalPrice()}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: size.height * 0.02),
                    ),
                    Text(
                      controller.quality(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: size.height * 0.02),
                    ),
                  ],
                ),
              ),
              Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                      height: size.height * 0.6,
                      initialPage: 0,
                      autoPlay: true,
                      viewportFraction: 0.9,
                      enableInfiniteScroll: false),
                  items: widget.storesRoute.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        List<Store> stores = SharedPrefs.stores;
                        return Container(
                          height: size.height * 0.55,
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          width: size.width,
                          child: Column(children: [
                            Container(
                              height: size.height * 0.15,
                              width: size.height * 0.13,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/${stores[i].image}"),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Text(
                              stores[i].name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            i != 0
                                ? Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: size.height * 0.02),
                                        child: Text(
                                          "Produtos para retirar nessa loja:",
                                        ),
                                      )
                                    ],
                                  )
                                : SizedBox(),
                            Container(
                                height: size.height * 0.35,
                                width: size.width * 0.8,
                                child: ListView(
                                  children: controller.productsFromStore(i),
                                ))
                          ]),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  controller.resetCart();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => ProductsList()),
                    ),
                  );
                },
                color: SharedPrefs.primaryPurple,
                height: size.height * 0.05,
                minWidth: size.width * 0.5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: const Text(
                  "Finalizar!",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
