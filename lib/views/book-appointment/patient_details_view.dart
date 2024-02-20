import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/components/custom_back_button_widget.dart';
import '../../resources/components/custom_bottom_button_widget.dart';
import '../../utils/routes/route_names.dart';

class PateintsDetailsView extends StatefulWidget {
  const PateintsDetailsView({super.key});

  @override
  State<PateintsDetailsView> createState() => _PateintsDetailsViewState();
}

class _PateintsDetailsViewState extends State<PateintsDetailsView> {
  @override
  void initState() {
    ageList = generateAgeList();
    super.initState();
  }

  late List<String> ageList;
  String selectAge = '20 Years';
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
          "Patient Details",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: CustomBottomButtonWidget(
          text: "Next",
          funcation: () {
            Navigator.pushNamed(context, RouteNames.paymentDatailsView);
          }),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                "Booking for",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 6,
              ),
              InputDecorator(
                decoration: InputDecoration(
                  suffix: DropdownButtonHideUnderline(
                    child: SizedBox(
                      height: 20,
                      width: double.maxFinite,
                      child: DropdownButton<String>(
                        value: selectedBookingFor,
                        icon: Icon(
                          CupertinoIcons.chevron_down,
                          color: Theme.of(context).primaryColor,
                        ),
                        menuMaxHeight: 200,
                        items: bookingForList.map((gen) {
                          return DropdownMenuItem<String>(
                            value: gen,
                            child: Text(
                              gen,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedBookingFor = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Select Gender",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 6,
              ),
              InputDecorator(
                decoration: InputDecoration(
                  hintText: "Select",
                  suffix: DropdownButtonHideUnderline(
                    child: SizedBox(
                      height: 20,
                      width: double.maxFinite,
                      child: DropdownButton<String>(
                        value: selectedGender,
                        icon: Icon(
                          CupertinoIcons.chevron_down,
                          color: Theme.of(context).primaryColor,
                        ),
                        menuMaxHeight: 200,
                        items: gender.map((gen) {
                          return DropdownMenuItem<String>(
                            value: gen,
                            child: Text(
                              gen,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Your Age",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 6,
              ),
              InputDecorator(
                decoration: InputDecoration(
                  suffix: DropdownButtonHideUnderline(
                    child: SizedBox(
                      height: 20,
                      width: double.maxFinite,
                      child: DropdownButton<String>(
                        value: selectAge,
                        icon: Icon(
                          CupertinoIcons.chevron_down,
                          color: Theme.of(context).primaryColor,
                        ),
                        menuMaxHeight: 200,
                        items: ageList.map((gen) {
                          return DropdownMenuItem<String>(
                            value: gen,
                            child: Text(
                              gen,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectAge = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Write Your Problem",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 6,
              ),
              TextField(
                maxLines: 7,
                decoration: InputDecoration(
                    hintText: "Write here...",
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Theme.of(context).disabledColor)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String selectedGender = "Male";
  List<String> gender = ["Male", "Female", "Other"];
  String selectedBookingFor = "Self";
  List<String> bookingForList = [
    "Self",
    "Customer",
    "Other",
  ];

  List<String> generateAgeList() {
    List<String> ageList = [];

    for (int age = 1; age <= 80; age++) {
      ageList.add("$age Years");
    }

    return ageList;
  }
}
