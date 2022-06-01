import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/halaman_kategory_controller.dart';

class HalamanKategoryView extends GetView<HalamanKategoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategori'),
        backgroundColor: Colors.green,
        // centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HalamanKategoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
