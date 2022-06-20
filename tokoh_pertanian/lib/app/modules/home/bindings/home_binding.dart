import 'package:get/get.dart';

import 'package:tokoh_pertanian/app/modules/home/controllers/product_card_view_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductCardViewController>(
      () => ProductCardViewController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
