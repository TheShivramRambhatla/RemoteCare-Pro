import 'package:care_connect/utils/routes/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/routes/utils.dart';

class AllowLocationAccessView extends StatelessWidget {
  const AllowLocationAccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const Spacer(),
            Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.3),
                  shape: BoxShape.circle),
              child: Icon(
                CupertinoIcons.location_solid,
                color: Theme.of(context).primaryColor,
                size: 50,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Complete Your Profile",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Don't worry, only you can see your personal data. No one else will be able to see it.",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).disabledColor),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                child: Text(
                  "Allow Location Access",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).primaryColorLight,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  UtilsClass.getCurrentLocation().then((value) {
                    value.latitude;
                    value.longitude;
                    Navigator.pushReplacementNamed(
                        context, RouteNames.dashboardView);
                  });
                }),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                child: Text(
                  "Enter Location Manually",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.locationManuallyView);
                }),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
