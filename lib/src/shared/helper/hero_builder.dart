import 'package:flutter/material.dart';

Widget heroFlightShuttleBuilder(
        BuildContext flightContext,
        Animation<double> animation,
        HeroFlightDirection flightDirection,
        BuildContext fromHeroContext,
        BuildContext toHeroContext) =>
    Material(
      type: MaterialType.transparency,
      child: toHeroContext.widget,
    );
