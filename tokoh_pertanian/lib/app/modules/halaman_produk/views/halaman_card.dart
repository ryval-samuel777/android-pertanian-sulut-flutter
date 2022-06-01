import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokoh_pertanian/app/routes/app_pages.dart';

class ProductCardView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.3,
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
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
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
        ]),
      ),
    );
  }
}

class TokohView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.home_work,
        size: 50,
      ),
      title: Text('Toko Petanian Makmur'),
      subtitle: Text('Manado'),
    );
  }
}
