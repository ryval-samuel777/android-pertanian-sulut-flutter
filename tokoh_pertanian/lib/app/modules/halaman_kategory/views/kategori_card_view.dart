import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../home/views/product_card_view.dart';
import '../controllers/halaman_kategory_controller.dart';

class ProductCardView extends GetView<HalamanKategoryController> {
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
