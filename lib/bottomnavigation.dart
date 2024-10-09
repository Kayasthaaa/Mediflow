import 'package:flutter/material.dart';
import 'package:mediflow_bloc/screens/DashBoard.dart';
import 'package:mediflow_bloc/screens/ProfileDetails/profileDashboard.dart';
import 'package:mediflow_bloc/screens/labTests.dart';
import 'package:mediflow_bloc/widgets/Transactions/Transacations.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int index = 0;
  final screens = [
    const Dashboard(),
    const Labtest(),
    const ListTransactions(),
    const ProfileDashboard(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ClipOval(
          child: SizedBox(
            width: 65.0,
            height: 65.0,
            child: FloatingActionButton(
              backgroundColor: Colors.blueAccent,
              onPressed: () {},
              tooltip: 'Increment',
              child: const Icon(
                Icons.qr_code_2_outlined,
                size: 40.0,
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(splashColor: Colors.transparent),
        child: BottomAppBar(
          clipBehavior: Clip.antiAlias,
          shape: const CircularNotchedRectangle(),
          child: NavigationBarTheme(
            data: NavigationBarThemeData(
              indicatorColor: Colors.blue.shade100,
              labelTextStyle: MaterialStateProperty.all(TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.026,
                  //   color: Colors.black,
                  fontWeight: FontWeight.bold)),
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: NavigationBar(
                height: 60.0,
                backgroundColor: Colors.white,
                selectedIndex: index,
                onDestinationSelected: (index) =>
                    setState(() => this.index = index),
                animationDuration: const Duration(seconds: 1),
                destinations: const [
                  Padding(
                    padding: EdgeInsets.only(right: 28.0),
                    child: NavigationDestination(
                        icon: Icon(
                          Icons.home_outlined,
                          size: 30,
                        ),
                        selectedIcon: Icon(Icons.home),
                        label: "Home"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 45.0),
                    child: NavigationDestination(
                        icon: Icon(Icons.add_shopping_cart_outlined),
                        label: "E-shop"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 35.0),
                    child: NavigationDestination(
                        icon: Icon(Icons.notifications_on_outlined),
                        selectedIcon: Icon(Icons.notifications_on),
                        label: "Transaction"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 28.0),
                    child: NavigationDestination(
                        icon: Icon(Icons.person_outline),
                        selectedIcon: Icon(Icons.person),
                        label: "Profile"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: screens[index],
    );
  }
}
