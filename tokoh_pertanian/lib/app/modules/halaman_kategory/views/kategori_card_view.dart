import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokoh_pertanian/app/routes/app_pages.dart';

// TODO: remove this file

class ProductCardView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.90,
      child: ListView(
        children: [
          ProductCard(
            title: 'Bibit Salak',
            lokasi: 'manado',
            harga: 'Rp. 10.000',
            tokoh: 'maju bersama',
            urlGambar:
                'https://i.pinimg.com/564x/ba/16/2a/ba162a95b6612d38e8d754e4f769c027.jpg',
          ),
          ProductCard(
            title: 'Bibit Jagung',
            lokasi: 'tomohon',
            harga: 'Rp. 10.000',
            tokoh: 'maju bersama',
            urlGambar:
                'https://1.bp.blogspot.com/_hEXdwO68LsU/TIb8PV8j4mI/AAAAAAAAAMA/zDaNUm8oPDc/s1600/DSCN6221.JPG',
          ),
          ProductCard(
            title: 'Bibit Cabai',
            lokasi: 'Minahasa',
            harga: 'Rp. 10.000',
            tokoh: 'maju bersama',
            urlGambar:
                'https://s1.bukalapak.com/img/1420093611/w-1000/Isi_50_Bibit_Benih_Tanaman_Cabe_Cabai_Rawit_Pelita_F1.jpg',
          ),
          ProductCard(
            title: 'Bibit  Terong',
            lokasi: 'sulut',
            harga: 'Rp. 10.000',
            tokoh: 'maju bersama',
            urlGambar:
                'https://s1.bukalapak.com/img/67569300401/s-1000-1000/2019_05_15T14_59_14_07_00.jpg',
          ),
          ProductCard(
            title: 'Bibit Sawi',
            lokasi: 'sulut',
            harga: 'Rp. 10.000',
            tokoh: 'maju bersama',
            urlGambar:
                'https://i.pinimg.com/originals/90/55/76/90557636dd9b31108876d9c99cd2c042.jpg',
          ),
          ProductCard(
            title: 'Bibit Kangkung',
            lokasi: 'sulut',
            harga: 'Rp. 10.000',
            tokoh: 'maju bersama',
            urlGambar:
                'https://s1.bukalapak.com/img/1216029901/w-1000/__Isi_250_____Bibit_Benih_Tanaman_Hidroponik_Kangkung_Bangko.jpg',
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String lokasi;
  final String harga;
  final String tokoh;
  final String urlGambar;

  const ProductCard(
      {Key? key,
      required this.title,
      required this.lokasi,
      required this.harga,
      required this.tokoh,
      required this.urlGambar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.HALAMAN_PRODUK, arguments: title);
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
