import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lautkita_mobile/pages/auth/login_page.dart';

import '../../bloc/register/register_bloc.dart';
import '../../data/datasources/auth_local_datasources.dart';
import '../../data/models/request/register_request_model.dart';
import '../home/home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool passwordVisible = false;
  String? selectedStatus;
  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();


  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  GlobalKey<FormState>? _formKey;

  final FocusNode _fNameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  bool isEmailVerified = false;

  addUser() async {
    if (_formKey!.currentState!.validate()) {
      _formKey!.currentState!.save();
      final model = RegisterRequestModel(
        email: _emailController.text,
        password: _passwordController.text,
        name: _firstNameController.text,
        role: selectedStatus ?? "user",
      );
      context.read<RegisterBloc>().add(RegisterEvent.register(model));
      isEmailVerified = true;
    } else {
      isEmailVerified = false;
    }
  }

  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey<FormState>();
  }

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
      home: SafeArea(
        child: Scaffold(
          body: Stack(
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
              Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: Expanded(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(30, 40, 30, 40),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TextField(
                              controller: _firstNameController,
                              focusNode: _fNameFocus,
                              style: const TextStyle(color: Colors.black54),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(20),
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(243, 245, 247, 1),
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
                              value: selectedStatus,
                              style: const TextStyle(color: Colors.black54),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(20),
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(243, 245, 247, 1),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                hintStyle: const TextStyle(
                                  color: Colors.black38,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                ),
                                hintText: 'Status',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  selectedStatus = value;
                                });
                              },
                              items: ["volunteer", "community"]
                                  .map((label) => DropdownMenuItem(
                                        child: Text(label),
                                        value: label,
                                      ))
                                  .toList(),
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              controller: _emailController,
                              style: const TextStyle(color: Colors.black54),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(20),
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(243, 245, 247, 1),
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
                              controller: _passwordController,
                              focusNode: _passwordFocus,
                              obscureText: passwordVisible,
                              style: const TextStyle(color: Colors.black54),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(20),
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(243, 245, 247, 1),
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
                            TextField(
                              controller: _confirmPasswordController,
                              focusNode: _confirmPasswordFocus,
                              obscureText: passwordVisible,
                              style: const TextStyle(color: Colors.black54),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(20),
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(243, 245, 247, 1),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                hintStyle: const TextStyle(
                                    color: Colors.black38,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500),
                                hintText: 'Password Confirmation',
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
                              child: BlocConsumer<RegisterBloc, RegisterState>(
                                listener: (context, state) {
                                  state.maybeWhen(
                                    orElse: () {},
                                    loaded: (data) async {
                                      await AuthLocalDatasource()
                                          .saveAuthData(data);
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomePage()),
                                        (route) => false,
                                      );
                                    },
                                    error: (message) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(message),
                                        backgroundColor: Colors.red,
                                      ));
                                    },
                                  );
                                },
                                builder: (context, state) {
                                  return state.maybeWhen(
                                    orElse: () {
                                      return ElevatedButton(
                                        onPressed: addUser,
                                        style: ButtonStyle(
                                          padding: MaterialStateProperty.all<
                                              EdgeInsets>(
                                            const EdgeInsets.only(
                                                left: 24,
                                                top: 14,
                                                right: 24,
                                                bottom: 14),
                                          ),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  const Color.fromRGBO(
                                                      0, 168, 204, 1)),
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
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
                                      );
                                    },
                                    loading: () => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                },
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
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
