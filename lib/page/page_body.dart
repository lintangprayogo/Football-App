import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:football_app/model/score_model.dart';
import 'package:football_app/widget/goal_widget.dart';
import 'package:football_app/widget/match_tile_widget.dart';
import 'package:football_app/widget/team_widget.dart';
import 'package:supercharged/supercharged.dart';

Widget PageBody(List<FootballMatch> allmatches) {
  return Column(
    children: [
      Expanded(
        flex: 2,
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                teamWidget(
                  "Home Team",
                  allmatches[0].home,
                ),
                goalWidget(allmatches[0].fixture.status.elapsedTime,
                    allmatches[0].goal.home, allmatches[0].goal.away),
                teamWidget(
                  "Away Team",
                  allmatches[0].away,
                )
              ],
            ),
          ),
        ),
      ),
      Expanded(
          flex: 7,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: "#e67e22".toColor(),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    "MATCHES",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: allmatches.length,
                      itemBuilder: (context, index) {
                        return matchTileWidget(allmatches[index]);
                      },
                    ),
                  )
                ],
              ),
            ),
          ))
    ],
  );
}
