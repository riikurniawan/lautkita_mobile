import 'package:flutter/material.dart';
import 'package:lautkita_mobile/data/datasources/auth_local_datasources.dart';
import 'package:lautkita_mobile/pages/community/pages/c_home_page.dart';
import 'package:lautkita_mobile/pages/home/home_page.dart';

class Loading extends StatefulWidget {
  const Loading({
    super.key,
  });

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AuthLocalDatasource().getUserRole().then((value) {
      if (value == 'community') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => const CHomePage()),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => const HomePage()),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("Tunggu Sebentar ya.."),
      ),
    );
  }
}
