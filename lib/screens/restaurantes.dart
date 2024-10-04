class Restaurant {
  final int id;
  final String type;
  final String name;
  final double latitude;
  final double longitude;
  final String price;
  final String link;
  final String about;
  final String menuLink; // Para el menú del restaurante
  final List<String> imageUrls;

  Restaurant({
    required this.id,
    required this.type,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.price,
    required this.link,
    required this.about,
    required this.menuLink,
    required this.imageUrls,
  });
}

final List<Restaurant> restaurants = [
  Restaurant(
    id: 1,
    type: 'restaurant',
    name: 'Parrilla Brava',
    latitude: 13.695964,
    longitude: -89.205285,
    price: '550',
    link: 'https://www.example.com', // Enlace a la página del restaurante
    about:
        'Bar&Grill.. carnes y mariscos frescos, cerveza muy helada todas las ligas del mundo,'
        'UFC, NFL,NBA. Buena música y la mejor atención del Mercado Cuscatlan.',
    menuLink: 'https://www.example.com/menu', // Enlace al menú
    imageUrls: [
      'assets/images/parrilla_B.jpg',
      'assets/images/ParrillaBrava2.jpg',
      'assets/images/ParrillaBrava3.jpg',

      // Agrega más URLs de imágenes según sea necesario
    ],
  ),
  Restaurant(
    id: 2,
    type: 'restaurant',
    name: 'Alfa Coffee Shop',
    latitude: 13.696268964673598,
    longitude: -89.19012732117703,
    price: '\$5 - \$10',
    link: 'https://www.cadejo.com',
    about: 'Café de especialidad desde el origen ☕️ 🇸🇻'
        '¡Somos pet friendly!🐶',
    menuLink: 'https://www.example.com/menu', // Enlace al menú
    imageUrls: [
      'assets/images/Alfa1.jpg',
      'assets/images/Alfa2.jpg',
      'assets/images/Alfa3.jpg',
    ],
  ),
  Restaurant(
    id: 2,
    type: 'restaurant',
    name: 'El Chivo Negro',
    latitude: 13.698812640310296,
    longitude: -89.19081992799428,
    price: '\$5 - \$20',
    link: 'https://www.cadejo.com',
    about:
        'El Chivo Negro es un lugar ubicado en el corazón de San Salvador, en el centro histórico,'
        'específicamente en la 2° Avenida Sur, local 12. Tiene una calificación de 3.8 estrellas'
        'y su horario de atención es de lunes a domingo, de 06:00 a 22:30.',
    menuLink: 'https://www.example.com/menu', // Enlace al menú
    imageUrls: [
      'assets/images/chivo_negro.jpg',
      'assets/images/chivonegro.jpg',
      'assets/images/chivo_.jpg',
    ],
  ),
  Restaurant(
    id: 2,
    type: 'restaurant',
    name: 'Pupuseria Blanquita',
    latitude: 13.732710157029139,
    longitude: -89.06310068177895,
    price: '\$5 - \$10',
    link: '',
    about:
        'Pupusería Blanquita es un lugar emblemático ubicado en el corazón de San Martin,'
        'específicamente San Martin,San Salvador, local 4. Ofrecen las tradicionales pupusas salvadoreñas, con una calificación de 4.5 estrellas.'
        'El ambiente es acogedor, ideal para disfrutar en familia. Su horario de atención es de lunes a domingo, de 07:00 a 21:00,'
        'ofreciendo una experiencia gastronómica auténtica para los amantes de las pupusas y la comida típica.',

    menuLink: 'https://www.example.com/menu', // Enlace al menú
    imageUrls: [
      'assets/images/BlanquitaP.jpg',
      'assets/images/BlanquitaP1.jpg',
      'assets/images/BlanquitaP2.jpg',
    ],
  ),
  Restaurant(
    id: 3,
    type: 'restaurant',
    name: 'Basilico',
    latitude: 13.697060966328262,
    longitude: -89.19104568736523,
    price: '\$5 - \$10',
    link: '',
    about:
        'Basílico es un restaurante italiano especializado en pastas y pizzas artesanales.',

    menuLink: 'https://www.instagram.com/basilico.sv/', // Enlace al menú
    imageUrls: [
      'assets/images/basilico.jpg',
      'assets/images/basilico1.jpg',
      'assets/images/basilico2.jpg',
    ],
  ),

  // Agrega más restaurantes aquí
];
