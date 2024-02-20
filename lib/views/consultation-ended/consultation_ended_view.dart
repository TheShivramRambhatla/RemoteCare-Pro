import 'package:care_connect/resources/components/verified_user_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/components/custom_back_button_widget.dart';
import '../../resources/components/custom_bottom_button_ver2_widget.dart';

class ConsultationEndedView extends StatelessWidget {
  const ConsultationEndedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Row(
          children: [
            Spacer(),
            CustomBackButtonWidget(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomButtonVer2Widget(
        funcation1: () {},
        funcation2: () {},
        text1: "Back to Home",
        text2: "Add Review",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor),
                child: Icon(
                  Icons.access_time_filled,
                  color: Theme.of(context).primaryColorLight,
                  size: 50,
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Text(
              "The Consultation Session has ended",
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Recording have been saved in activity.",
              textAlign: TextAlign.justify,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).disabledColor),
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 0.5,
              color: Theme.of(context).disabledColor.withOpacity(0.5),
            ),
            const SizedBox(
              height: 10,
            ),
            const VerifiedUserImageWidget(
                image: "assets/images/doctor1.png", radius: 80),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Suman Sahu",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Dentist",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).disabledColor),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.location_solid,
                  color: Theme.of(context).primaryColor,
                ),
                Text(
                  "New Rajendra Nagar Raipur",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).disabledColor),
                ),
              ],
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
