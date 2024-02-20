import 'dart:developer';

import 'package:care_connect/resources/data/data.dart';
import 'package:care_connect/utils/routes/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/components/custom_back_button_widget.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  TextEditingController searchController = TextEditingController();
  late List<Map> chats;
  @override
  void initState() {
    chats = DataClass.upcommingBookings;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: const Row(
          children: [
            Spacer(),
            CustomBackButtonWidget(),
          ],
        ),
        title: Text(
          "Chat",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).primaryColorLight),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  searchChats(value);
                  log("message");
                });
              },
              decoration: InputDecoration(
                  fillColor: Theme.of(context).primaryColorLight,
                  filled: true,
                  prefixIcon: const Icon(CupertinoIcons.search),
                  hintText: "Search"),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 80,
                    width: double.maxFinite,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: DataClass.upcommingBookings.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (_, index) {
                          return Container(
                            height: 60,
                            width: 60,
                            margin: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(DataClass
                                        .upcommingBookings[index]['image'])),
                                shape: BoxShape.circle,
                                color: Theme.of(context)
                                    .disabledColor
                                    .withOpacity(0.2)),
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: chats.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (_, index) {
                          return Card(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: ListTile(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteNames.singleChatView);
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              leading: Container(
                                height: 60,
                                width: 60,
                                margin: const EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage(chats[index]['image'])),
                                    shape: BoxShape.circle,
                                    color: Theme.of(context)
                                        .disabledColor
                                        .withOpacity(0.2)),
                              ),
                              title: Text(chats[index]['name'].toString()),
                              subtitle: Text(chats[index]['name'].toString()),
                              trailing: Text(chats[index]['date'].toString()),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    
    super.dispose();
    searchController.dispose();
  }

  searchChats(String input) {
    if (input.isEmpty) {
      chats = DataClass.upcommingBookings;
    } else {
      List<Map> list = DataClass.upcommingBookings;
      log("list is $list");
      log("Upcomming is ${DataClass.upcommingBookings}");

      //  chats =  list.removeWhere((element) {
      //     log("$element \n $input");
      //     return !element['name'].toLowerCase().contains(input.toLowerCase());
      //   }).toList();

      chats = list.where((element) {
        log("$element \n $input");

        return element['name'].toLowerCase().contains(input.toLowerCase());
      }).toList();
      // chats = list;

      log("chats is $chats");
    }
  }
}
