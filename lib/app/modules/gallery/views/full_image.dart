import 'package:gallery/app/utils/export.dart';

class FullImage extends StatelessWidget {
  final String imageUrl;

  const FullImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.network(
            imageUrl,
            fit: BoxFit.none,
          ),
        ),
      ),
    );
  }
}