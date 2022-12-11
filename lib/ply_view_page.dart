import 'dart:html';

import 'package:flutter/material.dart';

import 'dart:ui' as ui;

class PlyViewPage extends StatelessWidget {
  String? param;

  PlyViewPage({super.key, this.param});

  @override
  Widget build(BuildContext context) {
    ui.platformViewRegistry.registerViewFactory(
        'test-view-type',
        (int viewId) => IFrameElement()
          ..width = '640'
          ..height = '360'
          ..src = "./web/viewer/ply_stl_viewer.html"
          // ..src = "https://www.youtube.com/embed/5VbAwhBBHsg"
          ..style.border = 'none');
    return Scaffold(
        appBar: AppBar(), body: HtmlElementView(viewType: "test-view-type"));
  }
}
