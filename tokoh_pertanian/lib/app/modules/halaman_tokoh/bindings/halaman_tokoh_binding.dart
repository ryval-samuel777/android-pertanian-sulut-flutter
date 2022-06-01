import 'package:get/get.dart';

import '../controllers/halaman_tokoh_controller.dart';

class HalamanTokohBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HalamanTokohController>(
      () => HalamanTokohController(),
    );
  }
}
