class Attraction {
  final int id;
  final String type;
  final String name;
  final double latitude;
  final double longitude;
  final String price;
  final String link;
  final String about;
  final List<String> imageUrls;

  Attraction({
    required this.id,
    required this.type,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.price,
    required this.link,
    required this.about,
    required this.imageUrls,
  });
}

final List<Attraction> attractions = [
  Attraction(
    id: 1,
    type: 'attraction',
    name: ' Biblioteca Nacional de El Salvador (BINAES)',
    latitude: 13.696951016109145,
    longitude: -89.1911973933709,
    price: 'FREE',
    link: '',
    about:
        'El Teatro Nacional es uno de los edificios más emblemáticos y antiguos de la capital.',
    imageUrls: [
      'assets/images/binaes.jpg',
      'assets/images/binaes1.jpg',
      'assets/images/binaes2.jpg',
      'assets/images/binaes3.jpg',
    ],
  ),
  Attraction(
    id: 2,
    type: 'attraction',
    name: 'Iglesia El Rosario',
    latitude: 13.697414899808415,
    longitude: -89.18883883929959,
    price: 'FREE',
    link: '',
    about:
        'Desde 1971, la iglesia El Rosario es un patrimonio religioso de los salvadoreños como una de las últimas iglesias construidas en la capital,'
        ' que conserva un diseño arquitectónico moderno, enriquecido con influencia europea y única a nivel del continente.'
        'Ubicada frente al parque Libertad es una edificación que mide 24 metros de ancho y 80 de largo cuya forma es oval sin columnas, con 22 metros de altura.',
    imageUrls: [
      'assets/images/rosario.jpg',
      'assets/images/rosario1.jpg',
      'assets/images/rosario2.jpg',
    ],
  ),
  Attraction(
    id: 3,
    type: 'attraction',
    name: 'Monumento al Divino Salvador del Mundo',
    latitude: 13.701349646110705,
    longitude: -89.22443721822006,
    price: 'FREE',
    link: '',
    about:
        'La Plaza Salvador del Mundo, antiguamente llamada "Plaza Las Américas",'
        ' es el lugar del Monumento al Divino Salvador del Mundo y está en la ciudad de San Salvador, El Salvador.'
        ' Se le considera símbolo nacional del país.',
    imageUrls: [
      'assets/images/salvador.jpg',
      'assets/images/salvador1.jpg',
      'assets/images/salvador2.png',
    ],
  ),
  Attraction(
    id: 4,
    type: 'attraction',
    name: 'Plaza Libertad',
    latitude: 13.69749145983937,
    longitude: -89.18941901728164,
    price: 'FREE',
    link: '',
    about:
        'La plaza Libertad se encuentra ubicada en el centro histórico de la ciudad de San Salvador,'
        ' El Salvador. Fue desde este lugar donde inició la expansión de la urbe a mediados del siglo XVI.',
    imageUrls: [
      'assets/images/plazalibertad1.jpg',
      'assets/images/plazalibertad2.jpg',
    ],
  ),
  Attraction(
    id: 5,
    type: 'attraction',
    name: 'SURF CITY',
    latitude: 13.492799969355294,
    longitude: -89.38136752790717,
    price: 'FREE',
    link: 'https://www.instagram.com/surfcity/?hl=es',
    about:
        'Los amantes del surf tienen una cita ineludible en Surf City. De oriente a occidente del litoral salvadoreño y a lo '
        'largo de poco más de 300 kilómetros se suceden playas y olas que harán las delicias de los surfistas más expertos y '
        'de aquellos que deseen iniciarse en este apasionante deporte.Pero además de ser un atractivo de primer nivel mundial '
        'para los turistas, Surf City constituye una estrategia integral de desarrollo de la franja costera salvadoreña para impulsar '
        'la prosperidad económica y el bienestar social de las comunidades de diversos puntos costeros de los departamentos de Ahuachapán, '
        'Sonsonate, La Libertad, La Paz, San Miguel y La Unión. Una apuesta innovadora por un turismo sostenible en el tiempo y conectado completamente con la naturaleza.',
    imageUrls: [
      'assets/images/surfcity.jpg',
      'assets/images/surfcity1.jpg',
      'assets/images/surfcity2.jpg',
      'assets/images/surfcity3.jpg',
    ],
  ),
];
