import 'package:care_connect/resources/components/custom_input_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../resources/components/custom_back_button_widget.dart';
import '../../../utils/routes/route_names.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key});

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  bool isSecureText = true;
  bool isConfirmSecureText = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomBackButtonWidget(),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "New Password",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              "Your new password must be diffrent from previously used passwords.",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).disabledColor),
            )),
            const SizedBox(
              height: 30,
            ),
            CustomInputFieldWidget(
              fieldName: "Password",
              hindText: "********",
              isSecureText: isSecureText,
              icon: InkWell(
                  onTap: () {
                    setState(() {
                      isSecureText = !isSecureText;
                    });
                  },
                  child: (isSecureText)
                      ? const Icon(CupertinoIcons.eye_slash)
                      : const Icon(CupertinoIcons.eye)),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomInputFieldWidget(
              fieldName: "Confirm Password",
              hindText: "********",
              isSecureText: isConfirmSecureText,
              icon: InkWell(
                  onTap: () {
                    setState(() {
                      isConfirmSecureText = !isConfirmSecureText;
                    });
                  },
                  child: (isConfirmSecureText)
                      ? const Icon(CupertinoIcons.eye_slash)
                      : const Icon(CupertinoIcons.eye)),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                child: Text(
                  "Create New Password",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).primaryColorLight,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.completeProfileView);
                }),
          ],
        ),
      ),
    );
  }
}
