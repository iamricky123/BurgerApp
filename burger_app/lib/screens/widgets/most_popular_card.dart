import 'package:flutter/material.dart';

class MostPopularCard extends StatelessWidget {
  final String image, title, rate, price, tag;
  final Function() onTap;
  final int index;

  const MostPopularCard({
    Key? key,
    required this.image,
    required this.title,
    required this.rate,
    required this.price,
    required this.onTap,
    required this.tag,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _headline6 = Theme.of(context).textTheme.headline6;
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 250,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: FloatingActionButton.small(
                    heroTag: "fav $index",
                    onPressed: () {},
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ),
                ),
                Flexible(
                  child: Hero(
                    tag: tag,
                    child: Image.asset(image),
                  ),
                ),
                Text(
                  title,
                  style: _headline6!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Text(rate),
                  ],
                ),
                Text(
                  "RM $price",
                  style: _headline6.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}