import 'package:finalproject/app_state.dart';
import 'package:finalproject/auth.dart';
import 'package:finalproject/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageAudits extends StatefulWidget {
  const HomePageAudits({Key? key}) : super(key: key);

  @override
  State<HomePageAudits> createState() => _HomePageAuditsState();
}

class _HomePageAuditsState extends State<HomePageAudits> {

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
      body: Column(
        children: [
          Text("Ongoing Events",style: Theme.of(context).textTheme.headlineLarge),
          SizedBox(height:size.height*0.28,child:
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
                            if(appstate.ongoingselected==index) appstate.ongoingselected=-1;
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
                                            child: Text("Company Details:",style: GoogleFonts.poppins(
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
                                                  Text(appstate.ongoingevents[index]["CompanyName"],style: GoogleFonts.poppins(
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
                                                  Text(appstate.ongoingevents[index]["CompanyContact"].toString(),style: GoogleFonts.poppins(
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
          )
            ,),
          Text("Requested Events",style: Theme.of(context).textTheme.headlineLarge),
          SizedBox(height:size.height*0.53,child:
          appstate.requestedevents.isEmpty?
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Column(
              children: [
                Image.asset("assets/Events.png",height: 100,),
                Text("No Requested Events",style: GoogleFonts.poppins(
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
                  itemCount: appstate.requestedevents.length,
                  itemBuilder: (BuildContext context,int index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            if(appstate.requestedselected==index){
                              appstate.requestedselected=-1;
                            }
                            else{
                              appstate.requestedselected=index;
                            }

                          });
                        },
                        child: Container(
                            height: appstate.requestedselected==index?180:65,
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
                                    Text(appstate.requestedevents[index]["title"].toString(),style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 24,
                                        color: Colors.purple[50],
                                      ),
                                    ),),
                                    SizedBox(width: size.width*.3,),
                                    Icon(Icons.calendar_month_outlined,color: Colors.purple[50],size: 30,),
                                    const SizedBox(width: 10,),
                                    Text(appstate.requestedevents[index]["Date"].toString(),style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 18,
                                        color: Colors.purple[50],
                                      ),
                                    ),),
                                  ],
                                ),
                                Visibility(
                                    visible: (appstate.requestedselected==index),
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
                                            child: Text("Factory Details:",style: GoogleFonts.poppins(
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
                                                  Text(appstate.requestedevents[index]["CompanyName"],style: GoogleFonts.poppins(
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
                                                  Text(appstate.requestedevents[index]["CompanyContact"].toString(),style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.purple[50],
                                                    ),
                                                  ),)
                                                ],
                                              ),

                                            ],
                                          ),
                                          Center(child: ElevatedButton(onPressed: (){
                                            setState(() {
                                              var a=appstate.requestedevents[index];
                                              appstate.notifyListeners();
                                              appstate.requestedevents.removeAt(index);
                                              appstate.notifyListeners();
                                              appstate.ongoingevents.add(a);
                                              appstate.notifyListeners();

                                            });
                                          }, child: const Text("Accept")))

                                        ]),)
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
      ),
    );
  }
}
