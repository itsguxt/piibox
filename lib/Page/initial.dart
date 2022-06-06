// ignore_for_file: no_logic_in_create_state, must_be_immutable

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pbx/components/appbar.dart';
import '../models/list_pages.dart';

//ARQUIVO RESPONSÁVEL POR CRIAR A BASE DAS TELAS(MUDANDO APENAS O BODY E MANTENDO A MESMA NAVBAR E APPBAR)

class MainScreen extends StatefulWidget {
  int index;
  MainScreen(this.index, {Key? key}) : super(key: key);
  // const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState(index);
}

class _MainScreenState extends State<MainScreen> {
  _MainScreenState(this.selectedIndex);
  void currentNavBarIndex() {
    selectedIndex = 3;
  }

  int selectedIndex;
  @override
  Widget build(BuildContext context) {
    List<Widget> iconsNavBar = [
      Icon(
        (selectedIndex == 0) ? Icons.home : Icons.home_outlined,
        color: Colors.white,
      ),
      Icon(
        (selectedIndex == 1) ? Icons.favorite : Icons.favorite_outline,
        color: Colors.white,
      ),
      Icon(
        (selectedIndex == 2) ? Icons.chat_bubble : Icons.chat_bubble_outline,
        color: Colors.white,
      ),
      Icon(
          (selectedIndex == 3)
              ? Icons.shopping_cart_checkout
              : Icons.shopping_cart_checkout_outlined,
          color: Colors.white),
    ];

    return Scaffold(
      drawer: const Drawer(
        backgroundColor: Colors.grey,
      ),
      extendBodyBehindAppBar: true,
      appBar: theAppBar(context),
      body: screens[
          selectedIndex], //o screen do body será de acordo com o index selecionado pela bottomNavigationBar abaixo
      bottomNavigationBar: navBar(iconsNavBar),
    );
  }

  CurvedNavigationBar navBar(iconsNavBar) {
    return CurvedNavigationBar(
      height: 50,
      items: iconsNavBar,
      color: Theme.of(context).primaryColor,
      buttonBackgroundColor: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      animationDuration: const Duration(milliseconds: 200),
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
    );
  }
}
