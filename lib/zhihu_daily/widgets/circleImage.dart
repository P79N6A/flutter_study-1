import 'package:flutter/widgets.dart';

class CircleImage extends StatelessWidget {
  final ImageProvider image;

  CircleImage(this.image, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: image)
        )
    );
  }
}