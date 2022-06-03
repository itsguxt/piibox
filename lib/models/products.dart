//ARQUIVO RESPONSÁVEL POR CRAR A CLASSE E A LISTA QUE GUARDA OS PRODUTOS A SEREM VENDIDOS
class Products {
  final String id;
  final String title;
  final String category;
  final double value;
  final List<String> image;
  final String description;

  Products(
      {required this.id,
      required this.title,
      required this.value,
      required this.category,
      required this.image,
      required this.description});
}

final List<Products> productsToSell = [
  Products(
    id: "0002",
    title: "Agua mineral",
    value: 10,
    category: "category",
    image: ["agua1.jpg"],
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sed porta lectus, scelerisque semper mauris. Pellentesque eget ornare dolor. Nulla faucibus leo vel est vulputate bibendum. Curabitur vitae nulla varius, rhoncus ligula non, sollicitudin lorem. Nullam sed congue magna, et lobortis magna. Mauris vitae iaculis quam. Quisque feugiat dolor vitae libero efficitur, quis tincidunt enim facilisis. Donec facilisis massa et urna elementum porttitor. Cras vel turpis finibus erat lacinia ullamcorper.',
  ),
  Products(
    id: "0001",
    title: "Laranja",
    value: 10,
    category: "category",
    image: ["laranja1.jpg"],
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sed porta lectus, scelerisque semper mauris. Pellentesque eget ornare dolor. Nulla faucibus leo vel est vulputate bibendum. Curabitur vitae nulla varius, rhoncus ligula non, sollicitudin lorem. Nullam sed congue magna, et lobortis magna. Mauris vitae iaculis quam. Quisque feugiat dolor vitae libero efficitur, quis tincidunt enim facilisis. Donec facilisis massa et urna elementum porttitor. Cras vel turpis finibus erat lacinia ullamcorper.',
  ),
  Products(
    id: "0003",
    title: "Limão",
    value: 10,
    category: "category",
    image: ["limao1.jpg"],
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sed porta lectus, scelerisque semper mauris. Pellentesque eget ornare dolor. Nulla faucibus leo vel est vulputate bibendum. Curabitur vitae nulla varius, rhoncus ligula non, sollicitudin lorem. Nullam sed congue magna, et lobortis magna. Mauris vitae iaculis quam. Quisque feugiat dolor vitae libero efficitur, quis tincidunt enim facilisis. Donec facilisis massa et urna elementum porttitor. Cras vel turpis finibus erat lacinia ullamcorper.',
  ),
  Products(
    id: "0004",
    title: "Miojo",
    value: 10,
    category: "category",
    image: ["miojo1.jpg"],
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sed porta lectus, scelerisque semper mauris. Pellentesque eget ornare dolor. Nulla faucibus leo vel est vulputate bibendum. Curabitur vitae nulla varius, rhoncus ligula non, sollicitudin lorem. Nullam sed congue magna, et lobortis magna. Mauris vitae iaculis quam. Quisque feugiat dolor vitae libero efficitur, quis tincidunt enim facilisis. Donec facilisis massa et urna elementum porttitor. Cras vel turpis finibus erat lacinia ullamcorper.',
  ),
  Products(
    id: "0005",
    title: "Carne",
    value: 10,
    category: "category",
    image: ["carne1.jpg"],
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sed porta lectus, scelerisque semper mauris. Pellentesque eget ornare dolor. Nulla faucibus leo vel est vulputate bibendum. Curabitur vitae nulla varius, rhoncus ligula non, sollicitudin lorem. Nullam sed congue magna, et lobortis magna. Mauris vitae iaculis quam. Quisque feugiat dolor vitae libero efficitur, quis tincidunt enim facilisis. Donec facilisis massa et urna elementum porttitor. Cras vel turpis finibus erat lacinia ullamcorper.',
  ),
  Products(
    id: "0006",
    title: "Abacaxi",
    value: 10,
    category: "category",
    image: ["abacaxi1.jpg"],
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sed porta lectus, scelerisque semper mauris. Pellentesque eget ornare dolor. Nulla faucibus leo vel est vulputate bibendum. Curabitur vitae nulla varius, rhoncus ligula non, sollicitudin lorem. Nullam sed congue magna, et lobortis magna. Mauris vitae iaculis quam. Quisque feugiat dolor vitae libero efficitur, quis tincidunt enim facilisis. Donec facilisis massa et urna elementum porttitor. Cras vel turpis finibus erat lacinia ullamcorper.',
  ),
  Products(
    id: "0007",
    title: "Maçã ",
    value: 10,
    category: "category",
    image: ["maca1.jpg"],
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sed porta lectus, scelerisque semper mauris. Pellentesque eget ornare dolor. Nulla faucibus leo vel est vulputate bibendum. Curabitur vitae nulla varius, rhoncus ligula non, sollicitudin lorem. Nullam sed congue magna, et lobortis magna. Mauris vitae iaculis quam. Quisque feugiat dolor vitae libero efficitur, quis tincidunt enim facilisis. Donec facilisis massa et urna elementum porttitor. Cras vel turpis finibus erat lacinia ullamcorper.',
  ),
];
