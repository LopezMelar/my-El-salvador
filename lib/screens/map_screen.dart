import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mi_elsalvador/screens/parques.dart';
import 'package:mi_elsalvador/screens/places.dart';
import 'package:mi_elsalvador/screens/restaurantes.dart';
import 'package:mi_elsalvador/screens/universidades.dart';

import 'package:url_launcher/url_launcher.dart';

import 'Hoteles.dart';
import 'atracciones.dart';
import 'convenciones.dart';

// Asegúrate de importar los parques y otros archivos necesarios aquí
// import 'package:your_project_name/parques.dart';

const MAPBOX_ACCESS_TOKEN =
    'pk.eyJ1IjoiYW5kcmV2YWxvczg4IiwiYSI6ImNtMTg4enFjdjE0bXAyanB4c2s2cDMxZTUifQ.Nn_T4H3wO70_e3doq8__4Q';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? myPosition;
  LatLng? searchedPosition;
  final MapController _mapController = MapController();
  List<Marker> markers = [];
  final TextEditingController _searchController = TextEditingController();

  // Definir las categorías de filtro
  final List<String> _filters = [
    'Todos',
    'Restaurantes',
    'Parques',
    'Atracciones',
    'Eventos',
    'Universidades',
    'Centros Comerciales',
    'Hoteles'
  ];
  String _selectedFilter = 'Todos'; // Filtro inicial

  Future<Position> determinePosition() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  void getCurrentLocation() async {
    Position position = await determinePosition();
    setState(() {
      myPosition = LatLng(position.latitude, position.longitude);
      if (myPosition != null) {
        markers.add(
          Marker(
            width: 80.0,
            height: 80.0,
            point: myPosition!,
            child:
                const Icon(Icons.my_location, color: Colors.blue, size: 40.0),
          ),
        );
        _loadStaticMarkers();
      }
    });
  }

  Future<void> _searchLocation(String query) async {
    try {
      List<Location> locations = await locationFromAddress(query);
      if (locations.isNotEmpty) {
        final location = locations.first;
        final point = LatLng(location.latitude, location.longitude);
        _mapController.move(point, 19.0);
        _addDestinationMarker(point);
      } else {
        print('No se encontró la ubicación');
      }
    } catch (e) {
      print('Error en la búsqueda de ubicación: $e');
    }
  }

  void _addDestinationMarker(LatLng point) {
    setState(() {
      markers.add(
        Marker(
          width: 80.0,
          height: 80.0,
          point: point,
          child: GestureDetector(
            onTap: () {
              _removeMarker(point);
            },
            child: const Icon(Icons.location_on, color: Colors.red, size: 40.0),
          ),
        ),
      );
    });
  }

  void _removeMarker(LatLng point) {
    setState(() {
      markers.removeWhere((marker) => marker.point == point);
    });
  }

  void _showBottomSheet(String name, String about, String link, String price,
      List<String> imageUrls) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          // Agrega esto
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'About: $about',
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Price: ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: price, // Aquí se muestra el precio
                        style: const TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blueAccent[100], // Color de fondo más suave
                    foregroundColor: Colors.white, // Color del texto
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16), // Espaciado horizontal
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8), // Bordes redondeados
                    ),
                  ),
                  onPressed: () async {
                    final Uri url = Uri.parse(link);
                    if (await canLaunch(url.toString())) {
                      await launch(url.toString());
                    } else {
                      throw 'No se pudo abrir el enlace: $link';
                    }
                  },
                  child: const Text('Más información'),
                ),
                const SizedBox(height: 10),
                CarouselSlider(
                  options: CarouselOptions(autoPlay: true),
                  items: imageUrls.map((url) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(url,
                                fit: BoxFit.cover, width: 1000),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _loadStaticMarkers() {
    // Definir la ubicación actual del usuario utilizando la variable `myPosition`
    // Asegúrate de que `myPosition` ya tenga la ubicación actual del usuario
    if (myPosition != null) {
      LatLng userLocation = myPosition!;

      // Mantener solo el marcador de la ubicación actual
      markers.removeWhere((marker) => marker.point != userLocation);

      // Dependiendo del filtro seleccionado, agregar los marcadores correspondientes
      if (_selectedFilter == 'Todos') {
        _addParquesMarkers();
        _addAtraccionesMarkers();
        _addRestaurantesMarkers();
        _addEventMarkers();
        _addUniversityMarkers();
        _addPlacesMarkers();
        _addHotelMarkers();
      } else if (_selectedFilter == 'Parques') {
        _addParquesMarkers();
      } else if (_selectedFilter == 'Atracciones') {
        _addAtraccionesMarkers();
      } else if (_selectedFilter == 'Restaurantes') {
        _addRestaurantesMarkers();
      } else if (_selectedFilter == 'Eventos') {
        _addEventMarkers();
      } else if (_selectedFilter == 'Universidades') {
        _addUniversityMarkers();
      } else if (_selectedFilter == 'Centro Comercial') {
        _addPlacesMarkers();
      } else if (_selectedFilter == 'Hoteles') {
        _addHotelMarkers();
      }

      setState(
          () {}); // Actualizar el estado para reflejar los cambios en el mapa
    } else {
      print("Ubicación del usuario no disponible.");
    }
  }

  // Funciones auxiliares para agregar marcadores por tipo
  void _addParquesMarkers() {
    for (var park in parks) {
      markers.add(
        Marker(
          width: 42,
          height: 42,
          point: LatLng(park.latitude, park.longitude),
          child: GestureDetector(
            onTap: () => _showBottomSheet(
              park.name,
              park.about,
              park.link,
              park.price,
              park.imageUrls,
            ),
            child: Image.asset(
              'assets/images/logoparque.png',
              width: 42,
              height: 42,
            ),
          ),
        ),
      );
    }
  }

  void _addAtraccionesMarkers() {
    for (var attraction in attractions) {
      markers.add(
        Marker(
          width: 38,
          height: 38,
          point: LatLng(attraction.latitude, attraction.longitude),
          child: GestureDetector(
            onTap: () => _showBottomSheet(
              attraction.name,
              attraction.about,
              attraction.link,
              attraction.price,
              attraction.imageUrls,
            ),
            child: Image.asset(
              'assets/images/atraccion.png', // Un ícono personalizado para atracciones
              width: 38,
              height: 38,
              fit: BoxFit.contain,
            ),
          ),
        ),
      );
    }
  }

  void _addPlacesMarkers() {
    for (var place in places) {
      markers.add(
        Marker(
          width: 38,
          height: 38,
          point: LatLng(place.latitude, place.longitude),
          child: GestureDetector(
            onTap: () => _showBottomSheet(
              place.name,
              place.about,
              place.link,
              place.price,
              place.imageUrls,
            ),
            child: Image.asset(
              place.logoUrl, // Usar el logo específico del lugar
              width: 38,
              height: 38,
            ),
          ),
        ),
      );
    }
  }

  void _addRestaurantesMarkers() {
    for (var restaurant in restaurants) {
      markers.add(
        Marker(
          width: 38,
          height: 38,
          point: LatLng(restaurant.latitude, restaurant.longitude),
          child: GestureDetector(
            onTap: () => _showBottomSheet(
              restaurant.name,
              restaurant.about,
              restaurant.link,
              restaurant.price,
              restaurant.imageUrls,
            ),
            child: Image.asset(
              'assets/images/logoRestaurant.png',
              width: 38,
              height: 38,
            ),
          ),
        ),
      );
    }
  }

  void _addUniversityMarkers() {
    for (var university in universities) {
      markers.add(
        Marker(
          width: 38,
          height: 38,
          point: LatLng(university.latitude, university.longitude),
          child: GestureDetector(
            onTap: () => _showBottomSheet(
              university.name,
              university.about,
              university.link,
              '', // No pasas un precio aquí, o puedes pasar un valor vacío
              university.imageUrls,
            ),
            child: Image.asset(
              'assets/images/localizacion.png', // Asegúrate de tener el ícono correcto
              width: 38,
              height: 38,
            ),
          ),
        ),
      );
    }
  }

  void _addEventMarkers() {
    for (var convention in conventions) {
      // Si quieres mostrar un solo marcador por convención y no por evento individual
      markers.add(
        Marker(
          width: 38,
          height: 38,
          point: LatLng(convention.latitude, convention.longitude),
          child: GestureDetector(
            onTap: () => _showEventBottomSheet(
                convention), // Mostrar todos los eventos de la convención
            child: Image.asset(
              'assets/images/calendario.png', // Ícono para eventos
              width: 38,
              height: 38,
            ),
          ),
        ),
      );
    }
  }

  void _addHotelMarkers() {
    for (var hotel in hotels) {
      markers.add(
        Marker(
          width: 38,
          height: 38,
          point: LatLng(hotel.latitude, hotel.longitude),
          child: GestureDetector(
            onTap: () => _showBottomSheet(
              hotel.name,
              hotel.about,
              hotel.link,
              hotel.price,
              hotel.imageUrls,
            ),
            child: Image.asset(
              'assets/images/ubicacion-en-el-mapa.png',
              width: 38,
              height: 38,
            ),
          ),
        ),
      );
    }
  }

  void _showEventBottomSheet(Convention convention) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    convention.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ...convention.events.map((event) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'About: ${event.about}', // Asegúrate de que `event` tenga el atributo `about`
                        style: const TextStyle(color: Colors.black),
                      ),
                      Text('Fecha: ${event.date}',
                          style: TextStyle(color: Colors.grey)),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Price: ',
                              style: TextStyle(color: Colors.black),
                            ),
                            TextSpan(
                              text: event.price,
                              style: const TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent[100],
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () async {
                          final Uri url = Uri.parse(event.link);
                          if (await canLaunch(url.toString())) {
                            await launch(url.toString(),
                                forceSafariVC:
                                    false); // Puedes usar forceSafariVC: false para Android
                          } else {
                            throw 'No se pudo abrir el enlace: ${event.link}';
                          }
                        },
                        child: const Text('Más información'),
                      ),
                      const SizedBox(height: 10),
                      CarouselSlider(
                        options: CarouselOptions(autoPlay: true),
                        items: event.imageUrls.map((url) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset(url,
                                      fit: BoxFit.cover, width: 1000),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      const Divider(),
                    ],
                  );
                }).toList(),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _selectedFilter = 'Todos';
    getCurrentLocation();
    _loadStaticMarkers(); // Cargar los marcadores estáticos según el filtro
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myPosition == null
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: searchedPosition ?? myPosition!,
                    initialZoom: 19,
                    minZoom: 5,
                    maxZoom: 25,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
                      additionalOptions: const {
                        'accessToken': MAPBOX_ACCESS_TOKEN,
                        'id': 'mapbox/streets-v12',
                      },
                    ),
                    MarkerLayer(
                      markers: markers,
                    ),
                  ],
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      // Widget de Búsqueda
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.search, color: Colors.grey),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  controller: _searchController,
                                  decoration: const InputDecoration(
                                    hintText: 'Buscar...',
                                    border: InputBorder.none,
                                  ),
                                  onSubmitted: (value) {
                                    _searchLocation(value);
                                  },
                                ),
                              ),
                              if (_searchController.text.isNotEmpty)
                                IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () {
                                    _searchController.clear();
                                    setState(() {});
                                  },
                                ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        icon: const Icon(
                          FontAwesomeIcons
                              .filter, // Cambia esto por el ícono que prefieras
                          color: Colors.black,
                        ),
                        onPressed: () {
                          _showFilterOptions();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  void _showFilterOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            // Añadir SingleChildScrollView
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Filtrar por:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Cambiar color del texto a negro
                  ),
                ),
                const SizedBox(height: 20),
                ..._filters.map((filter) {
                  // Agregar un icono dependiendo del filtro
                  IconData icon;
                  switch (filter) {
                    case 'Restaurantes':
                      icon = Icons.restaurant;
                      break;
                    case 'Parques':
                      icon = Icons.park;
                      break;
                    case 'Atracciones':
                      icon = Icons.attractions;
                      break;
                    case 'Eventos':
                      icon = Icons.event;
                      break;
                    case 'Universidades':
                      icon = Icons.school;
                      break;
                    case 'Comerciales':
                      icon = Icons.storefront;
                      break;
                    case 'Hoteles':
                      icon = Icons.hotel;
                      break;
                    default:
                      icon = Icons.place; // Icono para "Todos"
                  }

                  return ListTile(
                    leading: Icon(icon, color: Colors.black), // Agregar icono
                    title: Text(
                      filter,
                      style: const TextStyle(
                        color: Colors
                            .black, // Cambiar color del texto de los filtros
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _selectedFilter =
                            filter; // Actualizar el filtro seleccionado
                        _loadStaticMarkers(); // Recargar marcadores según el filtro
                      });
                      Navigator.pop(context); // Cerrar el modal
                    },
                  );
                }).toList(),
              ],
            ),
          ),
        );
      },
    );
  }
}
