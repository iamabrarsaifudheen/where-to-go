import 'package:flutter/material.dart';
import 'package:where_to_go/services/auth.dart';
import 'package:where_to_go/widgets/button.dart';
import 'package:where_to_go/widgets/text_box.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key, required this.toggleView}) : super(key: key);
  final Function toggleView;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
          title: Text('Sign Up'),
          backgroundColor: Theme.of(context).primaryColor),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 36),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height / 16,
                  ),
                  TextBox(
                      hintText: 'Email',
                      controller: _emailController,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      type: 'email'),
                  SizedBox(height: height / 40),
                  TextBox(
                      hintText: 'Password',
                      controller: _passwordController,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      type: 'password'),
                  SizedBox(height: height / 20),
                  Button(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          dynamic result = await AuthService()
                              .signInWithEmailAndPassword(
                                  _emailController.text.trim(),
                                  _passwordController.text.trim());

                          // if (FirebaseAuth.instance.currentUser != null) {
                          //   print(FirebaseAuth.instance.currentUser?.uid);
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const Home()),
                          //   );
                          // }

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Welcome")),
                          );
                        }
                      },
                      text: 'Sign In'),
                  Center(
                    child: TextButton(
                        onPressed: () {
                          widget.toggleView();
                        },
                        child: const Text("Not a member yet? Sign Up")),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
