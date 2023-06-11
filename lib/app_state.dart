
import 'package:finalproject/fetchservices/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:finalproject/modals/data.dart';
class ApplicationState extends ChangeNotifier{

  List<ServiceDataItem> servicelist = [];
  final service= Services();
  int userstate=0;
  int ongoingselected=-1;
  int requestedselected=-1;
  int componentselected=-1;
  String datechosen="";
  String factorysitedescription="";
  List<String> serviceFactoryList=[
    "Site\nInspection",
    "Business\nQoutation",
    "Financial\nAudit"
  ];
  List<String> bgImageURL=[
    "assets/SiteBG.jpg",
    "assets/BQbg.png",
    "assets/FABG.jpg"
  ];
  List<String> Components=[
    "Condition Monitoring",
    "Thermography",
    "Oil Analysis",
    "Engery Audit",
    "Fire and Safety",
    "Leak Detection",
  ];

  List<Map<String,dynamic>> ongoingevents=[

    //ServiceDataItem(title: "abc1", Date: DateTime.parse(dateinput.text), AuditorName: "Hello1", AuditorContact: "Hello2", CompanyName: "Companu2", CompanyContact: "929299292", id: "abc121-12-2001"),
    {"title":"Event 1","Date": "ABCDEFGHIJK","AuditorName":"Name1","AuditorContact":9876543210,"CompanyName":"CName1","CompanyContact":9876543210},
    {"title":"Event 2","Date": "ABCDEFGHIJK","AuditorName":"Name1","AuditorContact":9876543210,"CompanyName":"CName1","CompanyContact":9876543210},
    {"title":"Event 3","Date": "ABCDEFGHIJK","AuditorName":"Name1","AuditorContact":9876543210,"CompanyName":"CName1","CompanyContact":9876543210},
    {"title":"Event 4","Date": "ABCDEFGHIJK","AuditorName":"Name1","AuditorContact":9876543210,"CompanyName":"CName1","CompanyContact":9876543210},
    {"title":"Event 5","Date": "ABCDEFGHIJK","AuditorName":"Name1","AuditorContact":9876543210,"CompanyName":"CName1","CompanyContact":9876543210},
    {"title":"Event 6","Date": "ABCDEFGHIJK","AuditorName":"Name1","AuditorContact":9876543210,"CompanyName":"CName1","CompanyContact":9876543210},
    {"title":"Event 7","Date": "ABCDEFGHIJK","AuditorName":"Name1","AuditorContact":9876543210,"CompanyName":"CName1","CompanyContact":9876543210},
    {"title":"Event 8","Date": "ABCDEFGHIJK","AuditorName":"Name1","AuditorContact":9876543210,"CompanyName":"CName1","CompanyContact":9876543210}
  ];
  List<Map<String,dynamic>> requestedevents=[
    {"title":"Event 10","Date": "ABCDEFGHIJK","AuditorName":"Name1","AuditorContact":9876543210,"CompanyName":"CName1","CompanyContact":9876543210},
    {"title":"Event 20","Date": "ABCDEFGHIJK","AuditorName":"Name1","AuditorContact":9876543210,"CompanyName":"CName1","CompanyContact":9876543210},
    {"title":"Event 30","Date": "ABCDEFGHIJK","AuditorName":"Name1","AuditorContact":9876543210,"CompanyName":"CName1","CompanyContact":9876543210},
    {"title":"Event 40","Date": "ABCDEFGHIJK","AuditorName":"Name1","AuditorContact":9876543210,"CompanyName":"CName1","CompanyContact":9876543210},
    {"title":"Event 50","Date": "ABCDEFGHIJK","AuditorName":"Name1","AuditorContact":9876543210,"CompanyName":"CName1","CompanyContact":9876543210},
    {"title":"Event 60","Date": "ABCDEFGHIJK","AuditorName":"Name1","AuditorContact":9876543210,"CompanyName":"CName1","CompanyContact":9876543210},
    {"title":"Event 70","Date": "ABCDEFGHIJK","AuditorName":"Name1","AuditorContact":9876543210,"CompanyName":"CName1","CompanyContact":9876543210},
    {"title":"Event 80","Date": "ABCDEFGHIJK","AuditorName":"Name1","AuditorContact":9876543210,"CompanyName":"CName1","CompanyContact":9876543210}
  ];

}