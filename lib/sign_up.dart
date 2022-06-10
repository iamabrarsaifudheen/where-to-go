import 'package:flutter/material.dart';
import 'package:where_to_go/screens/add_place.dart';
import 'package:where_to_go/widgets/button.dart';
import 'package:where_to_go/widgets/text_box.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key, required this.toggleView}) : super(key: key);

  final Function toggleView;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  String? selectedType;

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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 36, vertical: 50),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBox(
                          type: 'email',
                          hintText: "Email",
                          controller: _emailController,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: height / 40),
                        TextBox(
                          type: 'password',
                          hintText: "Password",
                          controller: _passwordController,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: height / 40),
                        TextBox(
                          type: 'username',
                          hintText: "Name",
                          controller: _usernameController,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: height / 40),
                        SizedBox(height: height / 20),
                        Button(
                          text: "SUBMIT",
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Few More Details')),
                              );
                            }


                            // navigate
                             Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddPlace()),
                        );
                          },
                        ),
                        Center(
                          child: TextButton(
                              onPressed: () {
                                widget.toggleView();
                              },
                              child: Text("Already A Member? Sign In")),
                        ),
                      ],
                    ),
                  ),
                ))));
  }
}
