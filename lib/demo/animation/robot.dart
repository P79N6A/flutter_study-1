import 'package:flutter/material.dart';
import 'package:nima/nima_actor.dart';

void main() => runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NimaActor(
          "assets/animation/Robot.nima",
          alignment: Alignment.center,
          fit: BoxFit.contain,
          animation: "Flight",
        )));
