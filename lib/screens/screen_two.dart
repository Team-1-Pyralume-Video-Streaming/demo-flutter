import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  _ScreenTwoState createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(
          'https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8'),
    )..initialize().then((_) {
        setState(() {
          _chewieController = ChewieController(
            videoPlayerController: _videoPlayerController,
            autoPlay: true,
            looping: true,
          );
        });
        _videoPlayerController.play();
      });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Test chewie',
          style: TextStyle(color: Color.fromARGB(255, 178, 0, 0)),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {},
            style: ButtonStyle(
              foregroundColor:
                  WidgetStateProperty.all(const Color.fromARGB(255, 169, 0, 0)),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            style: ButtonStyle(
              foregroundColor:
                  WidgetStateProperty.all(const Color.fromARGB(255, 173, 7, 7)),
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _chewieController != null &&
                    _chewieController!.videoPlayerController.value.isInitialized
                ? AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Chewie(
                      controller: _chewieController!,
                    ),
                  )
                : const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
