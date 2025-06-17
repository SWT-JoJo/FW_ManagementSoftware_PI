import 'package:http/http.dart' as http;
import 'dart:convert';


class databaseRequestor{
  static const String url = "http://10.5.241.156:8080"; //Schule
 // static const String url = "http://192.168.178.35:8080"; //Home


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
    required String vorname, // Hinzugefügt
    required String email,
    required String password,
    required String strasse, // Hinzugefügt
    required int plz,       // Hinzugefügt
    required String ort,     // Hinzugefügt
    required bool isAdmin,   // Hinzugefügt
  }) async {
    final urlToUSE = Uri.parse('$url/Benutzer/create'); // Beispiel-Endpunkt

    print('⚠️ Request an: $urlToUSE für createUser');
    print('📦 Sende Body: ${json.encode({
      'name': name,
      'vorname': vorname,
      'email': email,
      'passwort': password,
      'enr': null,
      'strasse': strasse,
      'plz': plz,
      'ort': ort,
      'admin': isAdmin,
    })}');

    final response = await http.post(
      urlToUSE,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'name': name,
        'vorname': vorname, // Hier die neuen Felder hinzufügen
        'email': email,
        'passwort': password, // ACHTUNG: Die Spalte in der DB ist 'passwort', nicht 'password'!
        'enr': null,
        'strasse': strasse,
        'plz': plz,
        'ort': ort,
        'is_admin': isAdmin,
        // 'pnr' wird nicht gesendet, da es AI PK ist (Auto Increment Primary Key)
      }),
    );

    print("🔁 Statuscode createUser: ${response.statusCode}");
    print("📦 Body createUser: ${response.body}");

    if (response.statusCode != 201 && response.statusCode != 200) {
      // Status 201 = Created. Bei anderen Statuscodes (z.B. 400 Bad Request, 500 Internal Server Error)
      // werfen wir eine Exception.
      throw Exception('Fehler beim Erstellen des Nutzers: ${response.statusCode} - ${response.body}');
    } else {
      print("✅ Nutzer erfolgreich angelegt!");
    }
  }


}