import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String title;
  final String videoUrl;

  const VideoPlayerScreen({
    super.key,
    required this.title,
    required this.videoUrl,
  });

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late final VideoPlayerController _controller;
  bool _hasError = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    final uri = Uri.parse(widget.videoUrl);
    _controller = VideoPlayerController.networkUrl(uri)
      ..initialize().then((_) {
        setState(() {});
        _controller.play(); // Auto-play on initialization
      }).catchError((error) {
        setState(() {
          _hasError = true;
          _errorMessage = error.toString();
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // Video Player Viewport
            Center(
              child: _hasError
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.error_outline_rounded, color: Colors.redAccent, size: 64),
                        const SizedBox(height: 12),
                        const Text(
                          'No se pudo reproducir el video',
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Text(
                            _errorMessage,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white38, fontSize: 12),
                          ),
                        ),
                      ],
                    )
                  : _controller.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              VideoPlayer(_controller),
                              // Play/Pause Overlay Toggle Button
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _controller.value.isPlaying
                                        ? _controller.pause()
                                        : _controller.play();
                                  });
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Center(
                                    child: AnimatedOpacity(
                                      opacity: _controller.value.isPlaying ? 0.0 : 1.0,
                                      duration: const Duration(milliseconds: 300),
                                      child: Container(
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: Colors.black54,
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Colors.white24),
                                        ),
                                        child: Icon(
                                          _controller.value.isPlaying
                                              ? Icons.pause_rounded
                                              : Icons.play_arrow_rounded,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // Custom sleek Progress indicator at the bottom
                              VideoProgressIndicator(
                                _controller,
                                allowScrubbing: true,
                                colors: VideoProgressColors(
                                  playedColor: Theme.of(context).primaryColor,
                                  bufferedColor: Colors.white24,
                                  backgroundColor: Colors.white10,
                                ),
                              ),
                            ],
                          ),
                        )
                      : const Center(
                          child: CircularProgressIndicator.adaptive(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        ),
            ),

            // Top Control Bar Overlay
            Positioned(
              top: 8,
              left: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black54, Colors.transparent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Action controls (Replay / Reset)
                    IconButton(
                      icon: const Icon(Icons.replay_rounded, color: Colors.white),
                      onPressed: _controller.value.isInitialized
                          ? () {
                              _controller.seekTo(Duration.zero);
                              _controller.play();
                            }
                          : null,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
