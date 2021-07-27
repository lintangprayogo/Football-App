import 'package:flutter/widgets.dart';
import 'package:football_app/model/score_model.dart';

Widget teamWidget(String kind, Team team) {
  return Expanded(
      child: Column(
    children: [
      Text(
        kind,
        style: TextStyle(fontSize: 18.0),
      ),
      SizedBox(
        height: 10,
      ),
      Expanded(
          child: Image.network(
        team.logo,
        width: 54.0,
      )),
      SizedBox(
        height: 10,
      ),
      Text(
        team.name,
        style: TextStyle(fontSize: 18.0),
      ),
    ],
  ));
}
