import 'package:get/get.dart';
import 'package:gallery/app/utils/export.dart';

// GalleryController class to manage state
class GalleryController extends GetxController {
  final images = [].obs;
  final isLoading = false.obs;
  final PixabayService pixabayService = PixabayService();
  var page = AppConstants.page;

  @override
  void onInit() {
    fetchImages();
    super.onInit();
  }

  // Function to fetch images from Pixabay and update the gallery
  void fetchImages() async {
    if (isLoading.value) return;
    isLoading.value = true;
    try {
      var fetchedImages = await pixabayService.fetchImages(page);
      images.addAll(fetchedImages);
      page++;
    } catch (e) {
      LoggerUtil.logError("${AppConstants.imageFetchError} $e");
    }
    isLoading.value = false;
  }
}
