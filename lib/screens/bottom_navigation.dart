import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:insight/consts/values.dart';
import 'package:insight/models/user_model.dart';
import 'package:insight/providers/user_provider.dart';
import 'package:insight/screens/outer_screens.dart/add_pitch.dart';
import 'package:insight/screens/outer_screens.dart/chats_screen.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'outer_screens.dart/home_screen.dart';

class NavigationScreen extends StatefulWidget {
  static const routeName = '/bottom-nav';
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  late List<Widget> pages;
  int currentPageIndex = 0;
  void togglePage(int page, UserModel user) {
    if (Hive.box('user').get(kuserStatus) == 'business_owner') {
      if (page == 1) {
        showCupertinoModalBottomSheet(
          context: context,
          builder: (context) => const AddPitchScreen(),
        );
      } else {
        setState(() {
          currentPageIndex = page;
        });
      }
    } else {
      setState(() {
        currentPageIndex = page;
      });
    }
  }

  late List<BottomNavigationBarItem> bItems;
  late List<BottomNavigationBarItem> iItems;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    pages = [
      const HomeScreen(),
      if (Hive.box('user').get(kuserStatus) == 'business_owner')
        const AddPitchScreen(),
      const ChatsScreen(),
      ProfileScreen(
        actions: [
          SignedOutAction((context) {
            Navigator.of(context).pushReplacementNamed('/sign-in');
          }),
        ],
        // ...
      ),
      // const ProfileScreen()
    ];

    bItems = [
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/images/home.png',
          color: currentPageIndex == 0 ? Colors.blue : const Color(0xffD6DBDE),
        ),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: CircleAvatar(
          radius: 27,
          child: Icon(
            Icons.add,
          ),
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/images/chat.png',
          color: currentPageIndex == 2 ? Colors.blue : const Color(0xffD6DBDE),
        ),
        label: 'Chat',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/images/profile.png',
          color: currentPageIndex == 3 ? Colors.blue : const Color(0xffD6DBDE),
        ),
        label: 'Profile',
      ),
    ];

    iItems = [
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/images/home.png',
          color: currentPageIndex == 0 ? Colors.blue : const Color(0xffD6DBDE),
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/images/chat.png',
          color: currentPageIndex == 1 ? Colors.blue : const Color(0xffD6DBDE),
        ),
        label: 'Chat',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/images/profile.png',
          color: currentPageIndex == 2 ? Colors.blue : const Color(0xffD6DBDE),
        ),
        label: 'Profile',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      //backgroundColor: theme.scaffoldBackgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: false,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentPageIndex,
        onTap: (val) => togglePage(val, user.user),
        items: Hive.box('user').get(kuserStatus) == 'business_owner'
            ? bItems
            : iItems,
      ),
      body: SafeArea(
        child: IndexedStack(
          index: currentPageIndex,
          children: pages,
        ),
      ),
    );
  }
}
