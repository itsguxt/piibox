// ignore_for_file: must_be_immutable, prefer_const_constructors, no_logic_in_create_state

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pbx/models/products.dart';
import '../models/favorited_products.dart';
import '../models/cart_products.dart';

//ARQUIVO QUE MOSTRA AS INFORMAÇÕES DO PRODUTO
//ABERTO COMO MODAL NA TELA INICIAL(home_page.dart) dentra da listagem de produtos (product_list.dart)

class ProductPage extends StatefulWidget {
  Products product;

  ProductPage(this.product, {Key? key}) : super(key: key);
  @override
  State<ProductPage> createState() => _ProductPageState(product);
}

class _ProductPageState extends State<ProductPage> {
  Products product;
  _ProductPageState(this.product);

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        persistentFooterButtons: [productOptions(product.id)],
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onVerticalDragUpdate: (details) {
                      int sensitivity = 15;
                      if (details.delta.dy > sensitivity) {
                        Navigator.pop(context);
                        // Down Swipe
                      }
                    },
                    child: imageLateralScroll(),
                  ),
                  const SizedBox(height: 20),
                  // buildIndicator(),
                  Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(50, 255, 255, 255),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          spreadRadius: 3,
                          blurRadius: 6,
                          offset:
                              const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: productInfos(product.title, 20),
                  ),
                  Container(
                    // height: 500,
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.95,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(50, 255, 255, 255),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          spreadRadius: 3,
                          blurRadius: 6,
                          offset:
                              const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: productDescription(),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ],
          ),
        ),
      );
  Widget productInfos(String name, double value) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            "R\$ ${product.value.toStringAsFixed(2)}",
                            style: const TextStyle(
                              // decoration: TextDecoration.lineThrough,
                              color: Color.fromARGB(255, 255, 0, 0),
                              fontSize: 23,
                              fontWeight: FontWeight.w900,
                              height: 1.5,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          const Text(
                            "R\$299.99",
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              decorationThickness: 1.75,
                              color: Colors.black54,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              height: 1.5,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.star, color: Colors.yellow),
                            Icon(Icons.star, color: Colors.yellow),
                            Icon(Icons.star, color: Colors.yellow),
                            Icon(Icons.star, color: Colors.yellow),
                            Icon(Icons.star, color: Colors.yellow),
                          ],
                        ),
                        const Text(
                          "+5000 avaliações",
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
  Widget productDescription() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text(
                "DESCRIÇÃO:",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          Text(
            product.description,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 20,
            textAlign: TextAlign.justify,
          ),
        ],
      );
  Widget productOptions(index) => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.all(2)),
            FloatingActionButton.extended(
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {
                setState(() {
                  int favoritedVerify = isFavorited(product.id);
                  favoritedVerify < 0
                      ? favoriteProduct(product.id)
                      : unfavorite(favoritedVerify);
                });
              },
              tooltip:
                  isFavorited(product.id) < 0 ? 'Favoritar' : 'Desfavoritar',
              icon: isFavorited(product.id) < 0
                  ? Icon(Icons.favorite_outline, color: Colors.white)
                  : Icon(Icons.favorite, color: Colors.white),
              label: Text(
                  isFavorited(product.id) < 0 ? 'Favoritar' : 'Desfavoritar',
                  style: TextStyle(color: Colors.white)),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(40)),
              ),
            ),
            const Padding(padding: EdgeInsets.all(2)),
            FloatingActionButton.extended(
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {
                setState(() {
                  int verifyInCart = productInCart(product.id);
                  verifyInCart < 0
                      ? addToCart(product.id)
                      : userCart[verifyInCart].qtdProducts += 1;
                  Navigator.pop(context);
                });
              },
              tooltip: 'Comprar',
              icon: const Icon(Icons.shopping_cart, color: Colors.white),
              label:
                  const Text("Comprar", style: TextStyle(color: Colors.white)),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
              ),
            ),
          ],
        ),
      );
  Widget imageLateralScroll() => CarouselSlider.builder(
        options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.35,
            enableInfiniteScroll: true,
            autoPlayInterval: const Duration(seconds: 1),
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
            viewportFraction: 1,
            aspectRatio: 1 / 1,
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index)),
        itemCount: product.image.length,
        itemBuilder: (context, index, realindex) {
          String image = product.image[index];
          return buildImage("assets/images/$image", index);
        },
      );
  Widget buildImage(String image, int index) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage(image),
          ),
        ),
      );
  int isFavorited(String id) {
    for (int index = 0; index < favoritedProducts.length; index++) {
      if (favoritedProducts[index].idProduct == id) {
        return index;
      }
    }
    return -1;
  }

  void favoriteProduct(String idProduct) {
    favoritedProducts.add(FavoritedProducts(idProduct: idProduct));
  }

  void unfavorite(int index) {
    favoritedProducts.removeAt(index);
  }

  int productInCart(String id) {
    for (int index = 0; index < userCart.length; index++) {
      if (userCart[index].idProduct == id) {
        return index;
      }
    }
    return -1;
  }

  void addToCart(String index, {int qtd = 1}) {
    userCart.add(
      UserCart(idProduct: index, qtdProducts: qtd, prodIsChecked: false),
    );
  }
}
