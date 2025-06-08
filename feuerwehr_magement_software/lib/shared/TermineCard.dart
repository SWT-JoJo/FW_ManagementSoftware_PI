import 'package:flutter/material.dart';

class termineWidget extends StatelessWidget {
  final String thema;
  final String datum;
  final TimeOfDay uhrstart;
  final TimeOfDay uhrende;
  final String verantwortlicher;
  final String abteilung;
  final Color color;

  //Ort Daten
  final String plz;
  final String Ort;
  final String Strasse;


  const termineWidget({
    super.key,
    required this.thema,
    required this.datum,
    required this.uhrstart,
    required this.uhrende,
    required this.verantwortlicher,
    required this.abteilung,
    required this.color,
    required this.plz,
    required this.Ort,
    required this.Strasse,
  });

  String limitOrtLength(String text){
    if(text.length > 18){
      return "${text.substring(0, 16)}...";
    } else {
      return text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 250,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Thema
              Text(
                thema,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),


              SizedBox(height: 10,),
              terminInfo(
                icon: Icon(Icons.access_time),
                info: "${uhrstart.format(context)} - ${uhrende.format(context)}",
              ),

              SizedBox(height: 5,),
              terminInfo(icon: Icon(Icons.calendar_month), info: datum),
              SizedBox(height: 5,),
              terminInfo(icon: Icon(Icons.person), info: verantwortlicher),
              SizedBox(height: 5,),
              terminInfo(icon: Icon(Icons.location_on), info: "$Strasse \n" + limitOrtLength("$plz $Ort")),

              SizedBox(height: 20,),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(abteilung, style: TextStyle(color: Colors.white),),
                ),
                color: color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class terminInfo extends StatelessWidget {
  final Icon icon;
  final String info;

  const terminInfo({super.key, required this.icon, required this.info});

  @override
  Widget build(BuildContext context) {
    return Row(children: [icon, SizedBox(width: 10), Text(info)]);
  }
}