import 'package:flutter/material.dart';

class OnboardingView1 extends StatelessWidget {
  const OnboardingView1({super.key});

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
                  image: AssetImage("assets/images/Illustrations1.PNG"))),
        ),
        const SizedBox(
          height: 10,
        ),
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                  text: "Discover ",
                  style: Theme.of(context).textTheme.headlineSmall,
                  children: [
                    TextSpan(
                        text: "Experienced Doctor ",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: Theme.of(context).primaryColor)),
                  ]),
            ])),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Highly skilled, knowledgeable, and compassionate, an experienced doctor provides expert care and healing to patients.",
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
