import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HospitalCardWidget extends StatelessWidget {
  final String name;
  final String time;
  final String distence;
  final String rating;
  final String image;

  const HospitalCardWidget(
      {super.key,
      required this.image,
      required this.name,
      required this.time,
      required this.distence,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 140,
                  width: 200,
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
                    width: 70,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                        )
                      ],
                    ),
                  ),
                )
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
                  Row(
                    children: [
                      Icon(Icons.access_time_filled,
                          size: 16, color: Theme.of(context).primaryColor),
                      const SizedBox(
                        width: 6,
                      ),
                      Text("$time min ",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context).disabledColor,
                                  )),
                      Icon(
                        Icons.circle,
                        color: Theme.of(context).disabledColor,
                        size: 5,
                      ),
                      Text(" $distence km",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
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
    );
  }
}
