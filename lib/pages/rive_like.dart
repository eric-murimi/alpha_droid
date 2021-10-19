import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveLikePage extends StatefulWidget {
  const RiveLikePage({Key? key}) : super(key: key);

  @override
  _RiveLikePageState createState() => _RiveLikePageState();
}

class _RiveLikePageState extends State<RiveLikePage> {
  // Controller for playback
  late RiveAnimationController _controller;
  // Is the animation currently playing?
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = OneShotAnimation(
      'animation-1',
      autoplay: false,
      onStart: () => setState(() => _isPlaying = true),
      onStop: () => setState(() => _isPlaying = false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: RiveAnimation.asset(
              'assets/rives/hearty.riv',
              controllers: [_controller],
              onInit: (_) => setState(() {}),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _isPlaying ? null : _controller.isActive = true,
        tooltip: 'Play',
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
