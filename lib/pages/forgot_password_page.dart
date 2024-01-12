import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lautkita_mobile/pages/sign_up_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color.fromRGBO(0, 168, 204, 1),
            selectionColor: Color.fromRGBO(0, 168, 204, 1)),
      ),
      home: Scaffold(
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/forgot-password.png'),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: 'Guardians\n',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontSize: 34,
                            fontWeight: FontWeight.w600),
                        children: [
                          TextSpan(
                            text: 'Of The Sea',
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      'Marine Ecosystem Conservation Platform',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Montserrat'),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    const Center(
                      child: Text('TYPE YOUR EMAIL',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(0, 168, 204, 1),
                          )),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 16, right: 16),
                      padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(234, 247, 251, 1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'We will send you instruction on how to reset your password',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 34, 30, 40),
                      child: Column(children: [
                        TextField(
                          style: const TextStyle(color: Colors.black54),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(20),
                            filled: true,
                            fillColor: const Color.fromRGBO(243, 245, 247, 1),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            hintStyle: const TextStyle(
                                color: Colors.black38,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500),
                            hintText: 'Email',
                          ),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.only(
                                    left: 24, top: 14, right: 24, bottom: 14),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromRGBO(0, 168, 204, 1)),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                            child: const Text(
                              'SEND',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
