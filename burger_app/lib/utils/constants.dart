import 'package:flutter/material.dart';

final kMenuButton = ButtonStyle(
  fixedSize: MaterialStateProperty.all(const Size(120, 40)),
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
);

final kRoundedBorder15 = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(15),
);

final kAddToCart = BoxDecoration(
  borderRadius: BorderRadius.circular(15),
  color: Colors.black12,
  shape: BoxShape.rectangle,
);