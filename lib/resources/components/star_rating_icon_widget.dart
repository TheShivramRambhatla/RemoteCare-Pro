import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StarRatingWidget extends StatelessWidget {
  final double rating;

  const StarRatingWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    // Calculate the number of full stars and half stars
    int fullStars = rating.floor();
    int halfStars = (rating - fullStars >= 0.5) ? 1 : 0;

    // Create a list of star icons
    List<Widget> starIcons = [];
    for (int i = 0; i < fullStars; i++) {
      starIcons.add(const Icon(
        CupertinoIcons.star_fill,
        color: Colors.amberAccent,
        size: 16,
      ));
    }
    if (halfStars == 1) {
      starIcons.add(const Icon(
        CupertinoIcons.star_lefthalf_fill,
        color: Colors.amberAccent,
        size: 16,
      ));
    }
    starIcons.add(Text(
      "  $rating",
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontWeight: FontWeight.bold),
    ));
    return Row(
      children: starIcons,
    );
  }
}
