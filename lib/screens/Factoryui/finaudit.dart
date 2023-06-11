import 'package:finalproject/app_state.dart';
import 'package:finalproject/modals/data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FinanAudit extends StatefulWidget {
  const FinanAudit({Key? key}) : super(key: key);

  @override
  State<FinanAudit> createState() => _FinanAuditState();
}

class _FinanAuditState extends State<FinanAudit> {

  final mycontroller = TextEditingController();
  TextEditingController dateinput = TextEditingController();
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
        actions: const [
          Padding(
            padding: EdgeInsets.only(right:8.0),
            child: Icon(Icons.account_circle_outlined,size: 40,),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Schdedule your meeting",style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 34,
              color: Colors.purple[700],
            ),
          ),),
          const SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: mycontroller,
              maxLines: 8,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Write down your projection",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: dateinput,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Schedule on ${appstate.datechosen}",
                  icon: const Icon(Icons.calendar_month)
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  String formattedDate =
                  DateFormat('yyyy-MM-dd').format(pickedDate);
                  setState(() {
                    dateinput.text = formattedDate;
                    appstate.notifyListeners();
                  });
                }
              },
            ),
          ),
          const SizedBox(height: 40,),
          Center(child: ElevatedButton(onPressed: () {
            print(mycontroller.text);
            print(appstate.datechosen);
            print(appstate.Components[appstate.componentselected]);
            setState(() {
              mycontroller.text = "";
              appstate.datechosen = "";
            });
            final newItem = ServiceDataItem(
                title: appstate.Components[appstate.componentselected],
                Date: DateTime.parse(dateinput.text),
                AuditorName: " ",
                AuditorContact: " ",
                CompanyName: "",
                CompanyContact: "CompanyContact",
                id: appstate.Components[appstate.componentselected] +
                    appstate.datechosen);
            appstate.service.requestData(newItem);
          }, style: ElevatedButton.styleFrom(), child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text("Request", style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 20,
              ),
            )),
          )))


        ],
      ),
    );
  }
}
