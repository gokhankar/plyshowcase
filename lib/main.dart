import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ply - stl showcase'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () =>
                  _launchInBrowser(Uri.parse("https://plytest.netlify.app/")),
              child: Text(
                'boş sayfa',
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () => _launchInBrowser(Uri.parse(
                  "https://plytest.netlify.app/?https://yks.tv.tr/teeth/stlply/2020-09-19-000010-mandibular-scanbody.stl")),
              child: Text(
                '2020-09-19-000010-mandibular-scanbody.stl',
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () => _launchInBrowser(Uri.parse(
                  "https://plytest.netlify.app/?https://yks.tv.tr/teeth/stlply/2020-09-19-000010-mandibular.ply")),
              child: Text(
                "2020-09-19-000010-mandibular.ply",
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () => _launchInBrowser(Uri.parse(
                  "https://plytest.netlify.app/?https://yks.tv.tr/teeth/stlply/2020-09-19-000010-maxillary.ply")),
              child: Text(
                '2020-09-19-000010-maxillary.ply',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
