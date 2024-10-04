class Hotel {
  final int id;
  final String type; // Por ejemplo, 'Hotel'
  final String name;
  final double latitude;
  final double longitude;
  final String price;
  final String link;
  final String about;
  final List<String> imageUrls;

  Hotel({
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

// Ejemplo de uso
final List<Hotel> hotels = [
  Hotel(
    id: 1,
    type: 'Hotel',
    name: 'Hilton San Salvador',
    latitude: 13.709823214177343,
    longitude: -89.24120948115105,
    price: 'Consultar web',
    link: 'https://www.hilton.com/es/hotels/salsahh-hilton-san-salvador/',
    about:
        'Hoteles Hilton es una compañía internacional de hoteles con múltiples servicios de calidad.',
    imageUrls: [
      'assets/images/hilton.jpg',
      'assets/images/hilton1.jpg',
      'assets/images/hilton2.jpg',
    ],
  ),
  Hotel(
    id: 2,
    type: 'Hotel',
    name: 'Hotel Real InterContinental San Salvador',
    latitude: 13.707661951298729,
    longitude: -89.21172735983615,
    price: 'Consultar web',
    link:
        'https://www.ihg.com/intercontinental/hotels/us/es/find-hotels/select-roomrate?fromRedirect=true',
    about: 'Un hotel refinado ubicado frente al centro comercial Metrocentro.',
    imageUrls: [
      'assets/images/hotelintercontinental.jpg',
      'assets/images/hotelintercontinental1.jpg',
      'assets/images/hotelintercontinental2.jpg',
    ],
  ),
  Hotel(
    id: 3,
    type: 'Hotel',
    name: 'Hotel Barcelo',
    latitude: 13.69390896478944,
    longitude: -89.23766620463495,
    price: 'Consultar web',
    link:
        'https://www.barcelo.com/es-us/hoteles/barcelo/?esl-k=google-ads|ng|c614756386740|me|khotel%20barcelo|p|t|dc|a83539960444|g7857166461&id_hotel_sem=default&gad_source=1&gclid=CjwKCAjw0t63BhAUEiwA5xP54ey83MogqVQE0u-iflgPEJ2Rgj50lovJqzVuZaLuixyrbkwPht5TJBoCYtUQAvD_BwE',
    about:
        'Este hotel tranquilo, con vista al volcán San Salvador, y cercano a tiendas y restaurantes, '
        'se ubica a 11 minutos a pie del Museo de Arte de El Salvador y a 43 km del Aeropuerto Internacional de El Salvador.',
    imageUrls: [
      'assets/images/barcelo.jpg',
      'assets/images/barcelo1.jpg',
      'assets/images/barcelo2.jpg',
    ],
  ),
  Hotel(
    id: 2,
    type: 'Hotel',
    name: 'Hotel Sheraton Presidente El salvador',
    latitude: 13.698204400856588,
    longitude: -89.2417601820429,
    price: 'Consultar web',
    link:
        'https://www.marriott.com/es/hotels/salsi-sheraton-presidente-san-salvador-hotel/overview/',
    about: 'Un hotel refinado ubicado frente al centro comercial Metrocentro.',
    imageUrls: [
      'assets/images/hotelintercontinental.jpg',
      'assets/images/hotelintercontinental1.jpg',
      'assets/images/hotelintercontinental2.jpg',
    ],
  ),
  // Agrega más hoteles según sea necesario
];
