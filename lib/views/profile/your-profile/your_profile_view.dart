import 'package:care_connect/resources/components/custom_input_field_widget.dart';
import 'package:flutter/material.dart';

import '../../../resources/components/custom_back_button_widget.dart';
import '../../../resources/components/custom_bottom_button_widget.dart';

class YourProfileView extends StatefulWidget {
  const YourProfileView({super.key});

  @override
  State<YourProfileView> createState() => _YourProfileViewState();
}

class _YourProfileViewState extends State<YourProfileView> {
  TextEditingController nameController =
      TextEditingController(text: "Aaditya App Dev");
  // TextEditingController nameController =
  //     TextEditingController();

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
          "Your Profile",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar:
          CustomBottomButtonWidget(text: "Update Profile", funcation: () {}),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              CustomInputFieldWidget(
                fieldName: "Name",
                hindText: "Aaditya Dhiwer",
                controller: nameController,
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomInputFieldWidget(
                  fieldName: "Phone Number", hindText: "9876543210"),
              const SizedBox(
                height: 10,
              ),
              const CustomInputFieldWidget(
                  fieldName: "Email", hindText: "aaditya.appdev@gmail.com"),
              const SizedBox(
                height: 10,
              ),
              const CustomInputFieldWidget(fieldName: "DOB", hindText: "DD/MM/YYYY"),
            ],
          ),
        ),
      ),
    );
  }
}
