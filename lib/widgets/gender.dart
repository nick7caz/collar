import 'package:fetch/constants.dart';
import 'package:flutter/material.dart';

Widget genderWidget(icon, text, size, selected, onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: size.height * 0.11,
          color: selected == text ? Color(0xFFf50519) : Colors.black54,
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Text(
          text,
          style: TextStyle(
            color: selected == text ? Color(0xFFf50519) : Colors.black,
          ),
        )
      ],
    ),
  );
}