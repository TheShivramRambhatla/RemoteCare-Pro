import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/components/verified_user_image_widget.dart';

class CustomerReviewWidget extends StatelessWidget {
  final String custmorName;
  final String image;
  final String review;
  final String rating;
  final String reviewDate;

  const CustomerReviewWidget(
      {super.key,
      required this.custmorName,
      required this.image,
      required this.review,
      required this.rating,
      required this.reviewDate});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            VerifiedUserImageWidget(
              image: image,
              radius: 40,
            ),
            Text(
              custmorName,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Expanded(child: Container()),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    const Icon(
                      CupertinoIcons.star_fill,
                      color: Colors.amberAccent,
                    ),
                    Text(
                      rating,
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
                Text(
                  "$reviewDate months ago",
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).disabledColor),
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        ExpandableText(
          review,
          expandText: 'show more',
          collapseText: 'show less',
          maxLines: 2,
          linkColor: Theme.of(context).primaryColor,
          textAlign: TextAlign.justify,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Theme.of(context).disabledColor),
        ),
        const SizedBox(
          height: 20,
        ),
        Divider(
            thickness: 2,
            color: Theme.of(context).disabledColor.withOpacity(0.2)),
        const SizedBox(
          height: 6,
        ),
      ],
    );
  }
}
