import 'package:flutter/material.dart';

class DescProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        ListTile(
          leading: Icon(
            Icons.label_important,
            size: 35,
          ),
          title: Text('Produk : Bibit Salak'),
        ),
        ListTile(
          leading: Icon(
            Icons.shopping_cart,
            size: 35,
          ),
          title: Text('harga : Rp.10.000'),
        ),
        ListTile(
          leading: Icon(
            Icons.location_on,
            size: 35,
          ),
          title: Text('Lokasi : Manado'),
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
                Text('harga bulan ini  : Rp10.000'),
                Text('harga bulan lalu : Rp15.000'),
              ],
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.arrow_circle_down,
            size: 35,
            color: Colors.green,
          ),
          title: Text(
            'Turun Harga Rp5.000',
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ));
  }
}
