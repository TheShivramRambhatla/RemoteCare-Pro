import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:care_connect/resources/components/custom_bottom_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AddHospitalReviewView extends StatefulWidget {
  const AddHospitalReviewView({super.key});

  @override
  State<AddHospitalReviewView> createState() => _AddHospitalReviewViewState();
}

class _AddHospitalReviewViewState extends State<AddHospitalReviewView> {
  double starRating = 5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          CustomBottomButtonWidget(text: "Submit", funcation: () {}),
      body: Stack(
        children: [
          // Image is here start
          Container(
            height: 260,
            width: double.maxFinite,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/hospital1.jpg"),
                    fit: BoxFit.fill)),
          ),
          Container(
            height: 260,
            width: double.maxFinite,
            color: Theme.of(context).primaryColorDark.withOpacity(0.3),
          ),
          // Image is here end

          Positioned(
            top: 20,
            left: 20,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              height: 60,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColorLight,
                        border: Border.all(
                            color: Theme.of(context)
                                .disabledColor
                                .withOpacity(0.5)),
                      ),
                      child: Icon(
                        CupertinoIcons.arrow_left,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColorLight,
                      border: Border.all(
                          color:
                              Theme.of(context).disabledColor.withOpacity(0.5)),
                    ),
                    child: Icon(
                      Icons.share,
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColorLight,
                      border: Border.all(
                          color:
                              Theme.of(context).disabledColor.withOpacity(0.5)),
                    ),
                    child: Center(
                      child: Icon(
                        CupertinoIcons.heart,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Details Widget is here
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    margin: const EdgeInsets.only(top: 210),
                    height: MediaQuery.of(context).size.height - 220,
                    padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Serenity Wellness Clinic",
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text("Dental, Skin Care, Eye Care",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context).disabledColor,
                                )),
                        Divider(
                          thickness: 1.5,
                          color:
                              Theme.of(context).disabledColor.withOpacity(0.2),
                        ),
                        Row(
                          children: [
                            Icon(CupertinoIcons.location_solid,
                                size: 16,
                                color: Theme.of(context).primaryColor),
                            const SizedBox(
                              width: 6,
                            ),
                            Text("8502, Prestron Rd, Raipur",
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
                        SizedBox(
                          height: 24,
                          child: Row(
                            children: [
                              Icon(Icons.access_time_filled,
                                  size: 16,
                                  color: Theme.of(context).primaryColor),
                              const SizedBox(
                                width: 6,
                              ),
                              Text("15 min ",
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
                              Text(" 2.5 km ",
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
                              Text("  Mon - Sun",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Theme.of(context).disabledColor,
                                      )),
                              const VerticalDivider(
                                thickness: 1.5,
                              ),
                              Text("  11 AM - 11 PM",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Theme.of(context).disabledColor,
                                      )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(
                          thickness: 0.5,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "Your overall rating of this Hospital",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context).disabledColor,
                                ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: AnimatedRatingStars(
                            minRating: 0.5,
                            initialRating: starRating,
                            customFilledIcon: CupertinoIcons.star_fill,
                            customHalfFilledIcon:
                                CupertinoIcons.star_lefthalf_fill,
                            customEmptyIcon: CupertinoIcons.star,
                            onChanged: (p0) {
                              starRating = p0;
                              // setState(() {

                              // });
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Add detailed review",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        TextFormField(
                          maxLines: 5,
                          decoration: const InputDecoration(
                            hintText: "Enter Here",
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.add_a_photo_outlined,
                              color: Theme.of(context).primaryColor,
                              size: 20,
                            ),
                            Text(
                              "  add photo",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 200,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          CupertinoIcons.star_fill,
                          color: Theme.of(context).primaryColorLight,
                          size: 14,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          "4.8",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColorLight,
                                  ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          "( 1.4K+ reviews )",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: Theme.of(context).primaryColorLight,
                                  ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //  Rating Widget
        ],
      ),
    );
  }
}
