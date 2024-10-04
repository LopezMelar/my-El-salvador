import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class FavoritosService {
  static const String _favoritosKey = 'favoritos';

  Future<List<Map<String, String>>> loadFavoritos() async {
    final prefs = await SharedPreferences.getInstance();
    final String? favoritosJson = prefs.getString(_favoritosKey);
    if (favoritosJson != null) {
      List<dynamic> favoritosList = json.decode(favoritosJson);
      return favoritosList.map((e) => Map<String, String>.from(e)).toList();
    }
    return [];
  }

  Future<void> saveFavoritos(List<Map<String, String>> favoritos) async {
    final prefs = await SharedPreferences.getInstance();
    final String favoritosJson = json.encode(favoritos);
    await prefs.setString(_favoritosKey, favoritosJson);
  }

  // Nueva función para agregar un favorito
  Future<void> addFavorito(Map<String, String> favorito) async {
    List<Map<String, String>> favoritos = await loadFavoritos();
    favoritos.add(favorito);
    await saveFavoritos(favoritos);
  }

  // Nueva función para eliminar un favorito
  Future<void> removeFavorito(Map<String, String> favorito) async {
    List<Map<String, String>> favoritos = await loadFavoritos();
    favoritos.removeWhere((item) => item['title'] == favorito['title']);
    await saveFavoritos(favoritos);
  }
}
