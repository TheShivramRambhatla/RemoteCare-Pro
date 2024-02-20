import 'package:care_connect/resources/components/custom_input_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/routes/route_names.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  bool isSecureText = true;
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Create Account",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Fill your information below or register with social media account.",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).disabledColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            const CustomInputFieldWidget(
                fieldName: "Name", hindText: "Aaditya Dhiwer"),
            const SizedBox(
              height: 10,
            ),
            const CustomInputFieldWidget(
                fieldName: "Email", hindText: "aaditya.appdev@gmail.com"),
            const SizedBox(
              height: 10,
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
            Row(
              children: [
                CupertinoCheckbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    }),
                Text(
                  "Agree with  ",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "Terms & Condition",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      decoration: TextDecoration.underline,
                      color: Theme.of(context).primaryColor),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, RouteNames.verifyCodeView);
                },
                child: Text(
                  "Sign Up",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).primaryColorLight,
                      fontWeight: FontWeight.bold),
                )),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Divider(
                      color: Theme.of(context).disabledColor,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "or sign in with",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Theme.of(context).disabledColor),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Divider(
                      color: Theme.of(context).disabledColor,
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color:
                              Theme.of(context).disabledColor.withOpacity(0.5)),
                      image: const DecorationImage(
                          image: AssetImage("assets/icons/apple.png"))),
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color:
                              Theme.of(context).disabledColor.withOpacity(0.5)),
                      image: const DecorationImage(
                          image: AssetImage("assets/icons/google.png"))),
                ),
                Container(
                  height: 60,
                  width: 60,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color:
                              Theme.of(context).disabledColor.withOpacity(0.5)),
                      image: const DecorationImage(
                          image: AssetImage("assets/icons/facebook.png"))),
                )
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.signInView);
                  },
                  child: Text(
                    "Sign In",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).primaryColor),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
