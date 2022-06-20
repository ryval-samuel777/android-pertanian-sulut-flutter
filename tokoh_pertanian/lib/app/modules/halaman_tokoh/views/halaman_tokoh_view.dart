import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/halaman_tokoh_controller.dart';
import 'card_tokoh.dart';

class HalamanTokohView extends GetView<HalamanTokohController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toko'),
        backgroundColor: Colors.green,
        // centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(height: 10),
          HeadView(),
          Divider(
            color: Colors.grey,
          ),
          ProductCardView(),
        ],
      ),
    );
  }
}
