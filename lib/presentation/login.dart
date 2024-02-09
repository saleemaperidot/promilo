import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:roottest/application/login/login_bloc.dart';

import 'package:roottest/presentation/home.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({super.key});
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> sociallinks = [
    'https://image.similarpng.com/very-thumbnail/2020/12/Colorful-google-logo-design-on-transparent-PNG-1.png',
    'https://image.similarpng.com/very-thumbnail/2020/11/Blue-facebook-icon-on-transparent-background-PNG.png',
    'https://image.similarpng.com/very-thumbnail/2020/06/Instagram-logo-transparent-PNG.png',
    'https://image.similarpng.com/very-thumbnail/2020/11/linkedin-logo-design-on-transparent-background-PNG.png',
    'https://image.similarpng.com/very-thumbnail/2020/07/Whatsapp-logo-on-transparent-background-PNG.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "promilo",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Text(
                  "Hi,Welcome back!",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Please Sign in to continue",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey),
              ),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  final bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value ?? "");
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  } else if (!emailValid) {
                    return "Email format is not in correct format";
                  }
                  return null; // Return null if the input is valid
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(""),
                  Text(
                    "Sign in with Otp",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Password",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey),
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null; // Return null if the input is valid
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      Text("Remember Me"),
                    ],
                  ),
                  Text(
                    "Forgot Password",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(""),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state.status == true) {
                    _navigateToCategories(context);
                  } else if (state.hasError == true) {
                    _showErrorSnackBar(context, state.message);
                  }
                  return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey.shade200,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          //  Form is valid, handle the submission
                          // final LoginRequest loginRequest = LoginRequest(
                          //     email: _usernameController.text,
                          //     password: _passwordController.text);
                          BlocProvider.of<LoginBloc>(context).add(LoginInitial(
                              usename: _usernameController.text,
                              password: _passwordController.text));
                        }
                      },
                      child: Text(
                        state.isLoading ? "Loading.." : "Submit",
                        style: TextStyle(color: Colors.white),
                      ));
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 150,
                    color: Colors.grey.shade200,
                    height: 1,
                  ),
                  Text("or"),
                  Container(
                    width: 150,
                    color: Colors.grey.shade200,
                    height: 1,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return Container(
                    padding: EdgeInsets.all(5),
                    width: 50,
                    height: 50,
                    child: Image(image: NetworkImage(sociallinks[index])),
                  );
                }),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Bussiness User?"),
                  Text("Don't have a account")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Login Here",
                    style: TextStyle(color: Colors.blue),
                  ),
                  Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.blue),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Text("By continuing,you agree to",
                    style: TextStyle(color: Colors.grey)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Promilo's", style: TextStyle(color: Colors.grey)),
                  Text("Terms and conditions",
                      style: TextStyle(color: Colors.black))
                ],
              )
            ],
          ),
        ),
      )),
    );
  }

  void _navigateToCategories(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return Home();
        },
      ));
    });
  }

  void _showErrorSnackBar(BuildContext context, String errorMessage) {
    Fluttertoast.showToast(
      msg: errorMessage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
