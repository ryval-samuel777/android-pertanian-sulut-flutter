import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokoh_pertanian/app/routes/app_pages.dart';

import '../controllers/tokoh_controller.dart';
import 'list_tokoh_view.dart';

class TokohView extends GetView<TokohController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tokoh Pertanian'),
        backgroundColor: Colors.green,
        // centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.home_work,
              size: 40,
            ),
            title: Text('Toko Petanian Makmur'),
            subtitle: Text('Manado'),
            onTap: () {
              // TODO: page Tokoh-baru

              Get.toNamed(Routes.HALAMAN_TOKOH,
                  arguments: 'Toko Petanian Makmur');
            },
          ),
          Divider(color: Colors.grey),
          ListTile(
            leading: Icon(
              Icons.home_work,
              size: 40,
            ),
            title: Text('Toko Tani Timur'),
            subtitle: Text('Manado'),
            onTap: () {
              // TODO: page Tokoh-baru

              Get.toNamed(Routes.HALAMAN_TOKOH,
                  arguments: 'Toko Petanian Makmur');
            },
          ),
          Divider(color: Colors.grey),
        ],
      ),
      // ListView.builder(
      //   itemCount: controller.products.length,
      //   itemBuilder: (context, index) {
      //     return ListTokohView();
      //   },
      // )
    );
  }
}
