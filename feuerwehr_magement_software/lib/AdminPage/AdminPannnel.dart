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
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final databaseRequestor _requestor = databaseRequestor();

  bool _isLoading = false;
  String? _errorMessage;
  String? _successMessage;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _successMessage = null;
    });

    try {
      await _requestor.createUser(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      setState(() {
        _successMessage = "Nutzer erfolgreich angelegt!";
      });
      _formKey.currentState!.reset();
    } catch (e) {
      setState(() {
        _errorMessage = "Fehler beim Anlegen des Nutzers: $e";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
                      decoration: InputDecoration(labelText: "Name"),
                      validator: (value) =>
                      (value == null || value.isEmpty) ? "Name eingeben" : null,
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
                    SizedBox(height: 20),
                    _isLoading
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                      onPressed: _submit,
                      child: Text("Nutzer anlegen"),
                    ),
                    if (_errorMessage != null) ...[
                      SizedBox(height: 10),
                      Text(_errorMessage!,
                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                    ],
                    if (_successMessage != null) ...[
                      SizedBox(height: 10),
                      Text(_successMessage!,
                          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                    ],
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
