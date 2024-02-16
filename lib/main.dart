import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lautkita_mobile/bloc/campaign_detail/campaign_detail_bloc.dart';
import 'package:lautkita_mobile/bloc/login/login_bloc.dart';
import 'package:lautkita_mobile/bloc/logout/logout_bloc.dart';
import 'package:lautkita_mobile/bloc/register/register_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lautkita_mobile/pages/auth/login_page.dart';
import 'package:lautkita_mobile/pages/loading.dart';

import 'data/datasources/auth_local_datasources.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RegisterBloc(),
          ),
          BlocProvider(
            create: (context) => LoginBloc(),
          ),
          BlocProvider(
            create: (context) => LogoutBloc(),
          ),
          BlocProvider(
            create: (context) => CampaignDetailBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: FutureBuilder<bool>(
            future: AuthLocalDatasource().isLogin(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.hasData && snapshot.data!) {
                return const Loading();
              } else {
                return const LoginPage();
              }
            },
          ),
        ),
      ),
    );
  }
}
