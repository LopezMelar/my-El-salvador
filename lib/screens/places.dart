class Place {
  final int id;
  final String type; // Por ejemplo, 'banco', 'centro comercial', etc.
  final String name;
  final double latitude;
  final double longitude;
  final String price;
  final String link;
  final String about;
  final List<String> imageUrls;
  final String logoUrl; // Nuevo atributo para el logo

  Place({
    required this.id,
    required this.type,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.price,
    required this.link,
    required this.about,
    required this.imageUrls,
    required this.logoUrl, // Asegúrate de inicializar este campo
  });
}

// Ejemplo de uso
final List<Place> places = [
  Place(
    id: 1,
    type: 'banco',
    name: 'Edificio del Banco Central de Reserva de El Salvador',
    latitude: 13.700165414632849,
    longitude: -89.1945896859395,
    price: 'FREE',
    link: '',
    about:
        'El Banco Central de Reserva de El Salvador es la entidad bancaria central de la República de El Salvador,'
        ' definido según su Ley Orgánica como una institución pública de '
        'crédito de carácter autónomo, cuyas principales funciones son regir la política económica de la nación, '
        'procurar la necesaria estabilidad monetaria y fomentar el desarrollo de un adecuado sistema financiero.',
    imageUrls: [
      'assets/images/bancocentral.jpg',
      'assets/images/bancocentral2.jpg',
    ],
    logoUrl: 'assets/images/banco.png', // Logo del banco
  ),

  Place(
    id: 2,
    type: 'centro comercial',
    name: 'Metrocentro San Salvador',
    latitude: 13.706310681094644,
    longitude: -89.21172735983615,
    price: 'FREE',
    link: '',
    about:
        'Metrocentro es el primer centro comercial inaugurado en San Salvador en 1971 y ha sido considerado un lugar emblemático'
        'para visitar, comprar y disfrutar de momentos especiales. Este centro comercial es el más grande de la ciudad y ofrece una amplia variedad de tiendas y servicios.',
    imageUrls: [
      'assets/images/metrocentro.jpg',
      'assets/images/metrocentro1.jpg',
    ],
    logoUrl: 'assets/images/logo_centro.png', // Logo del centro comercial
  ),
  // Agrega más lugares según sea necesario
];
