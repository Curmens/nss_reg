import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nss_reg/pages/register_page.dart';
import 'package:video_player/video_player.dart';

class BuildLoading extends StatefulWidget {
  const BuildLoading({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BuildLoadingState();
}

class _BuildLoadingState extends State<BuildLoading> {
  late VideoPlayerController _controller;
  bool? visible = false;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    _controller = VideoPlayerController.asset("assets/videos/bg.mp4");
    _controller.initialize().then((_) {
      _controller.setLooping(true);
      Timer(const Duration(milliseconds: 100), () {
        setState(() {
          _controller.play();
          visible = true;
        });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  // _getVideoBackground() {
  //   return AnimatedOpacity(
  //     opacity: _visible ? 1.0 : 0.0,
  //     duration: const Duration(milliseconds: 1000),
  //     // include 100% width and height
  //     child: SizedBox(
  //       width: double.infinity,
  //       height: double.infinity,
  //       // whtie background
  //       // video player
  //       child: VideoPlayer(_controller),
  //     ),
  //   );
  // }

  _getBackgroundColor() {
    return Container(
      color: Colors.black.withAlpha(150),
    );
  }

  _getBackgroundPicture() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/ghana.jpg"),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  _btnPressed() {
    // move to register page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BuildRegister(),
      ),
    );
  }

  _getContent() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 20),
          // click to login button
          ElevatedButton(
            // do nothing on pressed
            onPressed: () => _btnPressed(),
            style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 3, 133, 7),
                shadowColor: const Color.fromARGB(255, 27, 87, 29),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 20)),
            child: const Text('Register'),
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            _getBackgroundPicture(),
            _getBackgroundColor(),
            _getContent(),
          ],
        ),
      ),
    );
  }
}
