import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),
      body: Container(
        child: Column(
          children: [
            Image.asset("images/kolo.png"),
            SizedBox(height: 10.0),
            Text(
              "Unlock the feature of ",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),

            Text(
              "a real good Receip",
              style: TextStyle(
                color: Color(0xFFFFD700),
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),

SizedBox(height: 30.0,),
                  Text(
              "Discover Meals and expereiecne an unforgettable moments effortlessly",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blueGrey[100],
                fontSize: 20.0,
                // fontWeight: FontWeight.bold,
              ),
            ),
SizedBox(height: 50.0,),
            ElevatedButton(
              onPressed:() {
                Navigator.pushNamed(context, "/homepage");
              },
              child: Container(
                height: 70,
                margin: EdgeInsets.only(left: 30.0, right: 30.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                   color: Colors.grey.shade900,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   
              
                    SizedBox(width: 20.0,),
                
                       Text(
                  "Get Started Now ",
                  
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
