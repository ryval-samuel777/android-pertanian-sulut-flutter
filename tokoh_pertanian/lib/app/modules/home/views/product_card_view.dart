import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokoh_pertanian/app/routes/app_pages.dart';
import '../controllers/product_card_view_controller.dart';

class ProductCardView extends GetView<ProductCardViewController> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot<Object?>>(
        future: controller.getData(),
        builder: (context, snapshot) {
          late var listProduk = snapshot.data!.docs;

          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.72,
              child: ListView.builder(
                  itemCount: listProduk.length,
                  itemBuilder: (context, index) => ProductCard(
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
                      )),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String lokasi;
  final String harga;

  final String urlGambar;
  final String id;

  const ProductCard(
      {Key? key,
      required this.title,
      required this.lokasi,
      required this.harga,
      required this.urlGambar,
      required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.HALAMAN_PRODUK, arguments: id);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 230,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.6),
                offset: const Offset(0.0, 10.0),
                blurRadius: 10.0,
                spreadRadius: -6.0,
              )
            ],
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.25), BlendMode.multiply),
              image: NetworkImage(urlGambar),
              fit: BoxFit.cover,
            )),
        child: Stack(children: [
          Align(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            alignment: Alignment.center,
          ),
          Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(width: 7),
                      Text(lokasi, style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(width: 7),
                      Text(harga, style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
            alignment: Alignment.bottomLeft,
          )
        ]),
      ),
    );
  }
}
