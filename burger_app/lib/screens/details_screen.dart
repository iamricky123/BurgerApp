import 'package:Burger_App/screens/widgets/add_to_basket.dart';
import 'package:Burger_App/screens/widgets/rate_box.dart';
import 'package:Burger_App/utils/assets.dart';
import 'package:Burger_App/utils/constants.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String image, rate, tag, title, price;
  final TextStyle headline;

  DetailsScreen({
    Key? key,
    required this.image,
    required this.rate,
    required this.tag,
    required this.title,
    required this.headline,
    required this.price,
  }) : super(key: key);

  final items = {
    "title": ["Cheese", "onion", "Meat", "Vegetables"],
    "image": [myAssets.cheese, myAssets.onion, myAssets.chickenLeg, myAssets.salad],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Details"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: tag,
                  child: Image.asset(image),
                ),
                RateBox(rate: rate),
                AddToBasket(title: title, headline: headline),
                Text(
                  "\nIngredients",
                  style: headline,
                ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    itemExtent: 90,
                    itemCount: items["title"]!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(items["image"]![index].toString()),
                            Text(items["title"]![index].toString()),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Text(
                  "\nDescription",
                  style: headline,
                ),
                const Text(
                    "A traditional grilled sandwich that consists of ground meat made into a patty, cooked, topped with a slice of cheese, and placed between two halves of a bun to create this favorite international food."),
                const SizedBox(height: 60),
              ],
            ),
          ),
          Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "RM $price  ",
                    style: headline,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Add to cart",
                          style: headline.copyWith(color: Colors.white),
                        ),
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(kRoundedBorder15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}