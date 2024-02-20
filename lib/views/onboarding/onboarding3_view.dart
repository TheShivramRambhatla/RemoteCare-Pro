import 'package:flutter/material.dart';

class OnboardingView3 extends StatelessWidget {
  const OnboardingView3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage("assets/images/Illustrations3.PNG"))),
        ),
        const SizedBox(
          height: 10,
        ),
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                  text: "Learn About ",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Theme.of(context).primaryColor),
                  children: [
                    TextSpan(
                        text: "Your Doctor",
                        style: Theme.of(context).textTheme.headlineSmall),
                  ]),
            ])),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Gain insights into your doctor's qualifications, experience, and patient testimonials, empowering you to make informed choices.",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Theme.of(context).disabledColor),
          textAlign: TextAlign.center,
        ),
      ],
    ));
  }
}
