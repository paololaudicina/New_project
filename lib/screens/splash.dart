import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:lottie/lottie.dart';
import 'package:progetto_prova/provider/homeProvider.dart';
import 'package:progetto_prova/screens/advice.dart';
import 'package:progetto_prova/screens/homeHardPage.dart';
import 'package:progetto_prova/screens/homeSoftPgae.dart';
import 'package:progetto_prova/screens/login.dart';
import 'package:progetto_prova/screens/personalData.dart';
import 'package:progetto_prova/screens/questionnaire.dart';
import 'package:progetto_prova/services/Impact.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  Future<void> _refreshControl(BuildContext context) async {
    final sp = await SharedPreferences.getInstance();
    var refresh = sp.getString("refreshToken");
    int scoreQuiz = Provider.of<HomeProvider>(context, listen: false).scoreQuiz;
    int levelChoice = Provider.of<HomeProvider>(context, listen: false).levelChoice;
    bool personalData = Provider.of<HomeProvider>(context, listen: false).personalData;

    if (refresh != null) {
      bool hasExpired = JwtDecoder.isExpired(refresh);
      if (hasExpired == true) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } else {
        Impact().refreshToken();
        if (scoreQuiz != -1) {
          if (levelChoice != 0) {
            if (personalData != false) {
              if (levelChoice == 1) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeSoftPage()));
              } else {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeHardPage()));
              }
            } else {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => PersonalData()));
            }
          } else {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => SplashQuiz()));
          }
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => Questionnaire()));
        }
      }
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  /*@override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () => _refreshControl(context));
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        height: 20,
        width: 50,
        child: Lottie.asset('images/chain.json'),
      ),
      Container(
        child: Text('Welcome in your new life'),
      )
    ])));
  }
}*/

 @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        if (!homeProvider.isInitialized) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          Future.delayed(Duration(seconds: 3), () => _refreshControl(context));
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 20,
                    width: 50,
                    child: Lottie.asset('images/chain.json'),
                  ),
                  Container(
                    child: Text('Welcome in your new life'),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}