import 'package:finalproject/app_state.dart';
import 'package:finalproject/pages/signup_page.dart';
import 'package:finalproject/screens/HomePageAudits.dart';
import 'package:finalproject/screens/HomePageFactories.dart';
import 'package:finalproject/utensils/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:finalproject/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String? errormessage="";
  bool isLogin=true;
  final TextEditingController _controlleremail=TextEditingController();
  final TextEditingController _controllerpwd=TextEditingController();

  Future<void> signInWithEmailAndPassword() async{
    try{
      await Auth().signInWithEmailAndPassword(email: _controlleremail.text, password: _controllerpwd.text);
    } on FirebaseAuthException catch(e){
      setState(() {
        errormessage=e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    var appstate =context.watch<ApplicationState>();
    return Material(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset(
              "assets/123.png",
              fit: BoxFit.fitWidth,
              height: 300,

            ),
            const Text("Metaudito",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                  color: Colors.purple,
                )),
            const SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                color: Colors.purple[50],
                borderRadius: const BorderRadius.all(Radius.circular(30))
              ),
                width: size.width*0.7,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap:(){
                      setState(() {
                        appstate.userstate=0;
                      });

                    },
                    child: Container(
                      width: size.width*0.33,
                      height: 45,
                      decoration: BoxDecoration(
                        color: appstate.userstate==0?Colors.purple[700]:Colors.white,
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30)),
                        boxShadow: [
                          appstate.userstate!=0?const BoxShadow(color: Colors.purple,blurRadius: 5):const BoxShadow(color: Colors.white)
                        ]
                      ),
                      child: Center(child: Text("Factory",style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 25,
                          color: appstate.userstate!=0?Colors.purple[700]:Colors.white,
                        ),
                      ),)),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        appstate.userstate=1;
                      });
                    },
                    child: Container(
                      width: size.width*0.33,
                      height: 45,
                      decoration: BoxDecoration(
                        color: appstate.userstate==1?Colors.purple[700]:Colors.white,
                          borderRadius: const BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30)),
                          boxShadow: [
                            appstate.userstate!=1?const BoxShadow(color: Colors.purple,blurRadius: 5):const BoxShadow(color: Colors.white)
                          ]
                      ),
                      child: Center(child: Text("Audit",style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 25,
                          color: appstate.userstate!=1?Colors.purple[700]:Colors.white,
                        ),
                      ),)),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter your email",
                      labelText: "Email",
                    ),
                    controller: _controlleremail,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Enter password",
                      labelText: "Password",
                    ),
                    controller: _controllerpwd,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      try{
                        signInWithEmailAndPassword();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>appstate.userstate==0?const HomePageFactories():const HomePageAudits()));}catch(e){
                        final snackbar= const SnackBar(content: Text("No such User exits"));
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[700]),
                    child: Text("Login",style: TextStyle(color: Colors.purple[50],fontSize: 19),),
                  )
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("New to Metaudito?",
                  style: TextStyle(
                    fontSize: 19
                  ),
                ),
                TextButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Signpage()));
                }, child: const Text("Sign Up",style: TextStyle(color: Colors.purple,fontSize: 19),))
              ],
            )

          ],
        ));
  }
}
