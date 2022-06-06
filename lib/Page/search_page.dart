import 'package:flutter/material.dart';
import 'package:pbx/components/appbar.dart';

//TELA DE RESULTADO DE PESQUISA (QUANDO O USUÁRIO CONFIRMA O TEXTO NO TEXTFIELD)
//ESTA TELA É APENAS ILUSTRATIVA, AINDA NÃO APRESESENTA RESULTADOS...

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: theAppBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            Image.asset(
              "search.png",
              width: 200,
            ),
            // const SizedBox(height: 10),
            const Text(
              "Essa página ainda não\nfoi concluída...",
              style: TextStyle(fontFamily: 'lobster', fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
