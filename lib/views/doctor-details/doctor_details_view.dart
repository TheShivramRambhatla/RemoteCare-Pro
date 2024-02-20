import 'package:care_connect/utils/routes/route_names.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../resources/components/custom_back_button_widget.dart';
import '../../resources/components/custom_bottom_button_widget.dart';
import '../../resources/components/verified_user_image_widget.dart';
import 'review_widget.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context),
      bottomNavigationBar: CustomBottomButtonWidget(
        text: "Book Appointment",
        funcation: () {
          Navigator.pushNamed(context, RouteNames.bookAnAppointmentView);
        },
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const DoctorAppointmentCardWidget(),
              const SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 2,
                color: Theme.of(context).disabledColor.withOpacity(0.2),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DoctorWorkingWidget(
                    iconData: CupertinoIcons.person_2_fill,
                    lable: "Pateints",
                    experince: "7500+",
                  ),
                  DoctorWorkingWidget(
                    iconData: FontAwesomeIcons.briefcase,
                    lable: "Exp.",
                    experince: "10+",
                  ),
                  DoctorWorkingWidget(
                    iconData: CupertinoIcons.star_slash_fill,
                    lable: "Rating",
                    experince: "4.5",
                  ),
                  DoctorWorkingWidget(
                    iconData: CupertinoIcons.chat_bubble_text_fill,
                    lable: "Reviews",
                    experince: "2549+",
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "About",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              ExpandableText(
                "Our virtual doctors are dedicated to providing high-quality, remote healthcare consultations, ensuring accessible and personalized medical care for all.",
                expandText: 'show more',
                collapseText: 'show less',
                maxLines: 3,
                linkColor: Theme.of(context).primaryColor,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).disabledColor),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Working Hours",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Divider(
                  thickness: 2,
                  color: Theme.of(context).disabledColor.withOpacity(0.2)),
              const SizedBox(
                height: 10,
              ),
              workingHoursWidget(context),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Address",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Expanded(child: Container()),
                  Text(
                    "View on Map",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  )
                ],
              ),
              Divider(
                  thickness: 2,
                  color: Theme.of(context).disabledColor.withOpacity(0.2)),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Theme.of(context).primaryColor,
                    size: 22,
                  ),
                  Text(
                    "Tatibandh, Raipur Chhattisgarh",
                    style: Theme.of(context).textTheme.bodyMedium!,
                  )
                ],
              ),
              Container(
                height: 200,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).disabledColor),
              ),
              const SizedBox(
                height: 20,
              ),
              const ReviewForHospitalWidget(),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBarWidget(BuildContext context) {
    return AppBar(
      leading: const Row(
        children: [
          Spacer(),
          CustomBackButtonWidget(),
        ],
      ),
      title: Text(
        "Doctor Details",
        style: Theme.of(context).textTheme.titleLarge,
      ),
      centerTitle: true,
      actions: [
        InkWell(
          onTap: () {
            // Navigator.pop(context);
          },
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: Theme.of(context).disabledColor.withOpacity(0.5)),
            ),
            child: Icon(
              Icons.share,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            // Navigator.pop(context);
          },
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: Theme.of(context).disabledColor.withOpacity(0.5)),
            ),
            child: Icon(
              CupertinoIcons.heart,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }

  Column workingHoursWidget(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Monday",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).disabledColor),
            ),
            Expanded(child: Container()),
            Text(
              "09:00 - 08:00",
              style: Theme.of(context).textTheme.bodyMedium!,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "Tuesday",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).disabledColor),
            ),
            Expanded(child: Container()),
            Text(
              "09:00 - 08:00",
              style: Theme.of(context).textTheme.bodyMedium!,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "Wednesday",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).disabledColor),
            ),
            Expanded(child: Container()),
            Text(
              "09:00 - 08:00",
              style: Theme.of(context).textTheme.bodyMedium!,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "Thursday",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).disabledColor),
            ),
            Expanded(child: Container()),
            Text(
              "09:00 - 08:00",
              style: Theme.of(context).textTheme.bodyMedium!,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "Friday",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).disabledColor),
            ),
            Expanded(child: Container()),
            Text(
              "09:00 - 08:00",
              style: Theme.of(context).textTheme.bodyMedium!,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "Saturday",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).disabledColor),
            ),
            Expanded(child: Container()),
            Text(
              "09:00 - 08:00",
              style: Theme.of(context).textTheme.bodyMedium!,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "Sunday",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).disabledColor),
            ),
            Expanded(child: Container()),
            Text(
              "09:00 - 08:00",
              style: Theme.of(context).textTheme.bodyMedium!,
            ),
          ],
        ),
      ],
    );
  }
}

class DoctorAppointmentCardWidget extends StatelessWidget {
  const DoctorAppointmentCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const VerifiedUserImageWidget(
          image: "assets/images/doctor4.png",
          radius: 80,
        ),
        const SizedBox(
          width: 14,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dr. Bharti Sharma",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "Dentist",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).disabledColor),
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  CupertinoIcons.location_solid,
                  color: Theme.of(context).primaryColor,
                  size: 20,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "Raipur, Chhattisgarh",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).disabledColor),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  width: 4,
                ),
                Icon(CupertinoIcons.map_fill,
                    size: 20, color: Theme.of(context).primaryColor),
              ],
            )
          ],
        )
      ],
    );
  }
}

class DoctorWorkingWidget extends StatelessWidget {
  final IconData iconData;
  final String lable;
  final String experince;

  const DoctorWorkingWidget(
      {super.key,
      required this.iconData,
      required this.lable,
      required this.experince});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor.withOpacity(0.1)),
            child: Icon(
              iconData,
              color: Theme.of(context).primaryColor,
              size: 24,
            )),
        Text(
          experince,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).primaryColor),
        ),
        SizedBox(
          width: 60,
          child: Center(
            child: Text(
              lable,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Theme.of(context).disabledColor),
            ),
          ),
        ),
      ],
    );
  }
}
