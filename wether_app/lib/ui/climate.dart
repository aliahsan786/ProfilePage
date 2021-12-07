// ignore_for_file: prefer_if_null_operators

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wether_app/ui/apiFile.dart' as util;
import 'package:http/http.dart' as http;

class Climate extends StatefulWidget {
  const Climate({Key? key}) : super(key: key);

  @override
  _ClimateState createState() => _ClimateState();
}

class _ClimateState extends State<Climate> {
  void showStuff() async {
    Map data = await getWeather(util.apiId, util.defaultCity);
    // ignore: avoid_print
    print(data.toString());
  }

  String? _cityEntered;
  Future _goToNextScreen(BuildContext context) async {
    Map results = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return ChangeCity();
    }));

    if (results != null && results.containsKey('enter')) {
      setState(() {
        _cityEntered = results['enter'];
      });
    }
  }

  Future<Map> getWeather(String appId, String city) async {
    var apiUrl = Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=${util.apiId}&units=imperial');
    http.Response response = await http.get(apiUrl);
    return json.decode(response.body);
  }

  Widget updateTempWidget(String city) {
    return FutureBuilder(
        future: getWeather(util.apiId, city.isEmpty ? util.defaultCity : city),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          if (snapshot.hasData) {
            Map? content = snapshot.data;
            return Container(
              margin: const EdgeInsets.fromLTRB(30, 250, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    title: Text(
                      content!['main']['temp'].toString() + ' F',
                      style: const TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: ListTile(
                      title: Text(
                        'Humidity: ${content['main']['humidity'].toString()} \n'
                        'Min: ${content['main']['temp_min'].toString()} F \n'
                        'Max: ${content['main']['temp_max'].toString()} F \n',
                        style: const TextStyle(
                            color: Colors.black87,
                            fontStyle: FontStyle.normal,
                            fontSize: 17),
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          return Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Climate App'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                _goToNextScreen(context);
              },
              icon: const Icon(Icons.menu))
        ],
      ),
      body: Stack(
        children: [
          const Center(
            child: Image(
              image: AssetImage(
                'images/weather3.jpg',
              ),
              height: 1200,
              // width:,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(200, 25.9, 0, 0),
            child: Text(
              '${_cityEntered == null ? util.defaultCity : _cityEntered}',
              style: const TextStyle(
                  fontSize: 25.9,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.fromLTRB(0, 10.9, 20.9, 0),
            child: updateTempWidget(
                '${_cityEntered == null ? util.defaultCity : _cityEntered}'),
          ),
        ],
      ),
    );
  }
}

class ChangeCity extends StatelessWidget {
  // ignore: prefer_final_fields, unused_field
  var _cityFieldControler = TextEditingController();

  ChangeCity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ChangeCity'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Stack(children: [
          const Center(
            child: Image(
              image: AssetImage(
                'images/whitesnow.png',
              ),
              height: 1200,
              // width:,
              fit: BoxFit.fill,
            ),
          ),
          ListView(
            children: [
              ListTile(
                title: TextField(
                  decoration: const InputDecoration(hintText: 'Enter City'),
                  controller: _cityFieldControler,
                  keyboardType: TextInputType.text,
                ),
              ),
              ListTile(
                title: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  onPressed: () {
                    Navigator.pop(context, {
                      'enter': _cityFieldControler.text,
                    });
                  },
                  child: const Text(
                    'Get Weather',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              )
            ],
          ),
        ]));
  }
}
