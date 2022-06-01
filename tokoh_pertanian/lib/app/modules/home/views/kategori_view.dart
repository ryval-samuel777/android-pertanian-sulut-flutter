import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokoh_pertanian/app/routes/app_pages.dart';

class KategoriView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CategoryCard(name: 'bibit'),
          CategoryCard(name: 'pupuk'),
          CategoryCard(name: 'alat'),
          CategoryCard(name: 'pestisida'),
        ],
      ),
    );
  }
}

// UI for Category view

class CategoryCard extends StatelessWidget {
  final String name;

  CategoryCard({required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Navigate to Category page
        // go to halaman_kategory
        Get.toNamed(Routes.HALAMAN_KATEGORY, arguments: name);
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                  offset: Offset(
                    0.0,
                    1.0,
                  ),
                )
              ],
            ),
            width: 100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
