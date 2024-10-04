class Park {
  final int id;
  final String type;
  final String name;
  final double latitude;
  final double longitude;
  final String price;
  final String link;
  final String about;
  final List<String> imageUrls; // Cambiado a lista de URLs

  Park({
    required this.id,
    required this.type,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.price,
    required this.link,
    required this.about,
    required this.imageUrls, // Incluye la lista de URLs en el constructor
  });
}

final List<Park> parks = [
  Park(
    id: 1,
    type: 'park',
    name: 'Plaza Gerardo Barrios',
    latitude: 13.698094,
    longitude: -89.191281,
    price: 'FREE',
    link: '',
    about:
        'La plaza Gerardo Barrios se encuentra en el centro histórico de San Salvador y es un importante punto de referencia en la capital. '
        'Además de la estatua del prócer Gerardo Barrios, la plaza está rodeada de edificios significativos, como la Biblioteca Nacional Francisco Gavidia, '
        'que data de 1870.',
    imageUrls: [
      // Cambiado a imageUrls
      'assets/images/plazag.jpg',
      'assets/images/plaza_g.jpg',
      'assets/images/plaza_g1.jpg',

      // Agrega más URLs de imágenes según sea necesario
    ],
  ),
  Park(
    id: 1,
    type: 'park',
    name: 'Redondel La Isla',
    latitude: 13.704654192243837,
    longitude: -89.17976220652248,
    price: 'FREE',
    link: '',
    about: '',
    imageUrls: [
      // Cambiado a imageUrls
      'assets/images/Laisla.jpg',
      // Agrega más URLs de imágenes según sea necesario
    ],
  ),
  Park(
    id: 1,
    type: 'park',
    name: 'Parque Cuscatlán',
    latitude: 13.698738323745593,
    longitude: -89.20669222785179,
    price: 'FREE',
    link: '',
    about: '',
    imageUrls: [
      // Cambiado a imageUrls
      'assets/images/parquecuscatlan.jpg',
      'assets/images/parquecuscatlan1.jpg',
      'assets/images/parquecuscatlan2.jpg',

      // Agrega más URLs de imágenes según sea necesario
    ],
  ),
  Park(
    id: 1,
    type: 'park',
    name: 'Parque Cuscatlán',
    latitude: 13.698738323745593,
    longitude: -89.20669222785179,
    price: 'FREE',
    link: '',
    about:
        ' Estos espacios ofrecen áreas verdes y son lugares donde los visitantes pueden relajarse y disfrutar de actividades al aire libre. ',
    imageUrls: [
      // Cambiado a imageUrls
      'assets/images/parquecuscatlan.jpg',
      'assets/images/parquecuscatlan1.jpg',
      'assets/images/parquecuscatlan2.jpg',

      // Agrega más URLs de imágenes según sea necesario
    ],
  ),
  Park(
    id: 1,
    type: 'park',
    name: 'Puerta del Diablo',
    latitude: 13.624935132923804,
    longitude: -89.18999593118802,
    price: 'FREE',
    link: '',
    about:
        'La Puerta del Diablo es una formación rocosa y sitio turístico localizado en el distrito de Panchimalco, departamento de San Salvador, El Salvador. ',
    imageUrls: [
      // Cambiado a imageUrls
      'assets/images/puertadiablo.jpg',
      'assets/images/puertadiablo1.jpg',
      'assets/images/puertadiablo2.jpg',

      // Agrega más URLs de imágenes según sea necesario
    ],
  ),
  // Agrega más parques con su respectiva lista de imageUrls
];
