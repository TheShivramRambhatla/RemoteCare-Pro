import 'package:flutter/material.dart';

import '../../resources/components/custom_back_button_widget.dart';
import '../../resources/components/custom_bottom_button_widget.dart';

class CancelBookingView extends StatefulWidget {
  const CancelBookingView({super.key});

  @override
  State<CancelBookingView> createState() => _CancelBookingViewState();
}

class _CancelBookingViewState extends State<CancelBookingView> {
  String cancellationReason = "schedule change";
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
          "Cancel Booking",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: CustomBottomButtonWidget(
          text: "Cancel Appointment", funcation: () {}),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Text("Please select the reason for cancellations:",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).disabledColor,
                      )),
              ListTile(
                onTap: () {
                  setState(() {
                    cancellationReason = "schedule change";
                  });
                },
                leading: Radio(
                    value: "schedule change",
                    groupValue: cancellationReason,
                    onChanged: (value) {
                      setState(() {
                        cancellationReason = value!;
                      });
                    }),
                title: const Text("Schedule Change"),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    cancellationReason = "weather condition";
                  });
                },
                leading: Radio(
                    value: "weather condition",
                    groupValue: cancellationReason,
                    onChanged: (value) {
                      setState(() {
                        cancellationReason = value!;
                      });
                    }),
                title: const Text(
                  "Weather Condition",
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    cancellationReason = "unexpacted work";
                  });
                },
                leading: Radio(
                    value: "unexpacted work",
                    groupValue: cancellationReason,
                    onChanged: (value) {
                      setState(() {
                        cancellationReason = value!;
                      });
                    }),
                title: const Text("Unexpacted Work"),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    cancellationReason = "childcare issue";
                  });
                },
                leading: Radio(
                    value: "childcare issue",
                    groupValue: cancellationReason,
                    onChanged: (value) {
                      setState(() {
                        cancellationReason = value!;
                      });
                    }),
                title: const Text("Childcare Issue"),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    cancellationReason = "travel delays";
                  });
                },
                leading: Radio(
                    value: "travel delays",
                    groupValue: cancellationReason,
                    onChanged: (value) {
                      setState(() {
                        cancellationReason = value!;
                      });
                    }),
                title: const Text("Travel Delays"),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    cancellationReason = "other";
                  });
                },
                leading: Radio(
                    value: "other",
                    groupValue: cancellationReason,
                    onChanged: (value) {
                      setState(() {
                        cancellationReason = value!;
                      });
                    }),
                title: const Text("Other"),
              ),
              const SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 0.5,
                color: Theme.of(context).disabledColor.withOpacity(0.5),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Other",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: "Enter Your Reason",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
