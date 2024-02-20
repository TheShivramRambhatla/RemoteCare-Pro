import 'package:care_connect/resources/components/app_title_widget.dart';
import 'package:care_connect/utils/routes/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../resources/components/custom_back_button_widget.dart';
import '../../resources/components/custom_bottom_button_widget.dart';

class SelectPackageView extends StatefulWidget {
  const SelectPackageView({super.key});

  @override
  State<SelectPackageView> createState() => _SelectPackageViewState();
}

class _SelectPackageViewState extends State<SelectPackageView> {
  List<int> timeIntervals = List.generate(12, (index) => (index + 1) * 5);
  int selectedTimeInterval = 5;
  String _selectedPackage = "messaging";
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
          "Select Package",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: CustomBottomButtonWidget(
          text: "Next",
          funcation: () {
            Navigator.pushNamed(context, RouteNames.pateintsDetailsView);
          }),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 40,
            ),
            const AppTitleWidget(
              title: "Select Duration",
              isSeeAll: false,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: InputDecorator(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.timer,
                      color: Theme.of(context).primaryColor,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 2, horizontal: 20)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<int>(
                    padding: EdgeInsets.zero,
                    menuMaxHeight: 300,
                    icon: Icon(
                      CupertinoIcons.chevron_down,
                      color: Theme.of(context).primaryColor,
                    ),
                    value: selectedTimeInterval,
                    onChanged: (value) {
                      setState(() {
                        selectedTimeInterval = value!;
                      });
                    },
                    items: timeIntervals.map((time) {
                      return DropdownMenuItem<int>(
                        value: time,
                        child: Text('$time minutes'),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const AppTitleWidget(
              title: "Select Package",
              isSeeAll: false,
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              margin: EdgeInsets.zero,
              child: ListTile(
                onTap: () {
                  setState(() {
                    _selectedPackage = "messaging";
                  });
                },
                leading: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor.withOpacity(0.1)),
                    child: Icon(
                      Icons.textsms,
                      color: Theme.of(context).primaryColor,
                      size: 24,
                    )),
                title: Text(
                  "Messaging",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: Text(
                  "Chat with Doctor",
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).disabledColor),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        Text(
                          "${150 + selectedTimeInterval + 20} \u20B9",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          "/$selectedTimeInterval min",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Theme.of(context).disabledColor),
                        )
                      ],
                    ),
                    Radio(
                      value: "messaging",
                      groupValue: _selectedPackage,
                      onChanged: (value) {
                        setState(() {
                          _selectedPackage = value!;
                        });
                      },
                      activeColor: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              margin: EdgeInsets.zero,
              child: ListTile(
                onTap: () {
                  setState(() {
                    _selectedPackage = "voice call";
                  });
                },
                leading: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor.withOpacity(0.1)),
                    child: Icon(
                      CupertinoIcons.phone_fill,
                      color: Theme.of(context).primaryColor,
                      size: 24,
                    )),
                title: Text(
                  "Voice Call",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: Text(
                  "Voice call with doctor",
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).disabledColor),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        Text(
                          "${200 + selectedTimeInterval + 20} \u20B9",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          "/$selectedTimeInterval min",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Theme.of(context).disabledColor),
                        )
                      ],
                    ),
                    Radio(
                      value: "voice call",
                      groupValue: _selectedPackage,
                      onChanged: (value) {
                        setState(() {
                          _selectedPackage = value!;
                        });
                      },
                      activeColor: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              margin: EdgeInsets.zero,
              child: ListTile(
                onTap: () {
                  setState(() {
                    _selectedPackage = "video call";
                  });
                },
                leading: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor.withOpacity(0.1)),
                    child: Icon(
                      FontAwesomeIcons.video,
                      color: Theme.of(context).primaryColor,
                      size: 24,
                    )),
                title: Text(
                  "Video Call",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: Text(
                  "Video call with Doctor",
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).disabledColor),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        Text(
                          "${250 + selectedTimeInterval + 20} \u20B9",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          "/$selectedTimeInterval min",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Theme.of(context).disabledColor),
                        )
                      ],
                    ),
                    Radio(
                      value: "video call",
                      groupValue: _selectedPackage,
                      onChanged: (value) {
                        setState(() {
                          _selectedPackage = value!;
                        });
                      },
                      activeColor: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              margin: EdgeInsets.zero,
              child: ListTile(
                onTap: () {
                  setState(() {
                    _selectedPackage = "in person";
                  });
                },
                leading: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor.withOpacity(0.1)),
                    child: Icon(
                      CupertinoIcons.person_solid,
                      color: Theme.of(context).primaryColor,
                      size: 24,
                    )),
                title: Text(
                  "In Person",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: Text(
                  "In Person visit with Doctor",
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).disabledColor),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        Text(
                          "${300 + selectedTimeInterval + 20} \u20B9",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          "/$selectedTimeInterval min",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Theme.of(context).disabledColor),
                        )
                      ],
                    ),
                    Radio(
                      value: "in person",
                      groupValue: _selectedPackage,
                      onChanged: (value) {
                        setState(() {
                          _selectedPackage = value!;
                        });
                      },
                      activeColor: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
