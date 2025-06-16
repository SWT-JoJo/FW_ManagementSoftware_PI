import 'package:http/http.dart' as http;
import 'dart:convert';


class databaseRequestor{
//  static const String url = "http://10.5.241.156:8080"; //Schule
static const String url = "http://192.168.178.35:8080"; //Home


  //Fahrzeugdaten holen
  Future<List<dynamic>> getFahrzeuge() async {
    final urlToUse = '$url/Fahrzeuge';
    print('⚠️ Request an: $urlToUse');
    final response = await http.get(Uri.parse(urlToUse));

    print("🔁 Statuscode: ${response.statusCode}");
    print("📦 Body: ${response.body}");

    if (response.statusCode == 200) {
      try {
        final decoded = json.decode(response.body);
        print("✅ JSON-Decode erfolgreich: $decoded");

        if (decoded is List) {
          return decoded;
        } else {
          throw Exception("❌ JSON ist kein List-Objekt: $decoded");
        }
      } catch (e) {
        print("❌ Fehler beim JSON-Dekodieren: $e");
        throw Exception("Fehler beim Verarbeiten der Einsatzdaten");
      }
    } else {
      throw Exception("❌ Fehler beim Laden der Einsatze – Status: ${response.statusCode}");
    }
  }

Future<List<dynamic>> getEinsaetze() async {
  final urlToUse = '$url/Einsatz';
  print('⚠️ Request an: $urlToUse');
  final response = await http.get(Uri.parse(urlToUse));

  print("🔁 Statuscode: ${response.statusCode}");
  print("📦 Body: ${response.body}");

  if (response.statusCode == 200) {
    try {
      final decoded = json.decode(response.body);
      print("✅ JSON-Decode erfolgreich: $decoded");

      if (decoded is List) {
        return decoded;
      } else {
        throw Exception("❌ JSON ist kein List-Objekt: $decoded");
      }
    } catch (e) {
      print("❌ Fehler beim JSON-Dekodieren: $e");
      throw Exception("Fehler beim Verarbeiten der Fahrzeugdaten");
    }
  } else {
    throw Exception("❌ Fehler beim Laden der Fahrzeuge – Status: ${response.statusCode}");
  }
}


Future<List<dynamic>> getUebungsdiensteAm(DateTime date) async {
  final urlToUse = '$url/Uebungsdienste/${date.year}-${_twoDigits(date.month)}-${_twoDigits(date.day)}';
  print('⚠️ Request an: $urlToUse');
  final response = await http.get(Uri.parse(urlToUse));

  print("🔁 Statuscode: ${response.statusCode}");
  print("📦 Body: ${response.body}");

  if (response.statusCode == 200) {
    try {
      final decoded = json.decode(response.body);
      print("✅ JSON-Decode erfolgreich: $decoded");

      if (decoded is List) {
        return decoded;
      } else {
        throw Exception("❌ JSON ist kein List-Objekt: $decoded");
      }
    } catch (e) {
      print("❌ Fehler beim JSON-Dekodieren: $e");
      throw Exception("Fehler beim Verarbeiten der Fahrzeugdaten");
    }
  } else {
    throw Exception("❌ Fehler beim Laden der Fahrzeuge – Status: ${response.statusCode}");
  }
}

String _twoDigits(int n) {
    if(n.toString().length == 1){
      return '0$n';
    } else {
      return n.toString();
    }
}

Future<List<dynamic>> getUebungsdienste() async {
  final urlToUse = '$url/Uebungsdienste';
  print('⚠️ Request an: $urlToUse');
  final response = await http.get(Uri.parse(urlToUse));

  print("🔁 Statuscode: ${response.statusCode}");
  print("📦 Body: ${response.body}");

  if (response.statusCode == 200) {
    try {
      final decoded = json.decode(response.body);
      print("✅ JSON-Decode erfolgreich: $decoded");

      if (decoded is List) {
        return decoded;
      } else {
        throw Exception("❌ JSON ist kein List-Objekt: $decoded");
      }
    } catch (e) {
      print("❌ Fehler beim JSON-Dekodieren: $e");
      throw Exception("Fehler beim Verarbeiten der Fahrzeugdaten");
    }
  } else {
    throw Exception("❌ Fehler beim Laden der Fahrzeuge – Status: ${response.statusCode}");
  }
}


Future<void> createUser({
  required String name,
  required String email,
  required String password,
}) async {
  final urlToUSE = Uri.parse('$url/users'); // Beispiel-Endpunkt

  final response = await http.post(
    urlToUSE,
    headers: {'Content-Type': 'application/json'},
    body: json.encode({
      'name': name,
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode != 201) {
    // Status 201 = Created
    throw Exception('Fehler beim Erstellen des Nutzers: ${response.body}');
  }
}


}

