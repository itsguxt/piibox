import 'package:flutter/material.dart';
import '../models/cart_products.dart';
import '../models/products.dart';

//ARQUIVO QUE CRIA A TELA DO CARRINHO DE COMPRAS

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isCheckedAll = false;
  @override
  Widget build(BuildContext context) => Scaffold(
        persistentFooterButtons: [productOptions()],
        body: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
          child: userCart.isNotEmpty
              ? Container(
                  color: Theme.of(context).colorScheme.secondary,
                  child: ListView.builder(
                    itemCount: userCart.length,
                    itemBuilder: (ctx, index) {
                      return productBuilder(
                          productsToSell,
                          userCart[index].idProduct,
                          userCart[index].qtdProducts,
                          index);
                    },
                  ),
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
                        "Você ainda não tem nenhum\nproduto no carrinho...",
                        style: TextStyle(fontFamily: 'lobster', fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
        ),
      );
  void checkAll() {
    for (int i = 0; i < userCart.length; i++) {
      userCart[i].prodIsChecked = isCheckedAll;
    }
    setState(() {
      isCheckedAll == false ? isCheckedAll = true : isCheckedAll = false;
      verifyAllChecked();
    });
  }

  void verifyAllChecked() {
    int qtdChecked = 0;
    for (var i in userCart) {
      if (i.prodIsChecked == true) {
        qtdChecked += 1;
      }
    }
    if (qtdChecked == userCart.length) {
      setState(() {
        isCheckedAll = true;
      });
    } else {
      isCheckedAll = false;
    }
  }

  double getFinalPrice() {
    List indexProductsInCart = [];
    List quantityItems = [];
    double finalPrice = 0;
    for (var itemIndex in userCart) {
      indexProductsInCart.add(productsToSell.indexWhere(
          (productsToSell) => itemIndex.idProduct == productsToSell.id));
      quantityItems.add(itemIndex.qtdProducts);
    }
    for (int i = 0; i < userCart.length; i++) {
      userCart[i].prodIsChecked == true
          ? finalPrice +=
              productsToSell[indexProductsInCart[i]].value * quantityItems[i]
          : null;
    }
    return finalPrice;
  }

  Widget productBuilder(
      List<Products> productsToSell, String id, int quantity, index) {
    final element = (productsToSell
        .indexWhere((productsToSell) => id == productsToSell.id));
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onLongPress: () => confirmToDelete(index, element),
          child: Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(83, 255, 255, 255),
                borderRadius: BorderRadius.circular(20)),
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.width * 0.2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Transform.scale(
                        scale: 1.25,
                        child: Checkbox(
                            checkColor: Colors.green,
                            shape: const CircleBorder(),
                            side: const BorderSide(color: Colors.black),
                            activeColor: Colors.white,
                            splashRadius: 50,
                            value: userCart[index].prodIsChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                userCart[index].prodIsChecked = value!;
                                verifyAllChecked();
                              });
                            }),
                      ),
                      GestureDetector(
                        onTap: () => setState(() {
                          userCart[index].prodIsChecked == true
                              ? userCart[index].prodIsChecked = false
                              : userCart[index].prodIsChecked = true;
                          verifyAllChecked();
                        }),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                              "assets/images/${productsToSell[element].image[0]}"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        productsToSell[element].title,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${productsToSell[element].value}",
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () => setState(() {
                                userCart[index].qtdProducts > 1
                                    ? userCart[index].qtdProducts--
                                    : confirmToDelete(index, element);
                              }),
                          icon: Icon(
                            Icons.remove_circle,
                            color: userCart[index].qtdProducts <= 1
                                ? Colors.red
                                : Theme.of(context).primaryColor,
                          )),
                      Text("${userCart[index].qtdProducts}"),
                      IconButton(
                        onPressed: () => setState(() {
                          userCart[index].qtdProducts++;
                        }),
                        icon: Icon(
                          Icons.add_circle,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }

  Widget productOptions() {
    return Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Transform.scale(
                    scale: 1.25,
                    child: userCart.isNotEmpty
                        ? Checkbox(
                            checkColor: Colors.green,
                            shape: const CircleBorder(),
                            side: const BorderSide(color: Colors.white),
                            activeColor: Colors.white,
                            // splashRadius: 50,
                            value: isCheckedAll,
                            onChanged: (bool? value) {
                              setState(() {
                                isCheckedAll = value!;
                                checkAll();
                              });
                            })
                        : null,
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      isCheckedAll == true
                          ? isCheckedAll = false
                          : isCheckedAll = true;
                      checkAll();
                    }),
                    child: Text(
                      userCart.isNotEmpty
                          ? isCheckedAll == true
                              ? "Selecionar\nnenhum"
                              : "Selecionar\ntodos"
                          : "Carrinho\nvazio",
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "TOTAL:",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "R\$${getFinalPrice()}",
                    style: const TextStyle(color: Colors.white, fontSize: 23),
                  ),
                ],
              ),
            ],
          ),
        ));
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
                            "Deseja mesmo remover este item do seu carrinho?",
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
                            'REMOVER!',
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                          onPressed: () {
                            setState(() {
                              userCart.removeAt(productIndexInCart);
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
