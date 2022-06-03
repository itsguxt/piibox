import 'package:flutter/material.dart';

//ARQUIVO RESPONSÁVEL POR MOSTAR O NOME DA SESSÃO E O "VER MAIS" NA TELA INICIAL (home_page.dart)

class Topics extends StatelessWidget {
  final String category;
  // ignore: use_key_in_widget_constructors
  const Topics(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height / 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            category,
            style: const TextStyle(
              fontFamily: 'short',
              fontSize: 17,
              color: Color.fromARGB(255, 58, 54, 54),
              // color: Colors.black,
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 12),
                backgroundColor: const Color.fromARGB(255, 123, 194, 252)),
            onPressed: () {},
            child: const Text(
              'Ver mais...',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
