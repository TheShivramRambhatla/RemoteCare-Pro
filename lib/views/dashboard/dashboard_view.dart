import 'package:care_connect/resources/custom-variables/location_variable.dart';
import 'package:care_connect/views/chat/chat_view.dart';
import 'package:care_connect/views/explore/explore_view.dart';
import 'package:care_connect/views/home/home_view.dart';
import 'package:care_connect/views/my-bookings/my_bookings_view.dart';
import 'package:care_connect/views/profile/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key, this.locationVariable});
  final LocationVariable? locationVariable;

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeView(),
    const ExploreView(),
    const MyBookingsView(),
    const ChatView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).disabledColor,
        selectedLabelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.bold,
            ),
        unselectedLabelStyle: Theme.of(context).textTheme.bodySmall!,
        elevation: 6.0,
        items: navbarItems,
      ),
    );
  }

  List<BottomNavigationBarItem> get navbarItems {
    return [
      const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.house_fill),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.arrow_down_doc_fill),
        label: 'Prescriptions',
      ),
      const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.calendar_today),
        label: 'Bookings',
      ),
      const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.bubble_middle_bottom_fill),
        label: 'Chat',
      ),
      const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.person_fill),
        label: 'Profile',
      ),
    ];
  }
}
