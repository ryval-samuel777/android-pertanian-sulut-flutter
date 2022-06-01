import 'package:get/get.dart';

import '../controllers/tokoh_controller.dart';

class TokohBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TokohController>(
      () => TokohController(),
    );
  }
}
