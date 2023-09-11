import 'dart:io';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Sets a platform override for desktop to avoid exceptions. See
// https://flutter.dev/desktop#target-platform-override for more info.
// void _enablePlatformOverrideForDesktop() {
//   if (!kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux)) {
//     debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
//   }
// }

// void main() {
//   _enablePlatformOverrideForDesktop();
//   runApp(MyApp());
// }

class VoiceToText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avatar Glow Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _animate = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar Glow by @apgapg"),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              width: double.infinity,
              color: Color(0xff686de0),
              child: AvatarGlow(
                endRadius: 70,
                animate: _animate,
                child: Material(
                  elevation: 8.0,
                  shape: CircleBorder(),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[100],
                    child: Icon(Icons.mic),
                    radius: 30,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _animate = !_animate;
          });
        },
      ),
    );
  }
}