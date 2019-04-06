import "package:flare_flutter/flare_actor.dart";
import "package:flutter/material.dart";

void main() => runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: FlareActor("assets/animation/Filip.flr",
            // animation: idel phone_sway move_phone
                fit: BoxFit.contain, animation: 'move_phone'))));
