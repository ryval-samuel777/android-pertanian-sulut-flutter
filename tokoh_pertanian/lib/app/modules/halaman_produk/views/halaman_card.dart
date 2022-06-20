import 'package:flutter/material.dart';

class ProductCard1 extends StatelessWidget {
  final String urlGambar;

  const ProductCard1({Key? key, required this.urlGambar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          ),
          alignment: Alignment.center,
        ),
      ]),
    );
  }
}
