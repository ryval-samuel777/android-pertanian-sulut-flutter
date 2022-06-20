import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokoh_pertanian/app/routes/app_pages.dart';

import '../controllers/tokoh_controller.dart';
import 'list_tokoh_view.dart';

class TokohView extends GetView<TokoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tokoh Pertanian'),
        backgroundColor: Colors.green,
        // centerTitle: true,
      ),
      body: FutureBuilder<QuerySnapshot<Object?>>(
          future: controller.getData(Get.arguments),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              List listToko = snapshot.data!.docs;
              return ListView.builder(
                  itemCount: listToko.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: Icon(
                              Icons.store,
                              size: 50,
                            ),
                            title: Text(
                              "${(listToko[index].data() as Map<String, dynamic>)['namaToko']}" !=
                                      ""
                                  ? "${(listToko[index].data() as Map<String, dynamic>)['namaToko']}"
                                      .toUpperCase()
                                  : "Tidak bisa memuat data",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Roboto',
                              ),
                            ),
                            onTap: () {
                              Get.toNamed(Routes.HALAMAN_TOKOH,
                                  arguments:
                                      '${(listToko[index].data() as Map<String, dynamic>)['namaToko']}');
                            },
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                        )
                      ],
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
