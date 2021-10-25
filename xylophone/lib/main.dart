// import 'package:XylophoneApp/SplashScreen.dart';

// import 'package:XylophoneApp/practice.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'audio_picker.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatefulWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  @override
  _XylophoneAppState createState() => _XylophoneAppState();
}

void playSound(int num) {
  final player = AudioCache();
  player.play('note$num.wav');
}

Expanded buildKey(int n, Color color) {
  return Expanded(
    child: MaterialButton(
      color: color,
      onPressed: () {
        playSound(n);
      },
      child: const Text(''),
    ),
  );
}

class _XylophoneAppState extends State<XylophoneApp> {
  String _absolutePathOfAudio = 'Nothing';
  AudioPlayer audioPlayer = AudioPlayer();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  void showLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              new CircularProgressIndicator(),
              new Text("Loading"),
            ],
          ),
        );
      },
    );
    new Future.delayed(new Duration(seconds: 3), () {
      Navigator.pop(context); //pop dialog
    });
  }

  void dismissLoading() {
    Navigator.pop(navigatorKey.currentState!.overlay!.context);
  }

  void openAudioPicker() async {
    showLoading();
    var path = await AudioPicker.pickAudio();
    dismissLoading();
    setState(() {
      _absolutePathOfAudio = path;
    });
  }

  void playMusic() async {
    await audioPlayer.play(_absolutePathOfAudio, isLocal: true);
  }

  void stopMusic() async {
    await audioPlayer.stop();
  }

  void resumeMusic() async {
    await audioPlayer.resume(); // quickly plays the sound, will not release
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Audio picker example'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                color: Colors.orange,
                child: Text(
                  "Select an audio",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  openAudioPicker();
                },
              ),
              MaterialButton(
                color: Colors.red,
                child: Text(
                  "Select an audio",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  openAudioPicker();
                },
              ),
              MaterialButton(
                color: Colors.teal,
                child: Text(
                  "Select an audio",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  openAudioPicker();
                },
              ),
              MaterialButton(
                color: Colors.blue,
                child: Text(
                  "Select an audio",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  openAudioPicker();
                },
              ),
              MaterialButton(
                color: Colors.pink,
                child: Text(
                  "Select an audio",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  openAudioPicker();
                },
              ),
              _absolutePathOfAudio == null
                  ? Container()
                  : Text(
                      "Absolute path",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Clipboard.setData(
                        new ClipboardData(text: _absolutePathOfAudio));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Copied path !')),
                    );
                  },
                  child: _absolutePathOfAudio == null
                      ? Container()
                      : Text(_absolutePathOfAudio),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _absolutePathOfAudio == null
                      ? Container()
                      : FlatButton(
                          color: Colors.green[400],
                          child: Text(
                            "Play",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: playMusic,
                        ),
                  _absolutePathOfAudio == null
                      ? Container()
                      : FlatButton(
                          color: Colors.red[400],
                          child: Text(
                            "Stop",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: stopMusic,
                        )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
