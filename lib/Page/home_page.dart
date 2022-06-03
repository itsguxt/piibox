import 'package:flutter/material.dart';
import 'package:pbx/components/products_list.dart';
import 'package:pbx/components/search_bar.dart';
import 'package:pbx/components/topics.dart';
import 'package:pbx/models/categories.dart';
import 'package:pbx/models/products.dart';
import '../components/categories_list.dart';

//ARQUIVO QUE CRIA A TELA INICIAL

class TheHomePage extends StatelessWidget {
  const TheHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 123, 194, 252),
      body: Container(
        //
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
          ),
          // color: Colors.white,
        ),
        //
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(2),
        child: ListView(
          children: [
            Column(
              children: [
                const SearchBar(),
//
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(83, 255, 255, 255),
                      // color: Color.fromARGB(200, 100, 175, 252),
                      border: Border.all(
                          color: const Color.fromARGB(255, 123, 194, 252)),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      const Topics("Categorias"),
                      CategoryList(categories),
                    ],
                  ),
                ),
//
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(83, 255, 255, 255),
                      // color: Color.fromARGB(200, 100, 175, 252),
                      border: Border.all(
                          color: const Color.fromARGB(255, 123, 194, 252)),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      const Topics("Recomendados"),
                      ProductsList(productsToSell),
                    ],
                  ),
                ),
//
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(83, 255, 255, 255),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      const Topics("Mais vendidos"),
                      ProductsList(productsToSell),
                    ],
                  ),
                ),
//
                // ProductsList2(_products),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
