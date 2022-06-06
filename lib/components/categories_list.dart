// ignore_for_file: use_key_in_widget_constructors, no_logic_in_create_state

import 'package:flutter/material.dart';
import '../models/categories.dart';

//ARQUIVO RESPONSÁVEL POR LISTAR AS CATEGORIAS NA TELA INICIAL (home_page.dart)
class CategoryList extends StatefulWidget {
  final List<Categories> categories;
  const CategoryList(this.categories);

  @override
  State<CategoryList> createState() =>
      _CategoryListState(categories: categories);
}

class _CategoryListState extends State<CategoryList> {
  List<Categories> categories;
  _CategoryListState({required this.categories});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (ctx, index) {
          final ctg = categories[index];
          return Container(
            height: 100,
            width: MediaQuery.of(context).size.width * 0.55,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.secondary,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: SizedBox(
                    width: 190,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.17,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: ctg.imagem,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          width: 180,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                ctg.categoryTitle,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
