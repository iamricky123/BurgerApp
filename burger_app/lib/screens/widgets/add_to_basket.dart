
import 'package:Burger_App/utils/constants.dart';
import 'package:flutter/material.dart';

class AddToBasket extends StatelessWidget {
  const AddToBasket({
    Key? key,
    required this.title,
    required this.headline,
  }) : super(key: key);

  final String title;
  final TextStyle headline;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: headline,
        ),
        Card(
          shape: kRoundedBorder15,
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.remove,
                  color: Colors.black12,
                ),
              ),
              const Text("1"),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ],
    );
  }
}