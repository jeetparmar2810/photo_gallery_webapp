import 'package:get/get.dart';
import 'package:gallery/app/utils/export.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.GALLERY;

  static final routes = [
    GetPage(
      name: Routes.GALLERY,
      page: () => GalleryScreen(),
      binding: GalleryBinding(),
    ),
    // Add more routes here
  ];
}
