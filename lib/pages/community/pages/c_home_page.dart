import 'package:flutter/material.dart';
import 'package:lautkita_mobile/pages/community/model/nav_model.dart';
import 'package:lautkita_mobile/pages/community/pages/c_home_page_content.dart';
import 'package:lautkita_mobile/pages/community/pages/c_profile.dart';
import 'package:lautkita_mobile/widget/bottom_app_bar_widget.dart';
import 'package:lautkita_mobile/widget/floating_action_button_app.dart';

class CHomePage extends StatefulWidget {
  const CHomePage({super.key});

  @override
  State<CHomePage> createState() => _CHomePageState();
}

class _CHomePageState extends State<CHomePage> {
  final homeNavKey = GlobalKey<NavigatorState>();
  final marketplaceNavKey = GlobalKey<NavigatorState>();
  final notificationNavKey = GlobalKey<NavigatorState>();
  final profileNavKey = GlobalKey<NavigatorState>();

  int selectedTab = 0;
  List<NavModel> navItems = [];

  String token = '';
  String name = '';
  TextEditingController searchBox = TextEditingController();

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
        page: CHomeContent(searchBox: searchBox),
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
        page: CProfile(
          homeContext: context,
        ),
      ),
    ];
    return SafeArea(
      child: Scaffold(
        // Drawer
        // drawer: Drawer(
        //   child: ListView(
        //     padding: EdgeInsets.zero,
        //     children: <Widget>[
        //       DrawerHeader(
        //         decoration: const BoxDecoration(
        //           color: Colors.blue,
        //         ),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             const CircleAvatar(
        //               radius: 30,
        //               backgroundColor: Colors.white,
        //               backgroundImage: AssetImage('assets/images/avatarman.png'),
        //             ),
        //             const SizedBox(height: 10),
        //             Text(
        //               name,
        //               style: const TextStyle(
        //                 color: Colors.white,
        //                 fontSize: 16,
        //               ),
        //             ),
        //             Text(
        //               token,
        //               style: const TextStyle(
        //                 color: Colors.white,
        //                 fontSize: 14,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       BlocConsumer<LogoutBloc, LogoutState>(
        //         listener: (context, state) {
        //           state.maybeWhen(
        //             orElse: () {},
        //             loaded: (message) {
        //               AuthLocalDatasource().removeAuthData();
        //               Navigator.pushAndRemoveUntil(context,
        //                   MaterialPageRoute(builder: (context) {
        //                 return const LoginPage();
        //               }), (route) => false);
        //               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        //                 content: Text("Logout Successfully"),
        //                 backgroundColor: Colors.blue,
        //               ));
        //             },
        //             error: (message) {
        //               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //                 content: Text(message),
        //                 backgroundColor: Colors.red,
        //               ));
        //             },
        //           );
        //         },
        //         builder: (context, state) {
        //           return state.maybeWhen(
        //             orElse: () {
        //               return ListTile(
        //                 leading: const Icon(Icons.exit_to_app),
        //                 title: const Text('Logout'),
        //                 onTap: () {
        //                   showLogoutAlertDialog(context);
        //                 },
        //               );
        //             },
        //             loading: () => const Center(
        //               child: CircularProgressIndicator(),
        //             ),
        //           );
        //         },
        //       ),
        //     ],
        //   ),
        // ),
        resizeToAvoidBottomInset: false,
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
        floatingActionButton: const FloatingActionButtonApp(),
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
      ),
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
