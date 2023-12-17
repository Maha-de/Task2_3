import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_3/pages/homepage.pages.dart';
import 'package:task_3/pages/sign_up.pages.dart';

import '../services/preferences.services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final userName = TextEditingController();
  final password = TextEditingController();


  void _setData (){
    setState(() {
      PrefrencesService.prefs?.setString("user", userName.text);
      PrefrencesService.prefs?.setString("password", password.text);

      if(userName.text.isNotEmpty && password.text.isNotEmpty) {
        PrefrencesService.prefs?.setBool("isloggedin", true);
        print("isloggedin");
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => HomePageScreen()));
      }else{
        PrefrencesService.prefs?.setBool("isloggedin", false);
        print("not logged in");
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => LoginPage()));

      }

    });
  }

  _retrieveValues() async {
    setState(() {
      userName.text = PrefrencesService.prefs?.getString('user') ?? "";
      password.text = PrefrencesService.prefs?.getString('password') ?? "";

    });
  }

  @override
  void initState() {
    super.initState();
    _retrieveValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("Login Page")),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 100, 10, 20),
        child: Center(
          child: ListView(
            children: [Icon(Icons.ac_unit_outlined, size: 50),
              SizedBox(height: 20),
              Center(
                  child: Text("Login", style: TextStyle(fontSize: 20),)),
              TextField(
                controller: userName,
                decoration: InputDecoration(
                    labelText: "Username",
                ),
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: password,
                decoration: InputDecoration(
                    labelText: "Password"
                ),
                style: TextStyle(fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(90, 30, 50, 50),
                child: Row(children: [
                  ElevatedButton(onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePageScreen()));
                    _setData();

                    if(userName != "" && password != ""){
                      PrefrencesService.prefs?.setBool("login", true);
                    }
                    // await PrefrencesService.prefs?.setString("user", userName.text);
                    // await PrefrencesService.prefs?.setString("password", password.text);
                    // await PrefrencesService.prefs?.setBool("isloggedin", true);
                  }, child: Text("Login", style: TextStyle(fontSize: 18))),
                  SizedBox(width: 20,),
                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                    userName.clear();
                    password.clear();
                  }, child: Text("Sign Up", style: TextStyle(fontSize: 18))),
                ],),
              )
            ],
          ),
        ),
      ),
    );
  }
}
