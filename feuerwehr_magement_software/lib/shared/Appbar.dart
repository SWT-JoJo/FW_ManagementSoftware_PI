import 'package:flutter/material.dart';

class appAppBar extends StatelessWidget implements PreferredSizeWidget {
  const appAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "Freiwillige Feuerwehr \nEltville am Rhein",
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.red[800], // Beispiel Hintergrundfarbe
      foregroundColor: Colors.white, // Beispiel Vordergrundfarbe
      centerTitle: true, // Titel zentrieren
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 1.5); // Erhöhte Höhe für zweizeiligen Titel
}
