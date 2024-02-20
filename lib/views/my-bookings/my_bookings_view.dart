import 'package:care_connect/views/my-bookings/cancelled_tab_view.dart';
import 'package:care_connect/views/my-bookings/completed_tab_view.dart';
import 'package:care_connect/views/my-bookings/upcomming_tab_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/components/custom_back_button_widget.dart';

class MyBookingsView extends StatefulWidget {
  const MyBookingsView({super.key});

  @override
  State<MyBookingsView> createState() => _MyBookingsViewState();
}

class _MyBookingsViewState extends State<MyBookingsView>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: tabs().length, vsync: this);
    super.initState();
  }

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
          "My Bookings",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Theme.of(context).disabledColor, width: 0.5)),
            ),
            child: TabBar(
              controller: _tabController,
              padding: EdgeInsets.zero,
              tabs: tabs(),
              indicatorColor: Theme.of(context).primaryColor,
              labelColor: Theme.of(context).primaryColor,
              labelStyle: Theme.of(context).textTheme.titleMedium,
              unselectedLabelColor: Theme.of(context).disabledColor,
              unselectedLabelStyle: Theme.of(context).textTheme.titleMedium,
              indicatorWeight: 4.0,
              dividerColor: Colors.amber,
              indicatorPadding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 0),
              physics: const BouncingScrollPhysics(),
              labelPadding:
                  const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: Theme.of(context).disabledColor.withOpacity(0.5)),
              ),
              child: Icon(
                CupertinoIcons.search,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: TabBarView(controller: _tabController, children: tabViews()),
      ),
    );
  }

  List<Widget> tabs() {
    return [
      const Text("Upcomming"),
      const Text("Completed"),
      const Text("Cancelled"),
    ];
  }

  List<Widget> tabViews() {
    return [
      const UpcommingTabView(),
      const CompletedTabView(),
      const CancelledTabView()
    ];
  }
}
