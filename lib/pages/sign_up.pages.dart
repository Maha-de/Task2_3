import 'package:flutter/material.dart';
import 'package:task_3/pages/homepage.pages.dart';
import 'package:task_3/pages/login.pages.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final userName = TextEditingController();
  final password = TextEditingController();
  final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("Sign Up Page")),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 100, 10, 20),
        child: Center(
          child: ListView(
            children: [
              Icon(Icons.ac_unit_outlined, size: 50),
              SizedBox(height: 20,),
              Center(
                  child: Text("Sign Up", style: TextStyle(fontSize: 20),)),
              SizedBox(height: 30),
              TextField(
                controller: userName,
                decoration: InputDecoration(
                    hintText: "Enter your Name"
                ),
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: password,
                decoration: InputDecoration(
                    hintText: "Enter your Password"
                ),
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 30,),
              TextField(
                controller: email,
                decoration: InputDecoration(
                    hintText: "Enter your Email"
                ),
                style: TextStyle(fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(70, 30, 70, 50),
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                  password.clear();
                  email.clear();
                }, child: Text("Sign Up", style: TextStyle(fontSize: 18))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
