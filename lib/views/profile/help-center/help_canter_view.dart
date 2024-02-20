import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../resources/components/custom_back_button_widget.dart';
import 'contact_us_tab_view.dart';
import 'faq_tab_view.dart';

class HelpCenterView extends StatefulWidget {
  const HelpCenterView({super.key});

  @override
  State<HelpCenterView> createState() => _HelpCenterViewState();
}

class _HelpCenterViewState extends State<HelpCenterView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _tabController =
        TabController(length: tabs().length, vsync: this, initialIndex: 0);
    super.initState();
  }

  late TabController _tabController;
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
          "Help Center",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  CupertinoIcons.search,
                  color: Theme.of(context).primaryColor,
                ),
                hintText: "Search",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).disabledColor,
                    width: 0.5,
                  ),
                ),
              ),
              child: TabBar(
                controller: _tabController,
                tabs: tabs(),
                indicatorColor: Theme.of(context).primaryColor,
                labelColor: Theme.of(context).primaryColor,
                labelStyle: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w400),
                unselectedLabelColor: Theme.of(context).disabledColor,
                unselectedLabelStyle: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w400),
                physics: const BouncingScrollPhysics(),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [FAQTabView(), ContactUsTabView()],
              ),
            ),
          ],
        ),
      ),
     );
  }

  tabs() {
    return [
      const Tab(text: "FAQ"),
      const Tab(text: "Contact Us"),
    ];
  }
}
