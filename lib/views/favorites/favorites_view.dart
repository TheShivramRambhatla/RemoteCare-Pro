import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/components/custom_back_button_widget.dart';
import 'doctor_favorites_view.dart';
import 'hospital_favorites_view.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: tabs(context).length, vsync: this);
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
          "Favorites",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Theme.of(context).disabledColor, width: 0.5)),
            ),
            child: TabBar(
              controller: _tabController,
              padding: EdgeInsets.zero,
              tabs: tabs(context),
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
              labelPadding: const EdgeInsets.only(bottom: 10),
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TabBarView(
            physics: const BouncingScrollPhysics(),
            controller: _tabController,
            children: const [
              DoctorFavoritesView(),
              HospitalsFavoritesView(),
            ]),
      ),
    );
  }

  List<Widget> tabs(BuildContext context) {
    return [
      const Text(
        "Doctors",
      ),
      const Text(
        "Hospitals",
      )
    ];
  }
}
