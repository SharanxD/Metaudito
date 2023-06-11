import 'package:finalproject/pages/login_page.dart';
import 'package:finalproject/screens/HomePageFactories.dart';
import 'package:finalproject/utensils/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:finalproject/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signpage extends StatefulWidget {
  const Signpage({super.key});

  @override
  State<Signpage> createState() => _SignpageState();
}

class _SignpageState extends State<Signpage> {
  final TextEditingController _controllerEmail=TextEditingController();
  final TextEditingController _controllerpwd1= TextEditingController();
  final TextEditingController _controllerpwd2= TextEditingController();
  Future<void> createUserWithEmailAndPassword() async{
    try{
      await Auth().createUserWithEmailAndPassword(email: _controllerEmail.text, password: _controllerpwd1.text);

    } catch(e){}
  }
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Metaudito",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                  color: Colors.purple,
                )),
            const Text("        Future of audits",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                )),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Email",
                    ),
                    controller: _controllerEmail,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Password",
                    ),
                    controller: _controllerpwd1,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Re-enter Password",
                    ),
                    controller: _controllerpwd2,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if(_controllerpwd1.text==_controllerpwd2.text) {
                        createUserWithEmailAndPassword();
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Loginpage()));
                      }
                      else{
                        print("Choose crctly");
                      }
                      
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                    child: Text("Register",style: TextStyle(color: Colors.purple[50],fontSize: 19),),
                  )
                ],
              ),
            ),



          ],
        ));
  }
}
