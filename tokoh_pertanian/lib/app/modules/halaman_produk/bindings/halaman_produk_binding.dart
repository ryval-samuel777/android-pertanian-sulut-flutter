import 'package:get/get.dart';

import '../controllers/halaman_produk_controller.dart';

class HalamanProdukBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HalamanProdukController>(
      () => HalamanProdukController(),
    );
  }
}
