import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/data/data.dart';

class HospitalsFavoritesView extends StatefulWidget {
  const HospitalsFavoritesView({super.key});

  @override
  State<HospitalsFavoritesView> createState() => _HospitalsFavoritesViewState();
}

class _HospitalsFavoritesViewState extends State<HospitalsFavoritesView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          for (int index = 0;
              index < DataClass.hospitalData.length;
              index++) ...[
            HospitalFavoriteCardWidget(
              name: DataClass.hospitalData[index]["name"],
              time: DataClass.hospitalData[index]["time"],
              image: DataClass.hospitalData[index]["image"],
              distence: DataClass.hospitalData[index]["distance"],
              rating: DataClass.hospitalData[index]["rating"],
              review: DataClass.hospitalData[index]["reviews"].toString(),
              location: DataClass.hospitalData[index]["location"].toString(),
              spacialist:
                  DataClass.hospitalData[index]["speciality"].toString(),
            ),
            const SizedBox(
              height: 6,
            )
          ],
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}

class HospitalFavoriteCardWidget extends StatelessWidget {
  final String name;
  final String time;
  final String distence;
  final String rating;
  final String image;
  final String review;
  final String location;
  final String spacialist;
  final bool? isFavorite;

  const HospitalFavoriteCardWidget(
      {super.key,
      required this.image,
      required this.name,
      required this.time,
      required this.distence,
      required this.rating,
      required this.review,
      required this.location,
      required this.spacialist,
      this.isFavorite = true});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Card(
        elevation: 1.0,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 180,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
                      child: Image.asset(
                        image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            CupertinoIcons.star_fill,
                            color: Colors.amberAccent,
                            size: 14,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            rating,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            "( $review+ reviews )",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: Theme.of(context).disabledColor),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      right: 10,
                      top: 10,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context)
                              .primaryColorLight
                              .withOpacity(0.3),
                        ),
                        child: (isFavorite!)
                            ? Icon(
                                CupertinoIcons.heart_fill,
                                color: Theme.of(context).primaryColor,
                              )
                            : Icon(
                                CupertinoIcons.heart,
                                color: Theme.of(context).primaryColorLight,
                              ),
                      ))
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(spacialist,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).disabledColor,
                            )),
                    Divider(
                      thickness: 1.5,
                      color: Theme.of(context).disabledColor.withOpacity(0.2),
                    ),
                    Row(
                      children: [
                        Icon(CupertinoIcons.location_solid,
                            size: 16, color: Theme.of(context).primaryColor),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(location,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context).disabledColor,
                                )),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Icon(Icons.access_time_filled,
                            size: 16, color: Theme.of(context).primaryColor),
                        const SizedBox(
                          width: 6,
                        ),
                        Text("$time min ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context).disabledColor,
                                )),
                        Icon(
                          Icons.circle,
                          color: Theme.of(context).disabledColor,
                          size: 5,
                        ),
                        Text(" $distence km",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context).disabledColor,
                                )),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
