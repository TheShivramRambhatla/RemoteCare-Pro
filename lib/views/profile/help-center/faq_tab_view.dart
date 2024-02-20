import 'package:accordion/accordion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../doctor-details/review_widget.dart';

class FAQTabView extends StatefulWidget {
  const FAQTabView({super.key});

  @override
  State<FAQTabView> createState() => _FAQTabViewState();
}

class _FAQTabViewState extends State<FAQTabView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 30,
            width: double.maxFinite,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: faqListString.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: HorizentalTextWidget(
                        text: faqListString[index],
                        isSelected: (selectedIndex == index) ? true : false,
                      ),
                    ),
                  );
                }),
          ),
          Accordion(
              headerBackgroundColor: Theme.of(context).primaryColorLight,
              headerPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              headerBorderColor: Theme.of(context).primaryColorDark,
              headerBorderWidth: 0.1,
              contentBorderColor: Theme.of(context).primaryColorDark,
              contentBorderWidth: 0.1,
              disableScrolling: true,
              rightIcon: Icon(
                CupertinoIcons.chevron_down,
                color: Theme.of(context).primaryColor,
              ),
              children: [
                for (int i = 0; i < faqQuestions.length; i++) ...[
                  AccordionSection(
                      header: Text(faqQuestions[i]['question'].toString()),
                      content: Text(faqQuestions[i]['answer'].toString()))
                ]
              ])
        ],
      ),
    );
  }

  static const List<String> faqListString = [
    "All",
    "Services",
    "General",
    "Account",
  ];

  static const List<Map> faqQuestions = [
    {
      "question": "How do I schedule an appointment?",
      "answer":
          "(1) Visit our website or contact our customer service team to initiate the appointment scheduling process.\n(2) Provide the necessary information, such as your name, contact details, and the date and time you would like to schedule the appointment.\n(3) Our scheduling system will automatically check for Provide the necessary information, such as your name, contact details, and the date and time you would like to schedule the appointment.\n(4) Our scheduling system will automatically check for any availability based on your requested time.\nIf there is an available slot, you will be notified and provided with a confirmation number.\n(5) Once you receive the confirmation, you can proceed with the appointment by confirming your attendance and providing any required documentation.\n(6) If you need to reschedule or cancel the appointment, you can do so by contacting our customer service team",
    },
    {
      "question": "Can I reschedule or cancel an appointment?",
      "answer":
          "Yes, you can reschedule or cancel an appointment. The process for doing so may vary depending on the platform or service you are using to schedule appointments. Here are some general steps you can follow:"
    },
    {
      "question": "What if I have a medical emergency?",
      "answer":
          "If you have a medical emergency, please contact our customer service team immediately. We will be happy to assist you with any questions or concerns you may have.",
    },
    {
      "question": "What if I need to update my personal information?",
      "answer":
          "If you need to update your personal information, please contact our customer service team. We will be happy to assist you with any questions or concerns you may have.",
    },
    {
      "question": "What if I have any questions or concerns?",
      "answer":
          "If you have any questions or concerns, please contact our customer service team. We will be happy to assist you with any questions or concerns you may have.",
    },
    {
      "question": "How to Checked Pre-Booked Appointments?",
      "answer":
          "Log in to your appointment scheduling platform or service.\nAccess your account and navigate to the appointments section.\nReview the list of pre-booked appointments to see their details, such as date, time, and location."
    },
    {
      "question": "How do I pay for an appointment?",
      "answer":
          "Check the payment options provided by your appointment scheduling platform or service.\nSelect the payment method you prefer, such as credit card, PayPal, or card.\nEnter the necessary payment details, such as your credit card information or the amount to be charged."
    },
    {
      "question": "How to add reviews?",
      "answer":
          "Log in to your appointment scheduling platform or service.\nAccess your account and navigate to the reviews section.\nWrite a review for the service you have chosen.",
    }
  ];
}
