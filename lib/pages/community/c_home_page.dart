import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lautkita_mobile/bloc/logout/logout_bloc.dart';
import 'package:lautkita_mobile/data/datasources/auth_local_datasources.dart';
import 'package:lautkita_mobile/pages/auth/login_page.dart';
import 'package:lautkita_mobile/utils/bottom_app_bar_clipper.dart';
import 'package:lautkita_mobile/utils/clip_shadow_path.dart';

class CHomePage extends StatefulWidget {
  const CHomePage({super.key});

  @override
  State<CHomePage> createState() => _CHomePageState();
}

class _CHomePageState extends State<CHomePage> {
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: ClipShadowPath(
          shadow: const BoxShadow(
            color: Color(0x600396EF),
            offset: Offset(0, 1),
            blurRadius: 15,
            spreadRadius: 5,
          ),
          clipper: BottomAppBarClipper(),
          child: SizedBox(
            child: Container(
              height: 69.h,
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/indicator.svg",
                          colorFilter: ColorFilter.mode(
                            Color(0xFF00A8CC),
                            BlendMode.srcATop,
                          ),
                        ),
                        SvgPicture.asset("assets/icons/indicator.svg"),
                        SizedBox(),
                        SvgPicture.asset("assets/icons/indicator.svg"),
                        SvgPicture.asset("assets/icons/indicator.svg"),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/home.svg",
                        colorFilter: ColorFilter.mode(
                          Color(0xFF00A8CC),
                          BlendMode.srcATop,
                        ),
                      ),
                      SvgPicture.asset("assets/icons/shopping-basket.svg"),
                      SizedBox(),
                      SvgPicture.asset("assets/icons/notification.svg"),
                      SvgPicture.asset("assets/icons/profile.svg"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 15.0, right: 2),
        child: FloatingActionButton.small(
          onPressed: () {},
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Color(0xFFFF7029),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: Colors.white,
            title: SizedBox(
              height: 43.h,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F7F9),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 15.0,
                        right: 8.0,
                      ),
                      child: SvgPicture.asset("assets/icons/search.svg"),
                    ),
                    Expanded(
                      child: TextField(
                        controller: searchBox,
                        decoration: const InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: Color(0xFFBDBDBD),
                            height: 1.45,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F7F9),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SvgPicture.asset("assets/icons/send.svg"),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
