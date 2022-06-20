import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tokoh_pertanian/app/modules/halaman_produk/views/halaman_card.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/halaman_produk_controller.dart';

class DescProduct extends GetView<HalamanProdukController> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getData(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            return Container(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductCard1(
                    urlGambar: data['gambar'] != ''
                        ? data['gambar']
                        : 'https://discussions.apple.com/content/attachment/660042040',
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.store,
                    size: 50,
                  ),
                  title: Text('Toko ${data['toko']}'),
                  subtitle: Text(' ${data['domisili']}'),
                  onTap: () {
                    Get.toNamed(Routes.HALAMAN_TOKOH, arguments: data['toko']);
                  },
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  leading: Icon(
                    Icons.label_important,
                    size: 35,
                  ),
                  title: Text('Produk : ${data['nama']}'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.shopping_cart,
                    size: 35,
                  ),
                  title: Text('Harga : Rp ${data['harga']}'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.location_on,
                    size: 35,
                  ),
                  title: Text('Lokasi : ${data['domisili']}'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.trending_up,
                    size: 35,
                  ),
                  title: Text('Trend Harga'),
                  subtitle: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('harga bulan ini  : Rp ${data['harga']}'),
                        Text('harga bulan lalu : Rp ${data['hargaS']}'),
                        // TODO: buat api harga
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    ListTile(
                      leading: (data['harga'] > data['hargaS'])
                          ? Icon(
                              Icons.arrow_circle_up,
                              size: 35,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.arrow_circle_down,
                              size: 35,
                              color: Colors.green,
                            ),
                      title: (data['harga'] > data['hargaS'])
                          ? Text(
                              'Turun Naik ${data['harga'] - data['hargaS']} Rupiah',
                              style: TextStyle(color: Colors.red))
                          : Text(
                              'Turun Harga ${data['harga'] - data['hargaS']} Rupiah',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                    ),
                  ],
                ),
                ListTile(
                  leading: Icon(
                    Icons.directions_car,
                    size: 35,
                    color: Color.fromARGB(255, 103, 185, 105),
                  ),
                  title: Text(
                    'Klik Untuk Melihat Alamat Toko',
                    style: TextStyle(
                      color: Color.fromARGB(255, 103, 185, 105),
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Color.fromARGB(255, 103, 185, 105),
                    size: 20,
                  ),
                  onTap: () {
                    openUrl('${data['alamat']}');
                  },
                ),
              ],
            ));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}

Future<void> openUrl(String Url,
    {bool forceWebView = false, bool enableJavaScript = false}) async {
  if (await canLaunch(Url)) {
    await launch(Url,
        forceWebView: forceWebView, enableJavaScript: enableJavaScript);
  }
}
