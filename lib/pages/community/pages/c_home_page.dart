import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lautkita_mobile/bloc/logout/logout_bloc.dart';
import 'package:lautkita_mobile/data/datasources/auth_local_datasources.dart';
import 'package:lautkita_mobile/pages/community/model/nav_model.dart';
import 'package:lautkita_mobile/pages/community/pages/c_home_page_view.dart';
import 'package:lautkita_mobile/widget/bottom_app_bar_widget.dart';

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

    AuthLocalDatasource().getToken().then((value) {
      setState(() {
        token = value;
      });
    });

    AuthLocalDatasource().getUserName().then((value) {
      setState(() {
        name = value ?? '';
      });
    });

    navItems = [
      NavModel(
        navKey: homeNavKey,
        page: CHomePageView(searchBox: searchBox),
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
      ),
    ];
  }

  void showLogoutAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.read<LogoutBloc>().add(const LogoutEvent.logout());
              },
              child: const Text("Logout"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 15.0, right: 2),
        child: FloatingActionButton.small(
          onPressed: () {},
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: const Color(0xFFFF7029),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
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

class Page extends StatelessWidget {
  final int tab;

  const Page({
    super.key,
    required this.tab,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("tab ini adalah $tab"),
      ),
    );
  }
}
