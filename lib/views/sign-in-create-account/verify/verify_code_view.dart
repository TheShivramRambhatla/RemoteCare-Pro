import 'package:care_connect/resources/components/verification_input_code_controller.dart';
import 'package:care_connect/resources/components/verification_input_code_widget.dart';
import 'package:care_connect/resources/components/custom_back_button_widget.dart';
import 'package:care_connect/utils/routes/route_names.dart';
import 'package:flutter/material.dart';

class VerifyCodeView extends StatelessWidget {
  const VerifyCodeView({super.key, this.email = "aaditya.appdev@gmail.com"});
  final String email;

  @override
  Widget build(BuildContext context) {
    VerificationCodeInputController verificationCodeInputController =
        VerificationCodeInputController(4);
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
                "Verify Code",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Please enter the code we just sent to email ",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Theme.of(context).disabledColor),
                        children: [
                          TextSpan(
                              text: email,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Theme.of(context).primaryColor)),
                        ]),
                  ])),
            ),
            const SizedBox(
              height: 30,
            ),
            VerificationInputCodeWidget(
              controller: verificationCodeInputController,
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Didn't recived OTP? \n",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Theme.of(context).disabledColor),
                        children: [
                          TextSpan(
                              text: "Resend code",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Theme.of(context).primaryColor)),
                        ]),
                  ])),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                child: Text(
                  "Verify",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).primaryColorLight,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.newPasswordView);
                }),
          ],
        ),
      ),
    );
  }
}
