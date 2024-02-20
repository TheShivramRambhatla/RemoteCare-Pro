import 'package:flutter/material.dart';

class OnboardingView2 extends StatelessWidget {
  const OnboardingView2({super.key});

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
                  image: AssetImage("assets/images/Illustrations2.PNG"))),
        ),
        const SizedBox(
          height: 10,
        ),
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                  text: "Effortless ",
                  style: Theme.of(context).textTheme.headlineSmall,
                  children: [
                    TextSpan(
                        text: "Appointment ",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: Theme.of(context).primaryColor)),
                    const TextSpan(text: "Booking")
                  ]),
            ])),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Simplified, hassle-free appointment scheduling, ensuring a seamless experience for users, patients, or clients.",
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
