import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/halaman_tokoh_controller.dart';

class HalamanTokohView extends GetView<HalamanTokohController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toko'),
        backgroundColor: Colors.green,
        // centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HalamanTokohView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
