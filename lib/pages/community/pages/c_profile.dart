import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
              onPressed: () async {
                Navigator.of(context).pop();
                await FirebaseAuth.instance.signOut();
                // context.read<LogoutBloc>().add(const LogoutEvent.logout());
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
    return ListTile(
      leading: const Icon(Icons.exit_to_app),
      title: const Text('Logout'),
      onTap: () {
        showLogoutAlertDialog(context);
        print("bisa logout");
      },
    );
    // return BlocConsumer<LogoutBloc, LogoutState>(
    //   listener: (context, state) {
    //     state.maybeWhen(
    //       orElse: () {},
    //       loaded: (message) async {
    //         AuthLocalDatasource().removeAuthData();
    //         Navigator.pushReplacement(
    //           homeContext,
    //           MaterialPageRoute(
    //             builder: (homeContext) => const MyApp(),
    //           ),
    //         );
    //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //           content: Text("Logout Successfully"),
    //           backgroundColor: Colors.blue,
    //         ));
    //       },
    //       error: (message) {
    //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //           content: Text(message),
    //           backgroundColor: Colors.red,
    //         ));
    //       },
    //     );
    //   },
    //   builder: (context, state) {
    //     return state.maybeWhen(
    //       orElse: () {
    //         return ListTile(
    //           leading: const Icon(Icons.exit_to_app),
    //           title: const Text('Logout'),
    //           onTap: () {
    //             showLogoutAlertDialog(context);
    //           },
    //         );
    //       },
    //       loading: () => const Center(
    //         child: CircularProgressIndicator(),
    //       ),
    //     );
    //   },
    // );
  }
}
