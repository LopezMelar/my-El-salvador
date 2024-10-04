class University {
  final int id;
  final String name;
  final double latitude;
  final double longitude;
  final String link;
  final String about;
  final List<String> imageUrls;

  University({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.link,
    required this.about,
    required this.imageUrls,
  });
}

final List<University> universities = [
  University(
    id: 1,
    name: 'Universidad Salvadoreña Alberto Masferrer (USAM)',
    latitude: 13.702665074675533,
    longitude: -89.200746000585,
    link: 'https://www.usam.edu.sv/',
    about:
        'La Universidad Salvadoreña “Alberto Masferrer” fue fundada el 24 de noviembre de 1979 por un grupo visionario de profesionales en diferentes áreas, siendo la primera universidad privada que incursionó en el área de la salud,'
        ' con carreras como Cirugía Dental, Medicina y Cirugía y Química y Farmacia-Biología entre otras.',
    imageUrls: [
      'assets/images/USAM.jpg',
      'assets/images/USAM1.jpg',
      'assets/images/USAM2.jpg',
    ],
  ),
  University(
    id: 2,
    name: 'Universidad Tecnológica de El Salvador (UTEC)',
    latitude: 13.700594295583572,
    longitude: -89.20169964115112,
    link: 'https://www.utec.edu.sv/',
    about:
        ' La Utec fue la primera universidad del país en ofrecer carreras virtuales y cuenta con un área exclusiva para esta modalidad de enseñanza: '
        'Utec Virtual, con la que se le está apostando a este sistema de estudios. Cuenta con la más amplia oferta educativa en esa modalidad en el país, '
        'con 11 carreras, que incluyen licenciaturas, ingenierías y técnicos, atendidas por docentes especializados en entornos virtuales, '
        'además de inaugurar su sala de grabaciones de video clases y contar con una nueva plataforma tecnológica que potencia la accesibilidad y se enfoca en la experiencia del usuario.',
    imageUrls: [
      'assets/images/tecno.jpg',
      'assets/images/tecno1.jpg',
      'assets/images/tecno2.jpg',
    ],
  ),

];
