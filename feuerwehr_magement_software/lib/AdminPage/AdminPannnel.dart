import 'package:feuerwehr_magement_software/shared/navigationBar.dart';
import 'package:flutter/material.dart';
import '../shared/Appbar.dart';
import '../services/databaseRequestor.dart';

class AdminPannel extends StatefulWidget {
  const AdminPannel({super.key});

  @override
  State<AdminPannel> createState() => _AdminPannelState();
}

class _AdminPannelState extends State<AdminPannel> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _vornameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _enrController = TextEditingController(); // Wieder hinzugefügt
  final _strasseController = TextEditingController();
  final _plzController = TextEditingController();
  final _ortController = TextEditingController();
  bool _isAdmin = false;

  final databaseRequestor _requestor = databaseRequestor();

  bool _isLoading = false;
  // _errorMessage und _successMessage werden nicht mehr als State-Variablen benötigt,
  // da wir SnackBar verwenden und diese direkt anzeigen.

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    // Schließe die Tastatur
    FocusScope.of(context).unfocus();

    setState(() {
      _isLoading = true;
    });

    try {
      await _requestor.createUser(
        name: _nameController.text.trim(),
        vorname: _vornameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        strasse: _strasseController.text.trim(),
        plz: int.tryParse(_plzController.text.trim()) ?? 0,
        ort: _ortController.text.trim(),
        isAdmin: _isAdmin,
      );

      // Erfolgsmeldung als SnackBar anzeigen
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Nutzer erfolgreich angelegt!"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3),
        ),
      );

      _formKey.currentState!.reset();
      // Setze Checkbox und enr-Controller nach Reset zurück
      setState(() {
        _isAdmin = false;
        _enrController.clear(); // Auch enr-Feld leeren
      });

    } catch (e) {
      // Fehlermeldung als SnackBar anzeigen
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Fehler beim Anlegen des Nutzers: ${e.toString().split(':').last.trim()}"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _vornameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _enrController.dispose();
    _strasseController.dispose();
    _plzController.dispose();
    _ortController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(),
      bottomNavigationBar: navBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 15),
              Center(
                child: Text(
                  "Admin Pannel",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[800],
                  ),
                ),
              ),
              SizedBox(height: 20),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(labelText: "Nachname"),
                      validator: (value) =>
                      (value == null || value.isEmpty) ? "Nachname eingeben" : null,
                    ),
                    TextFormField(
                      controller: _vornameController,
                      decoration: InputDecoration(labelText: "Vorname"),
                      validator: (value) =>
                      (value == null || value.isEmpty) ? "Vorname eingeben" : null,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: "E-Mail"),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) return "E-Mail eingeben";
                        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                        if (!emailRegex.hasMatch(value)) return "Ungültige E-Mail";
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(labelText: "Passwort"),
                      obscureText: true,
                      validator: (value) =>
                      (value == null || value.length < 6)
                          ? "Mindestens 6 Zeichen"
                          : null,
                    ),
                    TextFormField(
                      controller: _strasseController,
                      decoration: InputDecoration(labelText: "Straße"),
                      validator: (value) =>
                      (value == null || value.isEmpty) ? "Straße eingeben" : null,
                    ),
                    TextFormField(
                      controller: _plzController,
                      decoration: InputDecoration(labelText: "PLZ"),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) return "PLZ eingeben";
                        if (int.tryParse(value) == null) return "Bitte eine gültige Zahl eingeben";
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _ortController,
                      decoration: InputDecoration(labelText: "Ort"),
                      validator: (value) =>
                      (value == null || value.isEmpty) ? "Ort eingeben" : null,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: _isAdmin,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _isAdmin = newValue ?? false;
                            });
                          },
                        ),
                        Text("Ist Admin?"),
                      ],
                    ),
                    SizedBox(height: 20),
                    _isLoading
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                      onPressed: _submit,
                      child: Text("Nutzer anlegen"),
                    ),
                    // Entfernt: Die Text-Widgets für Fehlermeldungen, da SnackBar verwendet wird
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}