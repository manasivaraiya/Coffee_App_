import 'package:coffee_shop/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'authentication.dart';
class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPage createState() => _LoginPage();
}



class _LoginPage extends State<LoginPage> {
  User user;
  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
  }

   void click() {
     signInWithGoogle().then((user) => {
      this.user = user,
       Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return HomeScreen();
        },),
      )
    });
  }
  @override

 
  Widget build(BuildContext context) {
    return Card(
      
      borderOnForeground: true,
      
      child: Column(
        children: <Widget>[
         
          Padding(
            padding: EdgeInsets.only(top: 300),
          ),
          Text(
            'Welcome to Kofficcino',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Padding(
            padding: EdgeInsets.all(50),
          ),
          FloatingActionButton.extended(
            
            heroTag: "btn",
            label: Text('Sign in With Google'),
            onPressed: () {
            _navigateToNextScreen(context);
          },
          ),
        ],
      ),
    );
  }
}