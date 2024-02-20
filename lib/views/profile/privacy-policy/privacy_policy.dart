import 'package:flutter/material.dart';

import '../../../resources/components/custom_back_button_widget.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

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
          "Privacy Policy",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
                "Cancelation Policy",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nisl in bibendum scelerisque, ex nibh vulputate massa, vel bibendum nisi ipsum et nulla. Sed euismod, nisl in bibendum scelerisque,\n\nex nibh vulputate massa, vel bibendum nisi ipsum et nulla. Sed euismod, nisl in bibendum scelerisque, "),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Terms & Conditions",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nisl in bibendum scelerisque, ex nibh vulputate massa, vel bibendum nisi ipsum et nulla. Sed euismod, nisl in bibendum scelerisque, ex nibh vulputate massa, vel bibendum nisi ipsum et nulla. Sed euismod, nisl in bibendum scelerisque, ex nibh vulputate massa, vel bibendum nisi ipsum et nulla. Sed euismod, nisl in bibendum scelerisque,\n\n ex nibh vulputate massa, vel bibendum nisi ipsum et nulla. Sed euismod, nisl in bibendum scelerisque, ex nibh vulputate massa, vel bibendum nisi ipsum et nulla. Sed euismod, nisl in bibendum scelerisque, ex nibh vulputate massa, vel bibendum nisi ipsum et nulla. Sed euismod, nisl in bibendum scelerisque, ex nibh vulputate massa, vel bibendum nisi ipsum et nulla. Sed euismod, nisl in bibendum scelerisque,\n\n ex nibh vulputate massa, vel bibendum nisi ipsum et nulla. Sed euismod, nisl in bibendum scelerisque, ex nibh vulputate massa, vel bibendum nisi ipsum et nulla. Sed euismod, nisl in bibendum scelerisque,\n\n ex nibh vulputate massa, vel bibendum nisi ipsum et nulla. Sed euismod, nisl in bibendum scelerisque, ex nibh vulputate massa, vel bibendum nisi ipsum et nulla. Sed euismod, nisl in bibendum scelerisque.")
            ],
          ),
        ),
      ),
    );
  }
}
