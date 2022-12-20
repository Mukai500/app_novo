import 'package:app_novo/widgets/svg_loader.dart';
import 'package:flutter/material.dart';

Widget NavigationMenu(icon, {isSelected = false, height, width}) {
  return Container(
    child: Column(children: [
      svgLoader(icon, height: height, width: width),
      Container(
        height: 15,
        width: 15,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50))),
      )
    ]),
  );
}
