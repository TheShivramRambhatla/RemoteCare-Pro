import 'package:accordion/accordion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactUsTabView extends StatelessWidget {
  const ContactUsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Accordion(
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
          AccordionSection(
            header: const Text("Customer Service"),
            content: const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, ligula ac rutrum vulputate, lectus enim lobortis mi, in lacinia nisl ligula vitae nunc. Sed euismod, ligula ac rutrum vulputate, lectus enim lobortis mi, in lacinia nisl ligula vitae nunc."),
            leftIcon: Icon(
              Icons.headset_mic,
              color: Theme.of(context).primaryColor,
            ),
          ),
          AccordionSection(
            header: const Text("WhatsApp"),
            content: Row(
              children: [
                const SizedBox(
                  width: 32,
                ),
                Icon(
                  Icons.circle,
                  color: Theme.of(context).primaryColor,
                  size: 8.0,
                ),
                const Text(" +917415752664"),
              ],
            ),
            leftIcon: Icon(
              FontAwesomeIcons.whatsapp,
              color: Theme.of(context).primaryColor,
            ),
          ),
          AccordionSection(
            header: const Text("Website"),
            content: const Text("www.aaditya.appdev.com"),
            leftIcon: Icon(
              CupertinoIcons.globe,
              color: Theme.of(context).primaryColor,
            ),
          ),
          AccordionSection(
            header: const Text("Facebook"),
            content: const Text("www.aaditya.appdev.com"),
            leftIcon: Icon(
              FontAwesomeIcons.facebook,
              color: Theme.of(context).primaryColor,
            ),
          ),
          AccordionSection(
            header: const Text("Twitter"),
            content: const Text("www.aaditya.appdev.com"),
            leftIcon: Icon(
              FontAwesomeIcons.twitter,
              color: Theme.of(context).primaryColor,
            ),
          ),
          AccordionSection(
            header: const Text("Instagram"),
            content: const Text("www.aaditya.appdev.com"),
            leftIcon: Icon(
              FontAwesomeIcons.instagram,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ]);
  }
}
