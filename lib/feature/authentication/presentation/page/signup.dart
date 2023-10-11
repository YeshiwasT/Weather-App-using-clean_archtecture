import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_clean_archtecture/feature/authentication/presentation/page/login_screen.dart';

import '../bloc/authentication_bloc/authentication_bloc.dart';
import '../bloc/signup_form_bloc/signup_form_bloc.dart';
// import 'package:get_it/get_it.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String validator(params) {
    return "null";
  }

  // final serviceLocator = GetIt.instance;
  void dispatchSignup() {
    print("first");

    context.read<AuthenticationBloc>().add(
          SignupEvent(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim(),
              firstName: _firstNameController.text.trim(),
              lastName: _lastNameController.text.trim()
              // otp: otp,
              ),
          // SendOtpVerficationEvent(phoneNumber: _phoneNumberController.text.trim())
        );
    print("finished");
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        print(state);
        if (state is SignupState && state.status == AuthStatus.loaded) {
          print("object in signup state ");
          context
              .read<SignupFormBloc>()
              .add(ChangeEmailEvent(email: _emailController.text.trim()));
          context
              .read<SignupFormBloc>()
              .add(ChangeUserNameEvent(userName: _firstNameController.text));
          context.read<SignupFormBloc>().add(
              ChangePhoneNumberEvent(phoneNumber: _lastNameController.text));
          context
              .read<SignupFormBloc>()
              .add(ChangePassEvent(password: _passwordController.text));
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MyStatefulWidget()));
          final snackBar = SnackBar(content: Text("Sign in successfully"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else if (state is SignupState && state.status == AuthStatus.error) {
          print(AuthStatus.error);
          print(state.status);
          final snackBar = SnackBar(content: Text(AuthStatus.error as String));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 25, 0, 0),
                      child: SizedBox(
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Sign in to your account",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 275,
                  left: 25,
                  right: 25,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: 515,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ]),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        height: 500,
                        child: Form(
                          key: _formKey,
                          child: ListView(
                            children: [
                              Text("first name"),
                              TextField(
                                controller: _firstNameController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'User Name',
                                ),
                              ),
                              Text("Email"),
                              TextField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'User Name',
                                ),
                              ),
                              Text("Last Name"),
                              TextField(
                                controller: _lastNameController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'User Name',
                                ),
                              ),
                              Text("Password"),
                              TextField(
                                controller: _passwordController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'User Name',
                                ),
                              ),
                              Text("Confirm Password"),
                              TextField(
                                controller: _confirmPasswordController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'User Name',
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 60,
                                child: ElevatedButton(
                                  onPressed: () {
                                    print("fine");
                                    // if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    // Perform further actions with the valid input

                                    dispatchSignup();
                                    // }
                                    print("final");
                                  },
                                  child: const Text(
                                    'Sign up',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.blue)),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Already have an account? "),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MyStatefulWidget(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )
                                ],
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
      ),
    );
  }
}
