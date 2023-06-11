import 'package:finalproject/app_state.dart';
import 'package:finalproject/auth.dart';
import 'package:finalproject/modals/data.dart';
import 'package:finalproject/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SiteInspection extends StatefulWidget {
  const SiteInspection({Key? key}) : super(key: key);

  @override
  State<SiteInspection> createState() => _SiteInspectionState();
}

class _SiteInspectionState extends State<SiteInspection> {
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
  final mycontroller = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    var appstate =context.watch<ApplicationState>();


    var datechosen;
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: Text("Choose the Category",style: Theme.of(context).textTheme.headlineLarge),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: size.width,
                height: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap:(){
                            setState(() {
                              appstate.componentselected=0;
                            });
                          },
                          child: Container(width: 110,height: 110,decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                            border: appstate.componentselected==0?Border.all(width: 10):Border.all(width: 0),
                            borderRadius: const BorderRadius.all(Radius.circular(30))
                          ),
                          child: const Center(child: Text("Condition\nMonitoring")),),
                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          onTap:(){
                            setState(() {
                              appstate.componentselected=1;
                            });
                          },
                          child: Container(width: 110,height: 110,decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              border: appstate.componentselected==1?Border.all(width: 10):Border.all(width: 0),
                              borderRadius: const BorderRadius.all(Radius.circular(30))
                          ),child: const Center(child: Text("Thermography")),),
                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          onTap:(){
                            setState(() {
                              appstate.componentselected=2;
                            });
                          },
                          child: Container(width: 110,height: 110,decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              border: appstate.componentselected==2?Border.all(width: 10):Border.all(width: 0),
                              borderRadius: const BorderRadius.all(Radius.circular(30))
                          ),child: const Center(child: Text("Oil Analysis")),),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap:(){
                            setState(() {
                              appstate.componentselected=3;
                            });
                          },
                          child: Container(width: 110,height: 110,decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              border: appstate.componentselected==3?Border.all(width: 10):Border.all(width: 0),
                              borderRadius: const BorderRadius.all(Radius.circular(30))
                          ),child: const Center(child: Text("Energy Audit")),),
                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          onTap:(){
                            setState(() {
                              appstate.componentselected=4;
                            });
                          },
                          child: Container(width: 110,height: 110,decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              border: appstate.componentselected==4?Border.all(width: 10):Border.all(width: 0),
                              borderRadius: const BorderRadius.all(Radius.circular(30))
                          ),child: const Center(child: Text("Fire and Safety")),),
                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          onTap:(){
                            setState(() {
                              appstate.componentselected=5;
                            });
                          },
                          child: Container(width: 110,height: 110,decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              border: appstate.componentselected==5?Border.all(width: 10):Border.all(width: 0),
                              borderRadius: const BorderRadius.all(Radius.circular(30))
                          ),child: const Center(child: Text("Leak Detection")),),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: mycontroller,
                maxLines: 8,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Write down a description",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: dateinput,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Schedule on "+appstate.datechosen,
                  icon: const Icon(Icons.calendar_month)
                ),
                readOnly: true,
                onTap: ()async{
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if(pickedDate!=null){
                    String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                    setState(() {
                      dateinput.text=formattedDate;
                      appstate.notifyListeners();
                    });

                  }
                },
              ),
            ),
            Center(child: ElevatedButton(onPressed: (){
              setState(() {
                mycontroller.text="";
                appstate.datechosen="";
              });
              final newItem= ServiceDataItem(title: appstate.Components[appstate.componentselected], Date: DateTime.parse(dateinput.text), AuditorName: " ", AuditorContact: " ", CompanyName: "", CompanyContact: "CompanyContact", id: appstate.Components[appstate.componentselected]+appstate.datechosen);
              appstate.service.requestData(newItem);
            },style: ElevatedButton.styleFrom(), child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("Request",style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 20,
                ),
              )),
            )))


          ],

        ),
      ),
    );
  }
}
