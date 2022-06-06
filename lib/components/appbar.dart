import 'package:flutter/material.dart';

AppBar theAppBar(context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    toolbarHeight: 80,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'logo.png',
          fit: BoxFit.contain,
          // height: screenHeigth / 10,
          height: MediaQuery.of(context).size.height / 10,
        ),
      ],
    ),
    centerTitle: true,
    flexibleSpace: Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          gradient: LinearGradient(colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor,
            //A COR PRECISA SER REPETICA PARA FORMAR O APPBAR ARREDONDADO
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
    ),
    // systemOverlayStyle: SystemUiOverlayStyle.light,
    actions: [
      IconButton(
        icon: const Icon(Icons.notifications_none, color: Colors.white),
        onPressed: () {},
        color: Colors.blue,
      ),
      IconButton(
        icon: const Icon(Icons.account_circle, color: Colors.white),
        onPressed: () {},
        color: Colors.blue,
      ),
    ],
  );
}
