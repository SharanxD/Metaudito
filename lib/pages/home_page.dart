import 'package:finalproject/pages/login_page.dart';
import 'package:finalproject/utensils/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:finalproject/auth.dart';
import 'package:google_fonts/google_fonts.dart';


class Homepage extends StatelessWidget {
  Homepage({super.key});
  final User? user = Auth().currentuser;
  Future<void> signOut() async{
    await Auth().signout();
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(

      body: Center(
        child: Container(
          width: double.infinity,

          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Image.asset(
              "assets/logo.png",
              fit: BoxFit.fitHeight,
              height: 300,
            ),
              const SizedBox(
                height: 80.0,
              ),



              ElevatedButton(onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>const Loginpage()));

              },

                  style: TextButton.styleFrom(minimumSize: const Size(100, 38)),
                  child: Text("Get Started",style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 25,
                    color:Colors.purple[700],
                  ),
              ),))
            ],
          ),

        ),
      ),


    );
  }
}
