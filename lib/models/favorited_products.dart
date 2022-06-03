//ARQUIVO RESPONSÁVEL POR CRAR A CLASSE E A LISTA QUE GUARDA OS PRODUTOS FAVORITADOS
class FavoritedProducts {
  String idProduct;

  FavoritedProducts({
    required this.idProduct,
  });
}

List<FavoritedProducts> favoritedProducts = [
  FavoritedProducts(idProduct: "0001"),
  FavoritedProducts(idProduct: "0002"),
  FavoritedProducts(idProduct: "0003"),
  FavoritedProducts(idProduct: "0004"),
  FavoritedProducts(idProduct: "0005"),
  FavoritedProducts(idProduct: "0006"),
  FavoritedProducts(idProduct: "0007"),
];
