import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/doctor_consultation_03.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 10,
                top: 30,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Your ",
                          style: Theme.of(context).textTheme.headline6,
                          children: [
                            TextSpan(
                              text: "Ultimate Doctor ",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                            const TextSpan(text: " Appointment Booking App"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Book appointments effortlessly and manage your health journey.",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Theme.of(context).disabledColor,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Let's Get Started",
                      style: TextStyle(
                        color: Theme.of(context).primaryColorLight,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?  ",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      Text(
                        "Sign in",
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Theme.of(context).primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Add the section for "MY PRESCRIPTIONS"
                  ExpansionTile(
                    title: Text(
                      'MY PRESCRIPTIONS',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    children: [
                      // List of prescriptions (dummy data)
                      PrescriptionTile(
                        doctorName: 'Dr. John Doe',
                        medication: 'Medication A',
                      ),
                      PrescriptionTile(
                        doctorName: 'Dr. Jane Smith',
                        medication: 'Medication B',
                      ),
                      PrescriptionTile(
                        doctorName: 'Dr. Michael Johnson',
                        medication: 'Medication C',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom widget for displaying a prescription tile
class PrescriptionTile extends StatelessWidget {
  final String doctorName;
  final String medication;

  const PrescriptionTile({
    required this.doctorName,
    required this.medication,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(doctorName),
      subtitle: Text('Medication: $medication'),
    );
  }
}
