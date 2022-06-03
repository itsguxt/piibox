import 'package:flutter/material.dart';
import 'package:pbx/models/favorited_products.dart';

import '../models/products.dart';

//ARQUIVO QUE CRIA A TELA DO PRODUTOS FAVORITADOS

class FavoritedPage extends StatefulWidget {
  const FavoritedPage({Key? key}) : super(key: key);

  @override
  State<FavoritedPage> createState() => _FavoritedPageState();
}

class _FavoritedPageState extends State<FavoritedPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          color: Theme.of(context).colorScheme.secondary,
          child: favoritedProducts.isNotEmpty
              ? ListView.builder(
                  itemCount: favoritedProducts.length,
                  itemBuilder: (ctx, index) {
                    return productBuilder(productsToSell,
                        favoritedProducts[index].idProduct, index);
                  },
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2),
                      Image.asset(
                        "box.png",
                        width: 200,
                      ),
                      // const SizedBox(height: 20),
                      const Text(
                        "Você ainda não tem nenhum\nproduto favoritado...",
                        style: TextStyle(fontFamily: 'lobster', fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
        ),
      );
  Widget productBuilder(List<Products> productsToSell, String id, int index) {
    final element = (productsToSell
        .indexWhere((productsToSell) => id == productsToSell.id));
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.14,
      child: Column(
        children: [
          SizedBox(height: index == 0 ? 20 : 10),
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(83, 255, 255, 255),
                borderRadius: BorderRadius.circular(20)),
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.width * 0.2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(
                            "assets/images/${productsToSell[element].image[0]}"),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        productsToSell[element].title,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "R\$${productsToSell[element].value.toStringAsFixed(2)}",
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        return confirmToDelete(index, element);
                      });
                    },
                    icon: const Icon(
                      Icons.favorite,
                      color: Color.fromARGB(255, 255, 0, 0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  void confirmToDelete(int productIndexInCart, int productIndexInList) {
    //,int productIndexInList
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Theme.of(context).primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                SizedBox(
                  height: 250,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 70, left: 10, right: 10),
                    child: Column(
                      children: [
                        const Text(
                            "Deseja mesmo remover este item dos favoritos?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white)),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                            "${productsToSell[productIndexInList].title} será removido se você\n confirmar esta ação",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 13, color: Colors.white)),
                        const SizedBox(
                          height: 5,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 123, 194, 252),
                            padding: const EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            'APAGAR!',
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                          onPressed: () {
                            setState(() {
                              favoritedProducts.removeAt(productIndexInCart);
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -60,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                        "assets/images/${productsToSell[productIndexInList].image[0]}"),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
