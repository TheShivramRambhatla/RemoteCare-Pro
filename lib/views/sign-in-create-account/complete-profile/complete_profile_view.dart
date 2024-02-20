import 'package:care_connect/utils/routes/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../resources/components/custom_back_button_widget.dart';
import '../../../resources/components/custom_input_field_widget.dart';

class CompleteProfileView extends StatefulWidget {
  const CompleteProfileView({super.key});

  @override
  State<CompleteProfileView> createState() => _CompleteProfileViewState();
}

class _CompleteProfileViewState extends State<CompleteProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomBackButtonWidget(),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "Complete Your Profile",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                "Don't worry, only you can see your personal data. No one else will be able to see it.",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).disabledColor),
              )),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).disabledColor.withOpacity(0.3),
                          shape: BoxShape.circle),
                      child: Icon(
                        CupertinoIcons.person_solid,
                        color: Theme.of(context).disabledColor,
                        size: 50,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.circle),
                        child: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Theme.of(context).primaryColorLight,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const CustomInputFieldWidget(
                fieldName: "Name",
                hindText: "Aaditya Dhiwer",
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Phone Number",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 6,
              ),
              InputDecorator(
                decoration: InputDecoration(
                  prefix: DropdownButtonHideUnderline(
                    child: SizedBox(
                      height: 20,
                      width: 70,
                      child: DropdownButton<String>(
                        value: selectedCountryCode,
                        menuMaxHeight: 200,
                        items: countryCodes.map((code) {
                          return DropdownMenuItem<String>(
                            value: code['code'],
                            child: Text(
                              code['code']!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Theme.of(context).disabledColor),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCountryCode = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                child: SizedBox(
                  height: 20,
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')),
                      LengthLimitingTextInputFormatter(10),
                    ],
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
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
                        icon: const Icon(CupertinoIcons.chevron_down),
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
                height: 10,
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  child: Text(
                    "Complete Profile",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).primaryColorLight,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.pushReplacementNamed(
                        context, RouteNames.allowLocationView);
                  }),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String selectedCountryCode = '+91';

  // List of country codes and their respective names
  List<Map<String, String>> countryCodes = [
    {"name": "United States", "code": "+1"},
    {"name": "Canada", "code": "+1"},
    {"name": "United Kingdom", "code": "+44"},
    {"name": "Australia", "code": "+61"},
    {"name": "India", "code": "+91"},
    {"name": "Germany", "code": "+49"},
    {"name": "France", "code": "+33"},
    {"name": "Brazil", "code": "+55"},
    {"name": "Japan", "code": "+81"},
    {"name": "South Korea", "code": "+82"},
    {"name": "China", "code": "+86"},
    {"name": "Mexico", "code": "+52"},
    {"name": "Russia", "code": "+7"},
    {"name": "Italy", "code": "+39"},
    {"name": "Spain", "code": "+34"},
    {"name": "Argentina", "code": "+54"},
    {"name": "South Africa", "code": "+27"},
    {"name": "Turkey", "code": "+90"},
    {"name": "Saudi Arabia", "code": "+966"}
  ];
  String selectedGender = "Select";
  List<String> gender = ["Select", "Male", "Female", "Other"];
}
