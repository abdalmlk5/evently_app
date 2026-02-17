import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/app_assets.dart';
import 'package:evently_app/core/provider/main_screen_provider.dart';
import 'package:evently_app/screens/event_screens/add_event_screen.dart';
import 'package:evently_app/screens/main_screen/tabs/favorite_tab.dart';
import 'package:evently_app/screens/main_screen/tabs/home_tab.dart';
import 'package:evently_app/screens/main_screen/tabs/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  static const routeName = "home screen";

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> tabs = [HomeTab(), FavoriteTab(), ProfileTab()];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (BuildContext context) => MainScreenProvider(),
      builder: (context, child) {
        var myProvider = Provider.of<MainScreenProvider>(context);
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: tabs[myProvider.selectedTab],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, AddEventScreen.routeName);
            },
            child: Icon(Icons.add),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: myProvider.selectedTab,
            onTap: (value) {
              myProvider.changeSelectedTab(value);
            },
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.homeIcon)),
                label: "home".tr(),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.favoriteIcon)),
                label: "favorite".tr(),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.userIcon)),
                label: "profile".tr(),
              ),
            ],
          ),
        );
      },
    );
  }
}
