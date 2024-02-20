import 'package:care_connect/utils/routes/route_names.dart';
import 'package:care_connect/utils/routes/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const Row(
        //   children: [
        //     Spacer(),
        //     CustomBackButtonWidget(),
        //   ],
        // ),
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                      height: 120,
                      width: 120,
                      padding: const EdgeInsets.only(right: 4, bottom: 4),
                      child: CircleAvatar(
                        backgroundImage: const AssetImage(
                          "assets/images/doctor1.png",
                        ),
                        backgroundColor:
                            Theme.of(context).disabledColor.withOpacity(0.3),
                      )),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle,
                        border: Border.all(width: 3.0, color: Colors.white),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Icon(
                        Icons.edit_outlined,
                        color: Theme.of(context).primaryColorLight,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Aaditya AppDev",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              elevation: 0.5,
              child: ListTile(
                  leading: Icon(
                    CupertinoIcons.person,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ),
                  horizontalTitleGap: 0.0,
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.yourProfileView);
                  },
                  title: Text("Your Profile",
                      style: Theme.of(context).textTheme.labelLarge),
                  trailing: Icon(
                    CupertinoIcons.chevron_forward,
                    color: Theme.of(context).primaryColor,
                  )),
            ),
            Card(
              elevation: 0.5,
              child: ListTile(
                  leading: Icon(
                    FontAwesomeIcons.creditCard,
                    color: Theme.of(context).primaryColor,
                  ),
                  horizontalTitleGap: 0.0,
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.paymentDatailsView);
                  },
                  title: Text("Payment Methods",
                      style: Theme.of(context).textTheme.labelLarge),
                  trailing: Icon(
                    CupertinoIcons.chevron_forward,
                    color: Theme.of(context).primaryColor,
                  )),
            ),
            Card(
              elevation: 0.5,
              child: ListTile(
                  leading: Icon(
                    CupertinoIcons.heart,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ),
                  horizontalTitleGap: 0.0,
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.favoriteView);
                  },
                  title: Text("Favourite",
                      style: Theme.of(context).textTheme.labelLarge),
                  trailing: Icon(
                    CupertinoIcons.chevron_forward,
                    color: Theme.of(context).primaryColor,
                  )),
            ),
            Card(
              elevation: 0.5,
              child: ListTile(
                  leading: Icon(
                    CupertinoIcons.gear,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ),
                  horizontalTitleGap: 0.0,
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.settingsView);
                  },
                  title: Text("Settings",
                      style: Theme.of(context).textTheme.labelLarge),
                  trailing: Icon(
                    CupertinoIcons.chevron_forward,
                    color: Theme.of(context).primaryColor,
                  )),
            ),
            Card(
              elevation: 0.5,
              child: ListTile(
                  leading: Icon(
                    Icons.info_outline_rounded,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ),
                  horizontalTitleGap: 0.0,
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.helpCenterView);
                  },
                  title: Text("Help Center",
                      style: Theme.of(context).textTheme.labelLarge),
                  trailing: Icon(
                    CupertinoIcons.chevron_forward,
                    color: Theme.of(context).primaryColor,
                  )),
            ),
            Card(
              elevation: 0.5,
              child: ListTile(
                  leading: Icon(
                    Icons.lock_outline,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ),
                  horizontalTitleGap: 0.0,
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.privacyPolicyView);
                  },
                  title: Text("Privacy Policy",
                      style: Theme.of(context).textTheme.labelLarge),
                  trailing: Icon(
                    CupertinoIcons.chevron_forward,
                    color: Theme.of(context).primaryColor,
                  )),
            ),
            Card(
              elevation: 0.5,
              child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ),
                  horizontalTitleGap: 0.0,
                  onTap: () {
                    UtilsClass.logOutFunction(context);
                  },
                  title: Text("Log Out",
                      style: Theme.of(context).textTheme.labelLarge),
                  trailing: Icon(
                    CupertinoIcons.chevron_forward,
                    color: Theme.of(context).primaryColor,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
