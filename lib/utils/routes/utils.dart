import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

import '../../resources/components/star_rating_icon_widget.dart';

class UtilsClass {
  static bottomModalWidget(BuildContext context, String image, String name,
      String reviews, String spacialist, double rating) {
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        builder: (_) {
          return Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight.withOpacity(0.1),
                border: Border.all(
                    color: Theme.of(context).disabledColor.withOpacity(0.2)),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text("Remove from Favorites?",
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(
                  height: 6,
                ),
                const Divider(),
                const SizedBox(
                  height: 14,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: EdgeInsets.zero,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Theme.of(context).primaryColorLight),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 120,
                          width: 90,
                          margin: const EdgeInsets.only(right: 14),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Theme.of(context)
                                  .disabledColor
                                  .withOpacity(0.1)),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                                  color: Theme.of(context)
                                                      .primaryColor,
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
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
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
                                  FittedBox(
                                    child: Text(
                                      "$reviews Reviews",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color:
                                                Theme.of(context).disabledColor,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  // height: 60,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 60,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.3),
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            child: Text(
                              "Cancel",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold),
                            )),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 60,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            child: Text(
                              "Remove",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color:
                                          Theme.of(context).primaryColorLight,
                                      fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          );
        });
  }

  static Future<Position> getCurrentLocation() async {
    await Geolocator.requestPermission().onError((error, stackTrace) async {
      log("error is $error");
      throw await Geolocator.getCurrentPosition();
    });
    return await Geolocator.getCurrentPosition();
  }

  static getPlacesList(String input) async {
    String sessionToken = const Uuid().v4();
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String kplacesApiKey = 'AIzaSyBNZlFgHQpLg2kxBsZEabw0ArwC29-ffSU';
    String request =
        '$baseURL?input=$input&key=$kplacesApiKey&sessiontoken=$sessionToken';

    var response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
      return jsonDecode(response.body.toString());
    } else {
      return Exception('Failed to load data');
    }
  }

  static logOutFunction(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.only(
                top: 6, bottom: 50.0, left: 20, right: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 4,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Theme.of(context).disabledColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(50)),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Logout",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Divider(
                  thickness: 1.5,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text("Are you sure you want to log out?"),
                const SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  // height: 60,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).primaryColorLight,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  side: BorderSide(
                                      color: Theme.of(context).primaryColor)),
                            ),
                            child: Text(
                              "Cancel",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold),
                            )),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            child: Text(
                              "Yes, Logout",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color:
                                          Theme.of(context).primaryColorLight,
                                      fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  // static searchChats(String input) {
  //   print("object1111");
  //   DataClass.upcommingBookings.map((element) {
  //     log("$element \n $input");
  //     element['name'].toLowerCase().contains(input.toLowerCase())
  //         ? DataClass.upcommingBookings
  //         : DataClass.upcommingBookings.remove(element);
  //   });
  // }
}
