import 'package:gallery/app/utils/dimens.dart';
import 'package:flutter/material.dart';

class ImageTile extends StatelessWidget {
  final dynamic imageData;

  const ImageTile(this.imageData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.network(
          imageData['webformatURL'],
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(Dimens.padding_8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.thumb_up, size: Dimens.margin_16, color: Colors.red),
                  const SizedBox(width:  Dimens.width_4),
                  Text('${imageData['likes']}'),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.visibility, size: Dimens.margin_16, color: Colors.blue),
                  const SizedBox(width: Dimens.width_4),
                  Text('${imageData['views']}'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
