import 'package:gallery/app/utils/export.dart';
import 'package:get/get.dart';


class GalleryScreen extends StatelessWidget {
  final GalleryController controller = Get.put(GalleryController());

  GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.images.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return NotificationListener<ScrollNotification>(
          onNotification: (scrollInfo) {
            if (!controller.isLoading.value &&
                scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) {
              controller.fetchImages();
              return true;
            }
            return false;
          },
          child: StaggeredGridView.countBuilder(
            crossAxisCount: calculateColumnCount(context),
            itemCount: controller.images.length,
            itemBuilder: (BuildContext context, int index) {
              return ImageTile(controller.images[index]);
            },
            staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
            mainAxisSpacing: Dimens.spacing_8,
            crossAxisSpacing: Dimens.spacing_8,
            padding: const EdgeInsets.all(Dimens.padding_8),
          ),
        );
      }),
    );
  }

  // Function to calculate the number of columns based on the screen width
  int calculateColumnCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth < Dimens.screenSize ? 2 : 4;
  }
}
