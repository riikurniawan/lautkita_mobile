import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lautkita_mobile/pages/forgot_password_page.dart';
import 'package:lautkita_mobile/pages/sign_up_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  image: AssetImage('assets/images/sign-in.png'),
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
                padding: const EdgeInsets.fromLTRB(30, 40, 30, 40),
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
                    const SizedBox(height: 20),
                    TextField(
                      obscureText: passwordVisible,
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
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          color: Colors.black38,
                          icon: Icon(passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(
                              () {
                                passwordVisible = !passwordVisible;
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPasswordPage()),
                        );
                      },
                      child: const Text(
                        'FORGOT PASSWORD',
                        style: TextStyle(
                            color: Color.fromRGBO(0, 168, 204, 1),
                            fontSize: 14,
                            fontFamily: 'Poppins'),
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
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        child: const Text(
                          'LOG IN',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'OR LOG IN BY',
                      style: TextStyle(
                        color: Color.fromRGBO(96, 96, 96, 1),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor:
                              const Color.fromRGBO(236, 237, 255, 1),
                          child: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset('assets/icons/google.svg',
                                width: 24, height: 24, fit: BoxFit.scaleDown),
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 15),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor:
                              const Color.fromRGBO(236, 237, 255, 1),
                          child: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset('assets/icons/facebook.svg',
                                width: 24, height: 24, fit: BoxFit.scaleDown),
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()),
                        );
                      },
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          text: "Don't have account? ",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                          children: [
                            TextSpan(
                              text: 'SIGN UP',
                              style: TextStyle(
                                color: Color.fromRGBO(0, 168, 204, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
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
