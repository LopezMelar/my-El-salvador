import 'package:flutter/material.dart';

class ThemeApp {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.white, // Establece el color primario a blanco
    scaffoldBackgroundColor: Colors.white, // Fondo blanco en todas las pantallas
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white, // Fondo blanco del AppBar
      foregroundColor: Colors.black, // Texto negro
      centerTitle: true, // Centra el texto
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Color.fromARGB(255, 170, 60, 27), // Color del ítem seleccionado
      unselectedItemColor: Colors.grey, // Color de los ítems no seleccionados
      backgroundColor: Colors.white, // Fondo blanco de la barra de navegación
    ),
    iconTheme: const IconThemeData(
      color: Colors.black, // Iconos negros
    ),
  );
}
