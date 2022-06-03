//ARQUIVO RESPONSÁVEL POR CRAR A CLASSE E A LISTA QUE GUARDA OS PRODUTOS NO CARRINHO
class UserCart {
  String idProduct;
  int qtdProducts;
  bool prodIsChecked;
  UserCart(
      {required this.idProduct,
      required this.qtdProducts,
      required this.prodIsChecked});
}

List<UserCart> userCart = [
  UserCart(idProduct: "0006", qtdProducts: 2, prodIsChecked: false),
];
