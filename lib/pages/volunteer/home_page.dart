import 'package:flutter/material.dart';
import 'package:lautkita_mobile/pages/community/model/nav_model.dart';
import 'package:lautkita_mobile/pages/volunteer/home_page_content.dart';
import 'package:lautkita_mobile/widget/bottom_app_bar_widget.dart';
import 'package:lautkita_mobile/widget/floating_action_button_app.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedTab = 0;
  List<NavModel> navItems = [];

  final homeNavKey = GlobalKey<NavigatorState>();
  final marketplaceNavKey = GlobalKey<NavigatorState>();
  final notificationNavKey = GlobalKey<NavigatorState>();
  final profileNavKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();

    // AuthLocalDatasource().getToken().then((value) {
    //   setState(() {
    //     token = value;
    //   });
    // });

    // AuthLocalDatasource().getUserName().then((value) {
    //   setState(() {
    //     name = value ?? '';
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    navItems = [
      NavModel(
        navKey: homeNavKey,
        page: const HomePageContent(),
      ),
      NavModel(
        navKey: marketplaceNavKey,
        page: const TabPage(tab: 1),
      ),
      NavModel(
        navKey: notificationNavKey,
        page: const TabPage(tab: 2),
      ),
      NavModel(
        navKey: profileNavKey,
        page: const TabPage(tab: 3),
      )
    ];
    return Scaffold(
      body: IndexedStack(
        index: selectedTab,
        children: navItems
            .map(
              (page) => Navigator(
                key: page.navKey,
                onGenerateInitialRoutes: (navigator, initialRoute) {
                  return [
                    MaterialPageRoute(builder: (context) => page.page),
                  ];
                },
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: BottomAppBarWidget(
        pageIndex: selectedTab,
        onTap: (index) {
          if (index == selectedTab) {
            navItems[index]
                .navKey
                .currentState
                ?.popUntil((route) => route.isFirst);
          } else {
            setState(() {
              selectedTab = index;
            });
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const floatingActionButtonApp(),
    );
  }
}

class TabPage extends StatelessWidget {
  final int tab;

  const TabPage({Key? key, required this.tab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("ini adalah tab $tab"),
      ),
    );
  }
}
