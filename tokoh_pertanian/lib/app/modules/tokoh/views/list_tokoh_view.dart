import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ListTokohView extends GetView {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.home_work),
      title: Text('Tokoh Pertanian'),
      subtitle: Text('Lokasi'),
    );
  }
}
