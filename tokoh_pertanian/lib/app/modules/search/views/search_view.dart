import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/search_controller.dart';

class SearchView extends StatefulWidget {
  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController searchController = TextEditingController();
  QuerySnapshot? snapshotData;
  bool isExcuted = false;
  @override
  Widget build(BuildContext context) {
    Widget searchedData() {
      return ListView.builder(
          itemCount: snapshotData!.docs.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  "${(snapshotData!.docs[index].data() as Map<String, dynamic>)['gambar']}",
                ),
              ),
              title: Text(
                '${(snapshotData!.docs[index].data() as Map<String, dynamic>)['nama']}',
                style: TextStyle(
                    fontSize: 22, fontFamily: 'Roboto', color: Colors.black),
              ),
              subtitle: Text(
                '${(snapshotData!.docs[index].data() as Map<String, dynamic>)['domisili']}',
                style: TextStyle(
                    fontSize: 18, fontFamily: 'Roboto', color: Colors.black),
              ),
              onTap: () {
                Get.toNamed(Routes.HALAMAN_PRODUK,
                    arguments: '${(snapshotData!.docs[index].id)}');
              },
            );
          });
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.clear),
        onPressed: () {},
        backgroundColor: Colors.red,
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          GetBuilder<SearchController>(
              init: SearchController(),
              builder: (val) {
                return IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    val.queryData(searchController.text).then((value) {
                      snapshotData = value;
                      setState(() {
                        isExcuted = true;
                      });
                    });
                  },
                );
              })
        ],
        title: TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: 'Cari Produk ...',
            border: InputBorder.none,
            hintStyle: TextStyle(
              fontSize: 20,
              fontFamily: 'Roboto',
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: isExcuted
          ? searchedData()
          : Center(
              child: Text(
                'cari Produk ?',
                style: TextStyle(color: Colors.green, fontSize: 30),
              ),
            ),
    );
  }
}
