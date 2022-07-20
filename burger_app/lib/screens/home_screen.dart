import 'package:Burger_App/screens/details_screen.dart';
import 'package:Burger_App/screens/widgets/home_search_field.dart';
import 'package:Burger_App/screens/widgets/most_popular_card.dart';
import 'package:Burger_App/utils/assets.dart';
import 'package:Burger_App/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final AppBar appBar;

  HomeScreen({Key? key, required this.appBar}) : super(key: key);

  final myMenu = {
    "title": ["Beef", "Cheese", "Shrimp", "Drink"],
    "image": [myAssets.chickenLeg, myAssets.cheese, myAssets.shrimp, myAssets.drink],
  };

  final mostPopularItems = {
    "image": [myAssets.burger2, myAssets.burger3],
    "title": ["Extra beef burger", "Smoked beef burger"],
    "rate": [4.7, 4.9],
    "price": [9.80, 8.50],
  };

  @override
  Widget build(BuildContext context) {
    final _headline5 = Theme.of(context).textTheme.headline5;
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(8, 20, 8, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Find and order",
              style: _headline5,
            ),
            Row(
              children: [
                Text(
                  "burger for you  ",
                  style: _headline5!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  myAssets.burger,
                  height: 20,
                ),
              ],
            ),
            const HomeSearchField(),
            SizedBox(
              height: 50,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(width: 5),
                scrollDirection: Axis.horizontal,
                itemCount: myMenu["title"]!.length,
                itemBuilder: (context, index) {
                  return OutlinedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          myMenu["image"]![index].toString(),
                          width: 30,
                        ),
                        Text(myMenu["title"]![index].toString()),
                      ],
                    ),
                    style: kMenuButton,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Most Popular",
              style: _headline5.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 340,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mostPopularItems["title"]!.length,
                itemBuilder: (context, index) {
                  final _title = mostPopularItems["title"]![index].toString();
                  final _rate = mostPopularItems["rate"]![index].toString();
                  final _image = mostPopularItems["image"]![index].toString();
                  final _price = mostPopularItems["price"]![index].toString();
                  return MostPopularCard(
                    image: _image,
                    title: _title,
                    rate: _rate,
                    price: _price,
                    tag: '$index',
                    index: index,
                    onTap: () {
                      Get.to(() => DetailsScreen(
                          image: _image,
                          rate: _rate,
                          tag: '$index',
                          title: _title,
                          headline: _headline5,
                          price: _price,
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}