import 'dart:convert';

import 'package:football_app/model/score_model.dart';
import 'package:http/http.dart';

class FootballApi {
  final String apiUrl =
      "https://api-football-v1.p.rapidapi.com/v3/fixtures?league=39&season=2020";

  static const headers = {
    'x-rapidapi-key': '8ed6c682c7msh24d7e011432a221p10f4f5jsn893de4d8ea76',
    'x-rapidapi-host': 'api-football-v1.p.rapidapi.com'
  };

  Future<List<FootballMatch>> getAllScore() async {
    Response res = await get(Uri.parse(apiUrl), headers: headers);
    var body;

    if (res.statusCode == 200) {
      body = jsonDecode(res.body);
      List<dynamic> response = body["response"];
      List<FootballMatch> scoreMatches =
          response.map((dynamic json) => FootballMatch.fromJson(json)).toList();
      return scoreMatches;
    }
    return [];
  }
}
