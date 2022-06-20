import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokoh_pertanian/app/modules/halaman_produk/views/halaman_card.dart';
import 'package:tokoh_pertanian/app/modules/halaman_tokoh/controllers/halaman_tokoh_controller.dart';

import '../../home/views/product_card_view.dart';

class ProductCardView extends GetView<HalamanTokohController> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot<Object?>>(
        future: controller.getData(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var listProduk = snapshot.data!.docs;
            return Container(
              height: MediaQuery.of(context).size.height * 0.90,
              child: ListView.builder(
                  itemCount: listProduk.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      title: "${(listProduk[index].data() as Map<String, dynamic>)['nama']}" !=
                              ""
                          ? "${(listProduk[index].data() as Map<String, dynamic>)['nama']}"
                          : "Tidak bisa memuat data",
                      lokasi: '${(listProduk[index].data() as Map<String, dynamic>)['domisili']}' !=
                              ""
                          ? "${(listProduk[index].data() as Map<String, dynamic>)['domisili']}"
                          : "tidak ada data",
                      harga: '${(listProduk[index].data() as Map<String, dynamic>)['harga']}' !=
                              ""
                          ? "${(listProduk[index].data() as Map<String, dynamic>)['harga']}"
                          : "Tidak ada data",
                      urlGambar: '${(listProduk[index].data() as Map<String, dynamic>)['gambar']}' !=
                              ''
                          ? '${(listProduk[index].data() as Map<String, dynamic>)['gambar']}'
                          : 'https://discussions.apple.com/content/attachment/660042040',
                      id: '${(listProduk[index].id)}',
                    );
                  }),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

class HeadView extends GetView<HalamanTokohController> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot<Object?>>(
        future: controller.getData(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListTile(
              leading: Icon(
                Icons.store,
                size: 60,
              ),
              title: Text(
                'Toko ' + Get.arguments,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Roboto',
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
