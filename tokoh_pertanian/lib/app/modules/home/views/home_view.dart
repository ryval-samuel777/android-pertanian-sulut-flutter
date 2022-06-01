import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'kategori_view.dart';
import 'product_card_view.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Produk'),
        // centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              size: 33,
            ),
            onPressed: () {
              Get.toNamed('/search');
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          KategoriView(),
          ProductCardView(),
        ],
      ),
      // body: Center(
      //   child: Text(
      //     'Belum ada Data :v bilek',
      //     style: TextStyle(fontSize: 20),
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        iconSize: 25,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedIconTheme: IconThemeData(
          color: Color.fromARGB(255, 184, 243, 186),
        ),
        unselectedItemColor: Color.fromARGB(255, 184, 243, 186),
        selectedItemColor: Color.fromARGB(255, 184, 243, 186),
        selectedIconTheme:
            IconThemeData(color: Color.fromARGB(255, 184, 243, 186), size: 38),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shop_two,
            ),
            label: 'Tokoh',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              Get.toNamed('/home');
              break;
            case 1:
              Get.toNamed('/tokoh');
              break;
          }
        },
      ),
    );
  }
}
