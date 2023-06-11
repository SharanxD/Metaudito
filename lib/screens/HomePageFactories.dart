import 'dart:ui';

import 'package:finalproject/app_state.dart';
import 'package:finalproject/auth.dart';
import 'package:finalproject/modals/factory_services.dart';
import 'package:finalproject/modals/widgets.dart';
import 'package:finalproject/screens/Factoryui/businessquote.dart';
import 'package:finalproject/screens/Factoryui/finaudit.dart';
import 'package:finalproject/screens/Factoryui/siteinspection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:finalproject/pages/home_page.dart';

class HomePageFactories extends StatefulWidget {
  const HomePageFactories({Key? key}) : super(key: key);

  @override
  State<HomePageFactories> createState() => _HomePageFactoriesState();
}

class _HomePageFactoriesState extends State<HomePageFactories> {

  
  Future<void> _SignoutDialog(){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text("Do you wanna sign out?"),
        actions: [
          ElevatedButton(onPressed: (){
            Auth().signout();

            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homepage()));
          }, child: const Text("Yes")),
          ElevatedButton(onPressed: (){
            setState(() {
              Navigator.of(context).pop();
            });

          }, child: const Text("No")),
        ],
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    var appstate =context.watch<ApplicationState>();
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        backgroundColor: Colors.purple[50],
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset("assets/logoonly.png"),
        ),
        title: Center(child: Text("METAUDITO",style: GoogleFonts.poppins(
        textStyle: TextStyle(
        fontSize: 40,
          color: Colors.purple[700],
        ),
        ),)),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:8.0),
            child: IconButton(icon: const Icon(Icons.account_circle_outlined,size: 40,),onPressed: (){_SignoutDialog();},)
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0,right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Everything at your",style: Theme.of(context).textTheme.headlineLarge),
                Text("FingerTips",style: Theme.of(context).textTheme.headlineLarge),
              ],
            ),
            //
            // SizedBox(height: 5,),
            /*Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: size.height*0.25,
                width: size.width*0.9,
                child: ListView.builder(
                    itemCount: appstate.serviceFactoryList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context,index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(width: size.width*.8,
                            height: 100,
                            decoration:BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(appstate.bgImageURL[index]),
                                fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(30))
                            ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                          child: Container(
                            decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                          ),
                        ),
                        ),
                      );

                }),
              ),
            ),*/
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: size.height*0.2,
                width: size.width*0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ServiceWidget(size: size,header1: "Site",header2: "Inspection",imageUrl: "assets/Siteinspection.png",page: const SiteInspection(),),
                    ServiceWidget(size: size,header1: "Business",header2: "Quotation",imageUrl: "assets/bquotation.jpg",page: const BusinessQoute(),),
                    ServiceWidget(size: size,header1: "Financial",header2: "Audit",imageUrl: "assets/finaudit.jpg",page: const FinanAudit(),),

                  ],
                ),
              ),
            ),
            Text("Ongoing Events",style: Theme.of(context).textTheme.headlineLarge),
            SizedBox(height:size.height*0.45,child:
              appstate.ongoingevents.isEmpty?
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Column(
                      children: [
                        Image.asset("assets/Events.png",height: 100,),
                        Text("No Ongoing Events",style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),),
                      ],
                    )),
                  ):
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        itemCount: appstate.ongoingevents.length,
                        itemBuilder: (BuildContext context,int index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  if(appstate.ongoingselected==index){
                                    appstate.ongoingselected=-1;
                                  }
                                  else{
                                    appstate.ongoingselected=index;
                                  }
                                });
                              },
                              child: Container(
                                height: appstate.ongoingselected==index?150:65,
                                decoration: BoxDecoration(
                                  color: Colors.purple[700],
                                  borderRadius: const BorderRadius.all(Radius.circular(30))
                                ),
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const SizedBox(width: 30,),
                                          Text(appstate.ongoingevents[index]["title"].toString(),style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 24,
                                              color: Colors.purple[50],
                                            ),
                                          ),),
                                          SizedBox(width: size.width*.3,),
                                          Icon(Icons.calendar_month_outlined,color: Colors.purple[50],size: 30,),
                                          const SizedBox(width: 10,),
                                          Text(appstate.ongoingevents[index]["Date"].toString(),style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 18,
                                              color: Colors.purple[50],
                                            ),
                                          ),),
                                        ],
                                      ),
                                      Visibility(
                                          visible: (appstate.ongoingselected==index),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                        children:[

                                          const Padding(
                                            padding: EdgeInsets.only(left:40.0,right: 40),
                                            child: Divider(color: Colors.black,),
                                          ),
                                          const SizedBox(height: 10,),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20.0),
                                            child: Text("Auditor Details:",style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                fontSize: 18,
                                                color: Colors.purple[50],
                                              ),
                                            ),),
                                          ),
                                          const SizedBox(height: 10,),                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(Icons.account_circle_outlined),
                                                  const SizedBox(width:15),
                                                  Text(appstate.ongoingevents[index]["AuditorName"],style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.purple[50],
                                                    ),
                                                  ),),
                                                ],
                                              ),

                                              Row(
                                                children: [
                                                  const Icon(Icons.phone),
                                                  const SizedBox(width:15),
                                                  Text(appstate.ongoingevents[index]["AuditorContact"].toString(),style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.purple[50],
                                                    ),
                                                  ),)
                                                ],
                                              ),

                                            ],
                                      )]))
                                    ],
                                  )),
                            ),
                          );
                    })

                    /*Text("Event1",style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),),*/
                  )
              ,)
          ],

        )

      ),
    );
  }
}
