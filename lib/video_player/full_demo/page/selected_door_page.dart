import '../model/adventDoor.dart';
import '../widget/video_widget.dart';
import 'package:flutter/material.dart';

class SelectedDoorPage extends StatelessWidget {
  final AdventDoor door;

  const SelectedDoorPage({
    @required this.door,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(door.title),
        ),
        body: Center(
          child: Hero(
            tag: door.title,
            child: VideoItem(
              image: door.image,
              video: door.video,
            ), //Image.asset(door.image, fit: BoxFit.fill),
          ),
        ),
      );
}
