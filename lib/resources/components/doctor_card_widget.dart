import 'package:care_connect/utils/routes/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'star_rating_icon_widget.dart';

class DoctorCardWidget extends StatelessWidget {
  final String name;
  final String image;
  final double rating;
  final String reviews;
  final String spacialist;

  const DoctorCardWidget(
      {super.key,
      required this.name,
      required this.image,
      required this.rating,
      required this.reviews,
      required this.spacialist});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).primaryColorLight),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 120,
                  width: 90,
                  margin: const EdgeInsets.only(right: 14),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).disabledColor.withOpacity(0.1)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      image,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width -
                          90 -
                          40 -
                          14 -
                          8 -
                          32,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 30,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.1),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.checkmark_seal_fill,
                                  color: Theme.of(context).primaryColor,
                                  size: 16,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  "Proffesional Doctor",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          // Spacer(),
                          const Icon(CupertinoIcons.heart),
                        ],
                      ),
                    ),
                    Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(spacialist,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).disabledColor,
                            )),
                    SizedBox(
                      height: 30,
                      child: Row(
                        children: [
                          StarRatingWidget(rating: rating),
                          VerticalDivider(
                            thickness: 2.0,
                            color: Theme.of(context)
                                .disabledColor
                                .withOpacity(0.2),
                          ),
                          Text(
                            "$reviews Reviews",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context).disabledColor,
                                ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.bookAnAppointmentView);
              },
              style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  backgroundColor:
                      Theme.of(context).primaryColor.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: Text(
                "Make Appointment",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
