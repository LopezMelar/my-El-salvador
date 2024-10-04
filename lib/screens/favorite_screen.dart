import 'package:flutter/material.dart';
import 'package:mi_elsalvador/favoritos_service.dart';

class FavoritosScreen extends StatelessWidget {
  final FavoritosService _favoritosService = FavoritosService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 16), // Espacio entre el título y la lista
            Expanded(
              child: FutureBuilder<List<Map<String, String>>>(
                future: _favoritosService.loadFavoritos(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Error al cargar favoritos'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No tienes favoritos aún.'));
                  }

                  final favoritos = snapshot.data!;

                  return ListView.builder(
                    itemCount: favoritos.length,
                    itemBuilder: (context, index) {
                      final favorito = favoritos[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(favorito['image']!),
                          ),
                          title: Text(
                            favorito['title']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(favorito['address']!),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () async {
                              await _favoritosService.removeFavorito(favorito);
                              // Recargar la lista después de eliminar el favorito
                              (context as Element).reassemble();
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
