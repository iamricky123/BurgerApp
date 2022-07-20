
import 'package:Burger_App/utils/constants.dart';
import 'package:flutter/material.dart';

class RateBox extends StatelessWidget {
  const RateBox({
    Key? key,
    required this.rate,
  }) : super(key: key);

  final String rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kAddToCart,
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Text(rate),
        ],
      ),
    );
  }
}