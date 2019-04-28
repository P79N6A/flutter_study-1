import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayPause extends StatefulWidget {
  VideoPlayPause(this.controller);

  final controller;

  @override
  createState() => _VideoPlayPauseState();
}

class _VideoPlayPauseState extends State<VideoPlayPause> {
  _VideoPlayPauseState() {
    listener = () => setState(() {});
  }

  FadeAnimation imageFadeAnim;
  VoidCallback listener;

  get controller => widget.controller;

  @override
  initState() {
    super.initState();
    controller.addListener(listener);
    controller.setVolume(1.0);
    controller.play();
  }

  @override
  deactivate() {
    controller.setVolume(0.0);
    controller.removeListener(listener);
    super.deactivate();
  }

  @override
  build(context) {
    final List<Widget> children = [
      GestureDetector(
        child: VideoPlayer(controller),
        onTap: () {
          if (!controller.value.initialized) {
            return;
          }
          if (controller.value.isPlaying) {
            imageFadeAnim = FadeAnimation(child: Icon(Icons.pause, size: 48.0));
            controller.pause();
          } else {
            imageFadeAnim =
                FadeAnimation(child: Icon(Icons.play_arrow, size: 48.0));
            controller.play();
          }
        },
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: VideoProgressIndicator(
          controller,
          allowScrubbing: false,
        ),
      ),
      Center(child: imageFadeAnim),
      Center(
          child: controller.value.isBuffering
              ? CircularProgressIndicator()
              : null),
    ];
    return Stack(
      fit: StackFit.passthrough,
      children: children,
    );
  }
}

class FadeAnimation extends StatefulWidget {
  FadeAnimation(
      {this.child, this.duration = const Duration(milliseconds: 500)});

  final Widget child;
  final Duration duration;

  @override
  createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  var animationController;

  @override
  initState() {
    super.initState();
    var duration2 = widget.duration;
    animationController = AnimationController(duration: duration2, vsync: this);
    animationController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    animationController.forward(from: 0.0);
  }

  @override
  deactivate() {
    animationController.stop();
    super.deactivate();
  }

  @override
  didUpdateWidget(FadeAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.child != widget.child) {
      animationController.forward(from: 0.0);
    }
  }

  @override
  dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  build(context) => animationController.isAnimating
      ? Opacity(
          opacity: 1.0 - animationController.value,
          child: widget.child,
        )
      : Container();
}

typedef VideoWidgetBuilder(context, controller);

abstract class PlayerLifeCycle extends StatefulWidget {
  PlayerLifeCycle(this.dataSource, this.childBuilder);

  final VideoWidgetBuilder childBuilder;
  final dataSource;
}

class NetworkPlayerLifeCycle extends PlayerLifeCycle {
  NetworkPlayerLifeCycle(dataSource, childBuilder)
      : super(dataSource, childBuilder);
  @override
  createState() => _NetworkPlayerLifeCycleState();
}

abstract class _PlayerLifeCycleState extends State<PlayerLifeCycle> {
  VideoPlayerController controller;

  @override
  initState() {
    super.initState();
    controller = createVideoPlayerController();
    controller.addListener(() {
      if (controller.value.hasError) {
        print(controller.value.errorDescription);
      }
    });
    controller.initialize();
    controller.setLooping(true);
    controller.play();
  }

  @override
  deactivate() {
    super.deactivate();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  build(context) {
    return widget.childBuilder(context, controller);
  }

  VideoPlayerController createVideoPlayerController();
}

class _NetworkPlayerLifeCycleState extends _PlayerLifeCycleState {
  @override
  createVideoPlayerController() =>
      VideoPlayerController.network(widget.dataSource);
}

class AspectRatioVideo extends StatefulWidget {
  AspectRatioVideo(this.controller);

  final controller;

  @override
  createState() => AspectRatioVideoState();
}

class AspectRatioVideoState extends State<AspectRatioVideo> {
  VideoPlayerController get controller => widget.controller;
  bool initialized = false;

  VoidCallback listener;

  @override
  initState() {
    super.initState();
    listener = () {
      if (!mounted) {
        return;
      }
      if (initialized != controller.value.initialized) {
        initialized = controller.value.initialized;
        setState(() {});
      }
    };
    controller.addListener(listener);
  }

  @override
  build(context) {
    if (initialized) {
      final Size size = controller.value.size;
      return Center(
        child: AspectRatio(
          aspectRatio: size.width / size.height,
          child: VideoPlayPause(controller),
        ),
      );
    } else {
      return Container();
    }
  }
}

main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: ListView(children: [
          NetworkPlayerLifeCycle(
            'https://www.cmtzz.cn/sites/default/files/article-video/xujiaxi.mp4',
            (context, controller) => AspectRatioVideo(controller),
          ),
          NetworkPlayerLifeCycle(
            'https://www.cmtzz.cn/sites/default/files/article-video/xujiaxi.mp4',
            (context, controller) => AspectRatioVideo(controller),
          ),
          NetworkPlayerLifeCycle(
            'https://www.cmtzz.cn/sites/default/files/article-video/xujiaxi.mp4',
            (context, controller) => AspectRatioVideo(controller),
          ),
        ]),
      ),
    ),
  );
}
