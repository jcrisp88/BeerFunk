import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_tts_improved/flutter_tts_improved.dart';

class Pronounce extends StatefulWidget {
  final String pronounceString;

  Pronounce(this.pronounceString);
  @override
  _PronounceState createState() => _PronounceState();
}

class _PronounceState extends State<Pronounce> {
  String _platformVersion = 'Unknown';
  FlutterTtsImproved tts = FlutterTtsImproved();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    // print('VOICES: ${await tts.getVoices}');
    // print('LANGUAGES: ${await tts.getLanguages}');

    tts.setProgressHandler((String words, int start, int end, String word) {
      setState(() {
        _platformVersion = word;
      });
      print('PROGRESS: $word => $start - $end');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        height: 28.0,
        child: RawMaterialButton(
          onPressed: () {
            tts.speak(widget.pronounceString);
          },
          child: Icon(
            Icons.record_voice_over,
            color: Colors.blue,
            size: 16,
          ),
          shape: CircleBorder(),
          elevation: 0,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
