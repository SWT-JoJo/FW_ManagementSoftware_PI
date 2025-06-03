import 'package:mysql_client/mysql_client.dart';

class DatabaseRequestor {
  MySQLConnection? _conn;

  // Stellt sicher, dass eine Verbindung besteht (einmalig)
  Future<void> connect() async {
    if (_conn == null || !_conn!.connected) {
      _conn = await MySQLConnection.createConnection(
        host: "mysql-1d87f374-jonahmaximilian1806-2fe7.i.aivencloud.com",
        port: 19487,
        userName: "avnadmin",
        password: "AVNS_DdDmynPn-226JBqoIJq",
        databaseName: "Projekt",
      );
      await _conn!.connect();
    }
  }

  // Führt eine beliebige SELECT-Abfrage aus und gibt das Ergebnis zurück
  Future<IResultSet> executeQuery(String query) async {
    await connect(); // Verbindung sicherstellen
    return await _conn!.execute(query);
  }

  // Beispiel: Gibt den Namen des Benutzers mit ID 1 aus
  Future<void> requestUsername() async {
    final result = await executeQuery("SELECT name FROM users WHERE id = 1");

    for (final row in result.rows) {
      print("Username: ${row.colAt(0)}");
    }
  }

  // Verbindung sauber beenden (z. B. beim App-Ende)
  Future<void> close() async {
    if (_conn != null && _conn!.connected) {
      await _conn!.close();
      _conn = null;
    }
  }

  Future<void> requestLastEinsaetze() async {
    final result = await executeQuery("Select * From Einsatz ORDER BY EinsatzID DESC");

    for (final row in result.rows) {
      print("Einsatz: ${row.colAt(0)}");
    }
  }

}
