import 'package:flutter/material.dart';
import 'package:pbx/Page/search_page.dart';

//ARQUIVO RESPONSÁVEL POR MOSTAR A BARRA DE PESQUISA NA TELA INICIAL (home_page.dart)

class SearchBar extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const SearchBar();

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: MediaQuery.of(context).size.height / 7,
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Material(
                borderRadius: BorderRadius.circular(20),
                shadowColor: Colors.green,
                elevation: 1.3,
                child: TextFormField(
                  onEditingComplete: () => setState(() {
                    nextScreen(context);
                  }),
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: "Pesquisar...",
                    prefixIcon: const Icon(Icons.search),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void nextScreen(BuildContext context) async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (_) {
        return const SearchPage();
      },
    ));
  }
}
