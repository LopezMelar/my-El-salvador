import 'package:flutter/material.dart';
import 'package:mi_elsalvador/screens/creditos_screen.dart';
import 'package:mi_elsalvador/screens/favorite_screen.dart';
import 'package:mi_elsalvador/screens/home_screen.dart';
import 'package:mi_elsalvador/screens/map_screen.dart';
import 'package:mi_elsalvador/widget/menu_item.dart';
import 'package:mi_elsalvador/theme_app.dart';
import 'package:mi_elsalvador/config/app_route.dart';
import 'package:mi_elsalvador/favoritos_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'mi elsalvador',
      theme: ThemeApp.lightTheme,
      home: MyHomePage(),
      initialRoute: AppRoute.homeRoute,
      onGenerateRoute: AppRoute.generateRoute,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // Lista para almacenar los favoritos
  List<Map<String, String>> _favoritos = [];

  // Instancia del servicio de favoritos
  final FavoritosService _favoritosService = FavoritosService();

  final List<Widget> _screens = [
    HomeScreen(),
    MapScreen(),
    FavoritosScreen(),
    CreditosScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Cargar favoritos al iniciar
  @override
  void initState() {
    super.initState();
    _loadFavoritos(); // Cargar favoritos
  }

  Future<void> _loadFavoritos() async {
    _favoritos = await _favoritosService.loadFavoritos();
    setState(() {}); // Actualiza la UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar eliminado
      body: _screens[_selectedIndex],
      bottomNavigationBar: MenuItem(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
