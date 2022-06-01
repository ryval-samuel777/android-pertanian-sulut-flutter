import 'package:get/get.dart';

import '../modules/halaman_kategory/bindings/halaman_kategory_binding.dart';
import '../modules/halaman_kategory/views/halaman_kategory_view.dart';
import '../modules/halaman_produk/bindings/halaman_produk_binding.dart';
import '../modules/halaman_produk/views/halaman_produk_view.dart';
import '../modules/halaman_tokoh/bindings/halaman_tokoh_binding.dart';
import '../modules/halaman_tokoh/views/halaman_tokoh_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/tokoh/bindings/tokoh_binding.dart';
import '../modules/tokoh/views/tokoh_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TOKOH,
      page: () => TokohView(),
      binding: TokohBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.HALAMAN_PRODUK,
      page: () => HalamanProdukView(),
      binding: HalamanProdukBinding(),
    ),
    GetPage(
      name: _Paths.HALAMAN_TOKOH,
      page: () => HalamanTokohView(),
      binding: HalamanTokohBinding(),
    ),
    GetPage(
      name: _Paths.HALAMAN_KATEGORY,
      page: () => HalamanKategoryView(),
      binding: HalamanKategoryBinding(),
    ),
  ];
}
