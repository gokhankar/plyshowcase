import 'dart:async';

import 'package:flutter/material.dart';
import 'package:plyshowcase/ply_view_page.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:js' as js;
import 'dart:html' as html;

// ...

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

  // Future<void> _launchUrl(_url) async {
  //   if (!await launchUrl(_url)) {
  //     throw 'Could not launch $_url';
  //   }
  // }

  Future<void> _launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
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
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              child: Text('Without Package(dart:js)'),
              onPressed: () {
                js.context.callMethod('open', [
                  "https://plytest.netlify.app/?https://yks.tv.tr/teeth/stlply/2020-09-19-000010-maxillary.ply",
                ]);
              },
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              child: Text('Without Package(dart:html)'),
              onPressed: () {
                html.window.open(
                    "https://plytest.netlify.app/?https://yks.tv.tr/teeth/stlply/2020-09-19-000010-maxillary.ply",
                    'new tab');
              },
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              child: Text('Without Package(dart:html) popup'),
              onPressed: () {
                html.window.open(
                    "https://plytest.netlify.app/?https://yks.tv.tr/teeth/stlply/2020-09-19-000010-maxillary.ply",
                    'popup',
                    'left=100,top=100,width=800,height=600');
              },
            ),
            SizedBox(
              height: 15,
            ),
            Text("Links coming from project"),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PlyViewPage(
                            param:
                                "https://yks.tv.tr/teeth/stlply/2020-09-19-000010-maxillary.ply")))
              },
              child: Text(
                'iframe',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PlyViewPage(
                      param:
                          "https://yks.tv.tr/teeth/stlply/2020-09-19-000010-maxillary.ply")));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
