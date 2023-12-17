import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_3/pages/homepage.pages.dart';
import 'package:task_3/pages/login.pages.dart';
import 'package:task_3/services/preferences.services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {

  var finalEmail;

  // final userName = TextEditingController();
  // final password = TextEditingController();
  // bool? login = PrefrencesService.prefs?.getBool("isloggedin");

  // var newLaunch;

  // loginLaunch() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     bool _newLaunch = ((prefs.getBool('isloggedin') ?? true));
  //     newLaunch = _newLaunch;
  //   });
  // }
     //
     //   if(userName.text.isNotEmpty && password.text.isNotEmpty)
     //   // if (PrefrencesService.prefs != null)
     //  if (login != true)
    // if (login != "")
    //    {
    //      Navigator.push(context,
    //          MaterialPageRoute(builder:
    //              (context) =>
    //              HomePageScreen()));
    //    }else{
    //      Navigator.push(context,
    //          MaterialPageRoute(builder:
    //              (context) =>
    //              LoginPage()));
    //    }
    //  }

  Future getData() async{
    // final SharedPreferences preferences = await SharedPreferences.getInstance();
    var obtainedemail = PrefrencesService.prefs?.getString("user");
    setState(() {
      finalEmail = obtainedemail;
    });
    print(finalEmail);
  }

  @override
  void initState() {
    getData().whenComplete(() async {
      Timer(Duration(seconds: 7),
              () =>
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder:
                      (context) {
                    return finalEmail == null ? LoginPage() : HomePageScreen();
                  }))
      );
    });
    super.initState();

    // Timer(Duration(seconds: 7),
    //         () =>
    //         Navigator.pushReplacement(context,
    //             MaterialPageRoute(builder:
    //                 (context) {
    //                   return finalEmail == null ? LoginPage() : HomePageScreen();
    //                 }))
    // );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(child: Icon(Icons.ac_unit_outlined, size: 120,)),
      ),
    );
  }
}
