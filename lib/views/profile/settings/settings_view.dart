import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../resources/components/custom_back_button_widget.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

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
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
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
                    // Navigator.pushNamed(context, RouteNames.yourProfileView);
                  },
                  title: Text("Notification Settings",
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
                    CupertinoIcons.lock_shield,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ),
                  horizontalTitleGap: 0.0,
                  onTap: () {
                    // Navigator.pushNamed(context, RouteNames.yourProfileView);
                  },
                  title: Text("Password Manager",
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
                    // Navigator.pushNamed(context, RouteNames.yourProfileView);
                  },
                  title: Text("Delete Account",
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
