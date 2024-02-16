import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lautkita_mobile/bloc/logout/logout_bloc.dart';
import 'package:lautkita_mobile/data/datasources/auth_local_datasources.dart';
import 'package:lautkita_mobile/main.dart';

class CProfile extends StatelessWidget {
  final BuildContext homeContext;
  const CProfile({
    super.key,
    required this.homeContext,
  });

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
    return BlocConsumer<LogoutBloc, LogoutState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (message) async {
            AuthLocalDatasource().removeAuthData();
            Navigator.pushReplacement(
              homeContext,
              MaterialPageRoute(
                builder: (homeContext) => const MyApp(),
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Logout Successfully"),
              backgroundColor: Colors.blue,
            ));
          },
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(message),
              backgroundColor: Colors.red,
            ));
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: () {
                showLogoutAlertDialog(context);
              },
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
