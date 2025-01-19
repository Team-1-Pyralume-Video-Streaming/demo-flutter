import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ScreenThree extends StatefulWidget {
  const ScreenThree({super.key});

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  late VideoPlayerController _controller;
  late VideoPlayerController _networkController;
  late VideoPlayerController _liveController;
  double _playbackSpeed = 1.0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/cats.mp4')
      ..initialize().then((_) {
        setState(() {});
      });

    _networkController = VideoPlayerController.networkUrl(Uri.parse(
        'https://videos.pexels.com/video-files/855402/855402-uhd_2560_1440_25fps.mp4'))
      ..initialize().then((_) {
        setState(() {});
      });

    _liveController = VideoPlayerController.networkUrl(Uri.parse(
        'https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8'))
      ..initialize().then((_) {
        setState(() {});
        _liveController.play();
      });
  }

  void _changePlaybackSpeed() {
    setState(() {
      _playbackSpeed = _playbackSpeed == 1.0 ? 2.0 : 1.0;
      _controller.setPlaybackSpeed(_playbackSpeed);
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Test Video Player',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 23, 23, 23),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                "1. Local video player",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          _controller.value.isInitialized
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          _controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Colors.white,
                          size: 50.0,
                        ),
                        onPressed: () {
                          setState(() {
                            _controller.value.isPlaying
                                ? _controller.pause()
                                : _controller.play();
                          });
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      right: 10,
                      child: Column(
                        children: [
                          VideoProgressIndicator(
                            _controller,
                            allowScrubbing: true,
                            colors: VideoProgressColors(
                              playedColor: Colors.red,
                              backgroundColor: Colors.grey,
                              bufferedColor: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _formatDuration(_controller.value.position),
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                _formatDuration(_controller.value.duration),
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: ElevatedButton(
                        onPressed: _changePlaybackSpeed,
                        child: Text('${_playbackSpeed}x'),
                      ),
                    ),
                  ],
                )
              : CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                "2. Network video player",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          _networkController.value.isInitialized
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    AspectRatio(
                      aspectRatio: _networkController.value.aspectRatio,
                      child: VideoPlayer(_networkController),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          _networkController.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Colors.white,
                          size: 50.0,
                        ),
                        onPressed: () {
                          setState(() {
                            _networkController.value.isPlaying
                                ? _networkController.pause()
                                : _networkController.play();
                          });
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      right: 10,
                      child: Column(
                        children: [
                          VideoProgressIndicator(
                            _networkController,
                            allowScrubbing: true,
                            colors: VideoProgressColors(
                              playedColor: Colors.red,
                              backgroundColor: Colors.grey,
                              bufferedColor: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _formatDuration(
                                    _networkController.value.position),
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                _formatDuration(
                                    _networkController.value.duration),
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: ElevatedButton(
                        onPressed: _changePlaybackSpeed,
                        child: Text('${_playbackSpeed}x'),
                      ),
                    ),
                  ],
                )
              : CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                "3. Live video player 🤯",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          _liveController.value.isInitialized
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    AspectRatio(
                      aspectRatio: _liveController.value.aspectRatio,
                      child: VideoPlayer(_liveController),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          _liveController.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Colors.white,
                          size: 50.0,
                        ),
                        onPressed: () {
                          setState(() {
                            _liveController.value.isPlaying
                                ? _liveController.pause()
                                : _liveController.play();
                          });
                        },
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: ElevatedButton(
                        onPressed: _changePlaybackSpeed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child:
                            Text('LIVE', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                )
              : CircularProgressIndicator(),
        ],
      )),
    );
  }
}
