//ARQUIVO RESPONSÁVEL POR CRAR A CLASSE E A LISTA QUE GUARDA AS CATEGORIAS DE PRODUTOS
import 'package:flutter/cupertino.dart';

class Categories {
  final String categoryTitle;
  // final String imagem; // = "chocolate.png";
  final AssetImage imagem;

  Categories({
    required this.categoryTitle,
    this.imagem = const AssetImage("chocolate.jpg"),
  });
}

final List<Categories> categories = [
  Categories(categoryTitle: "Doces"),
  Categories(categoryTitle: "Limpeza"),
  Categories(categoryTitle: "Frutas"),
  Categories(categoryTitle: "Bebidas"),
  Categories(categoryTitle: "Frios"),
  Categories(categoryTitle: "VER MAIS", imagem: const AssetImage("plus.jpg")),
];
