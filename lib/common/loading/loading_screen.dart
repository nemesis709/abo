import 'dart:async';

import 'package:abo/common/loading/loading_screen_controller.dart';
import 'package:flutter/material.dart';

class LoadingScreen {
  LoadingScreen._privateConstructor();
  static final LoadingScreen _instance = LoadingScreen._privateConstructor();
  factory LoadingScreen.instance() => _instance;

  LoadingScreenController? _controller;

  void show({required BuildContext context, String? text}) {
    if (_controller?.update(text) ?? false) {
      return;
    } else {
      _controller = showOverlay(context: context, text: text);
    }
  }

  void hide() {
    _controller?.close();
    _controller = null;
  }

  LoadingScreenController? showOverlay({
    required BuildContext context,
    required String? text,
  }) {
    final state = Overlay.of(context);

    final textController = StreamController<String?>();
    textController.add(text);

    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    final overlay = OverlayEntry(builder: (context) {
      return Material(
        color: Colors.black.withAlpha(150),
        child: Center(
            child: Container(
                width: size.width * 0.3,
                constraints: BoxConstraints(
                  maxWidth: size.width * 0.8,
                  maxHeight: size.height * 0.8,
                  minWidth: size.width * 0.3,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const SizedBox(
                              height: 50.0,
                              width: 50.0,
                              // child: CircularProgressIndicator(),
                              child: CircularProgressIndicator(),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            StreamBuilder<String?>(
                                stream: textController.stream,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData &&
                                      snapshot.requireData != null) {
                                    return Text(snapshot.requireData!);
                                  } else {
                                    return Container();
                                  }
                                })
                          ]),
                    )))),
      );
    });

    state.insert(overlay);

    return LoadingScreenController(close: () {
      textController.close();
      overlay.remove();
      return true;
    }, update: (text) {
      textController.add(text);
      return true;
    });
  }
}
