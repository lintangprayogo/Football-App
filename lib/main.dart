import 'package:flutter/material.dart';
import 'package:football_app/model/score_model.dart';
import 'package:football_app/network/football_api.dart';
import 'package:football_app/page/page_body.dart';
import 'package:supercharged/supercharged.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FootbalApp(),
    );
  }
}

class FootbalApp extends StatefulWidget {
  const FootbalApp({Key? key}) : super(key: key);

  @override
  _FootbalAppState createState() => _FootbalAppState();
}

class _FootbalAppState extends State<FootbalApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        title: Text(
          "FOOTBALL APP",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: "#d35400".toColor(),
      ),
      body: FutureBuilder(
        future: FootballApi().getAllScore(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return PageBody(snapshot.data as List<FootballMatch>);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
