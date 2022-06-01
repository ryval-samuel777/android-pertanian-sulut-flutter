import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/halaman_produk_controller.dart';

class HalamanProdukView extends GetView<HalamanProdukController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produk'),
        backgroundColor: Colors.green,
        // centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HalamanProdukView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
