import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lautkita_mobile/pages/login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                  image: AssetImage('assets/images/sign-up.png'),
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
                        hintText: 'Name',
                      ),
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
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
                        hintText: 'Status',
                      ),
                      onChanged: null,
                      items: ["A", "B", "C"]
                          .map((label) => DropdownMenuItem(
                                child: Text(label),
                                value: label,
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 10),
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
                    const SizedBox(height: 10),
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
                          'SIGN UP',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          text: "Already have acount? ",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                          children: [
                            TextSpan(
                              text: 'SIGN IN',
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
