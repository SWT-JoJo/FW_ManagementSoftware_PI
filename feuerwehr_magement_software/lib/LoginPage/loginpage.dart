import 'package:feuerwehr_magement_software/Mainpage/MainPage.dart';
import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool loginError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[800], // Hintergrundfarbe des Scaffolds
      appBar: AppBar(
        title: const Text("Anmelden"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.red[800], // Hintergrundfarbe der AppBar
        elevation: 0, // Kein Schatten unter der AppBar
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          // Ermöglicht Scrollen, wenn der Inhalt zu lang ist
          child: Center(
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment
                  .center, // Zentriert die Elemente vertikal im verfügbaren Raum
              children: [
                const SizedBox(height: 80), // Abstand nach oben
                //Icon
                const Icon(
                  Icons.fire_truck_rounded,
                  size: 100,
                  color: Colors.white,
                ),
                const SizedBox(height: 50), // Abstand nach dem Icon
                // First Input Field (E-Mail)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ), // Horizontaler Abstand für die Felder
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "E-Mail-Adresse",
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      fillColor:
                      Colors.white, // Weißer Hintergrund für das Feld
                      filled: true,
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.grey[700],
                      ), // Icon im Feld
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ), // Abgerundete Ecken
                        borderSide:
                        BorderSide
                            .none, // Kein sichtbarer Rand im normalen Zustand
                      ),
                      focusedBorder: OutlineInputBorder(
                        // Rahmen bei Fokus
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                          color: Colors.blueAccent,
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        // Rahmen im normalen Zustand
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 10.0,
                      ), // Innerer Abstand des Texts
                    ),
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                      color: Colors.black87,
                    ), // Textfarbe im Feld
                  ),
                ),
                const SizedBox(height: 20), // Abstand zwischen den Feldern
                // Password Input Field
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ), // Horizontaler Abstand für die Felder
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true, // Text verstecken für Passwort
                    decoration: InputDecoration(
                      hintText: "Passwort",
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.lock, color: Colors.grey[700]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                          color: Colors.blueAccent,
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 10.0,
                      ),
                    ),
                    style: const TextStyle(color: Colors.black87),
                  ),
                ),
                const SizedBox(height: 40), // Abstand vor den Buttons

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MainPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shadowColor: Colors.black,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                  ),
                  child: const Text("Anmelden", style: TextStyle(fontSize: 15)),
                ),

                SizedBox(height: 20), // Abstand)

                if (loginError)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Passwort oder Email Adresse Falsch\n",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Bei Vergessenem Passwort oder keinem Account wenden sie sich an ihren Sytemadinistrator",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );

  }

  void validateLogin(){
    print(passwordController);
    print(emailController);
  }
}
