import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mi_elsalvador/config/app_route.dart';
import 'package:mi_elsalvador/favoritos_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  final FavoritosService _favoritosService = FavoritosService();
  int _current = 0;
  bool _isFavoriteBanner = false;
  late List<bool> _isFavoritePlaya;
  late List<bool> _isFavoriteRestaurante;
  late List<bool> _isFavoriteVolcan;
  late List<bool> _isFavoriteConcierto;
  late List<bool> _isFavoriteSeminario;

  List<Map<String, String>> imageInfo = [
    {
      'image': 'assets/images/sobresaliente1.jpg',
      'title': 'Picnic steak house',
      'address': 'Calle al Boqueron km 16, Santa Tecla, El Salvador',
      'hours': '10:30a. m. - 10:00p. m.',
      'prices': '\$\$',
      'description':
          'Restaurante al aire libre que ofrece variedad de carnes, además buenos cócteles y platos veganos',
      'phone': '2550 4888',
      'email': 'picnicsteakhouse@gmail.com',
      'tag': '#',
    },
    {
      'image': 'assets/images/sobresaliente2.jpg',
      'title': 'Puerta del Diablo',
      'address':
          'Calle a Mil Cumbres, cantón el Cedro, Municipio de Panchimalco y Departamento de San Salvador',
      'hours': '8:00 a.m. a 10:00 p.m',
      'prices': '\$',
      'description':
          'La Puerta del Diablo es una formación rocosa y sitio turístico localizado en el distrito de Panchimalco, departamento de San Salvador',
      'phone': 'No disponible',
      'email': 'solicitudesparques@istu.gob.sv',
      'tag': '#',
    },
    {
      'image': 'assets/images/sobresaliente3.jpg',
      'title': 'Cadejo Brewing Company',
      'address':
          'Calle La Reforma #222, Colonia San Benito, San Salvador, El Salvador',
      'hours': '11:00a. m. - 10:00p. m',
      'prices': '\$\$',
      'description':
          'Tipos de cocina. Pub con cerveza artesanal, Latina, Bar, Pub, Pub restaurante, salvadoreña; Dietas especiales. Opciones vegetarianas, Opciones veganas',
      'phone': '2245 9390',
      'email': 'cervezacadejo.com',
      'tag': '#',
    },
    {
      'image': 'assets/images/sobresaliente4.jpg',
      'title': 'Hotel InterContinental San Salvador',
      'address': 'Boulevard De Los Heroes, Y Avenue Sisimiles, San Salvador',
      'hours': 'Hora de entrada: 4:00 p.m. Hora de salida: 1:00 p.m.',
      'prices': '\$\$\$',
      'description':
          'Este lujoso hotel de San Salvador está ubicado en el corazón de la zona de entretenimiento y negocios de la ciudad junto al Metrocentro San Salvador, el centro comercial más grande de Centroamérica',
      'phone': '503 22113333',
      'email': 'instant.sslhb@r-hr.com',
      'tag': '#',
    },
    {
      'image': 'assets/images/sobresaliente5.jpg',
      'title': 'El Ático - Planes de Renderos',
      'address': 'RN 6S, Planes de Renderos',
      'hours': '7a.m. 11p.m',
      'prices': '\$\$',
      'description':
          'Las mejores pupusas de El Salvador esperan por ti en #ElAtico Recuerda que puedes encontrarnos en WAZE o GOOGLE MAPS como: El Ático Restaurante',
      'phone': '7920 1581',
      'email': 'info@lugar5.com',
      'tag': '#',
    }
  ];

  List<String> images = [
    'assets/images/imagen1.jpg',
    'assets/images/imagen2.jpg',
    'assets/images/imagen3.jpg',
    'assets/images/imagen4.jpg',
    'assets/images/imagen5.jpg',
  ];

  List<Map<String, String>> playaInfo = [
    {
      'image': 'assets/images/playa1.jpg',
      'title': 'Playa El Tunco',
      'address': 'El Tunco, La Libertad, El Salvador',
      'hours': 'Abierto las 24 horas',
      'prices': 'Entrada libre, estacionamiento \$5',
      'description':
          'Playa El Tunco es famosa por su ambiente relajado, excelente surf y vibrante vida nocturna. Es un destino turístico popular tanto para locales como extranjeros.',
      'phone': 'No disponible',
      'email': 'No disponible',
      'tag': '#playa',
    },
    {
      'image': 'assets/images/playa2.jpg',
      'title': 'Playa El Zonte',
      'address': 'El Zonte, La Libertad, El Salvador',
      'hours': 'Abierto las 24 horas',
      'prices': 'Entrada libre, estacionamiento \$4',
      'description':
          'Playa El Zonte es un destino tranquilo para los amantes del surf, conocida por su ambiente relajado y sus increíbles olas. Popular entre mochileros y turistas en busca de tranquilidad.',
      'phone': 'No disponible',
      'email': 'No disponible',
      'tag': '#playa',
    },
    {
      'image': 'assets/images/playa3.jpg',
      'title': 'Playa Costa del Sol',
      'address': 'Costa del Sol, La Paz, El Salvador',
      'hours': '6:00 AM - 6:00 PM',
      'prices': 'Entrada \$3, estacionamiento \$5',
      'description':
          'Costa del Sol es una de las playas más extensas y populares de El Salvador, con resorts de lujo y una gran variedad de actividades acuáticas. Ideal para familias y turismo recreativo.',
      'phone': 'No disponible',
      'email': 'No disponible',
      'tag': '#playa',
    },
    {
      'image': 'assets/images/playa4.jpg',
      'title': 'Playa Las Flores',
      'address': 'Las Flores, San Miguel, El Salvador',
      'hours': '7:00 AM - 6:00 PM',
      'prices': 'Entrada \$2, estacionamiento \$3',
      'description':
          'Playa Las Flores es conocida por sus olas perfectas para el surf y su belleza natural. Un lugar tranquilo, ideal para surfistas avanzados y turistas que buscan relajarse.',
      'phone': 'No disponible',
      'email': 'No disponible',
      'tag': '#playa',
    },
    {
      'image': 'assets/images/playa5.jpg',
      'title': 'Playa El Cuco',
      'address': 'El Cuco, San Miguel, El Salvador',
      'hours': '8:00 AM - 5:00 PM',
      'prices': 'Entrada libre, estacionamiento \$3',
      'description':
          'Playa El Cuco es un lugar tranquilo con una amplia franja de arena y aguas cálidas, ideal para nadar y disfrutar en familia. Sus tranquilas olas son perfectas para nadadores novatos.',
      'phone': 'No disponible',
      'email': 'No disponible',
      'tag': '#playa',
    }
  ];

  List<Map<String, String>> restauranteInfo = [
    {
      'image': 'assets/images/restaurante1.jpg',
      'title': 'Hacienda Real',
      'address':
          'Kilómetro 8.5, Carretera Panamericana, frente a La Gran Vía, Antiguo Cuscatlán, Antiguo Cuscatlán, El Salvador',
      'hours': '11:30a. m. - 10:00p. m',
      'prices': '\$\$\$',
      'description': 'Tiene chimenea · Ofrece buenos cócteles',
      'phone': '2240 2900',
      'email': 'reservaciones@haciendareal.com.sv',
      'tag': '#restaurante',
    },
    {
      'image': 'assets/images/restaurante2.jpg',
      'title': 'La Pampa General escalón',
      'address': 'P.º Gral. Escalón Final, San Salvador',
      'hours': '11:30a.m.-3p.m., 6-10:30p.m',
      'prices': '\$\$',
      'description':
          'La vida es más sabrosa en Restaurantes La Pampa Te esperamos para que disfrutes de cortes de carne y mariscos de la más alta calidad a la parrilla.',
      'phone': '2263 8744',
      'email': 'lapampa.reservaciones@gmail.com',
      'tag': '#restaurante',
    },
    {
      'image': 'assets/images/restaurante3.jpg',
      'title': 'restaurante El Xolo',
      'address':
          'Avenida La Revolución Colonia San Benito Museo Nacional de Antropología MUNA',
      'hours': '6-11p.m',
      'prices': '\$\$',
      'description':
          'Un homenaje al maíz criollo y al producto local. Utilizamos ingredientes de comunidades indígenas salvadoreñas, quitando intermediarios para ejercer un impacto directo en nuestros productores, dignificando su trabajo y apoyándoles en el desarrollo de mejores prácticas agrícolas',
      'phone': '503 7932 2041',
      'email': 'info@elxolomaiz.com',
      'tag': '#restaurante',
    },
    {
      'image': 'assets/images/restaurante4.jpg',
      'title': 'Restaurante Casa Campo',
      'address':
          'Casa Campo Calle a Planes de Renderos 2, San Salvador, San Salvador, El Salvador',
      'hours': '7a.m.-10p.m',
      'prices': '\$\$',
      'description':
          'Restaurantes con platillos gourmet, típicos 🇸🇻. Pet Friendly',
      'phone': '7821 0996',
      'email': 'casacampolosplanesgourmet@gmail.com',
      'tag': '#restaurante',
    },
    {
      'image': 'assets/images/restaurante5.jpg',
      'title': 'Los ranchos',
      'address': 'Calle El Mirador, San Salvador, El Salvador',
      'hours': '12:00 p.m. - 11:00 p.m.',
      'prices': '\$\$',
      'description':
          'Este restaurante destaca por sus platillos típicos salvadoreños y carnes asadas. El ambiente rústico y sus espacios al aire libre lo hacen ideal para una comida relajada',
      'phone': '503 2250 6000',
      'email': 'info@losranchos.com.sv',
      'tag': '#restaurante',
    }
  ];

  List<Map<String, String>> volcanInfo = [
    {
      'image': 'assets/images/volcan1.jpg',
      'title': 'Volcán de Izalco',
      'address': 'Complejo Los Volcanes, Sonsonate, El Salvador',
      'hours': '8:00 AM - 4:00 PM',
      'prices': 'Entrada \$3 nacionales, \$6 extranjeros',
      'description':
          'El Volcán de Izalco es conocido como el "Faro del Pacífico" por su actividad constante en el pasado. Es uno de los volcanes más emblemáticos de El Salvador, ideal para caminatas y vistas impresionantes del paisaje.',
      'phone': 'No disponible',
      'email': 'No disponible',
      'tag': '#volcan',
    },
    {
      'image': 'assets/images/volcan2.jpg',
      'title': 'Volcán de Santa Ana (Ilamatepec)',
      'address': 'Cerro Verde, Santa Ana, El Salvador',
      'hours': '7:30 AM - 3:00 PM',
      'prices': 'Entrada \$3 nacionales, \$6 extranjeros',
      'description':
          'El Volcán de Santa Ana es el más alto de El Salvador, con una laguna verde en su cráter y vistas espectaculares hacia el Lago de Coatepeque y el Océano Pacífico. Es un lugar muy popular para senderismo.',
      'phone': 'No disponible',
      'email': 'No disponible',
      'tag': '#volcan',
    },
    {
      'image': 'assets/images/volcan3.jpg',
      'title': 'Volcán de San Miguel (Chaparrastique)',
      'address': 'San Miguel, El Salvador',
      'hours': '8:00 AM - 4:00 PM',
      'prices': 'Entrada libre',
      'description':
          'El Volcán Chaparrastique es uno de los más activos de El Salvador, y es un atractivo importante para quienes buscan aventuras más extremas. Sus erupciones han sido históricamente significativas.',
      'phone': 'No disponible',
      'email': 'No disponible',
      'tag': '#volcan',
    },
    {
      'image': 'assets/images/volcan4.jpg',
      'title': 'Volcán de San Salvador (El Boquerón)',
      'address': 'El Boquerón, San Salvador, El Salvador',
      'hours': '8:00 AM - 5:00 PM',
      'prices': 'Entrada \$2 nacionales, \$5 extranjeros',
      'description':
          'El Volcán de San Salvador, conocido como El Boquerón, ofrece senderos que te llevan a un cráter de gran tamaño. Su parque nacional es perfecto para paseos familiares y cuenta con vistas panorámicas de la ciudad.',
      'phone': 'No disponible',
      'email': 'No disponible',
      'tag': '#volcan',
    },
    {
      'image': 'assets/images/volcan5.jpg',
      'title': 'Volcán Tecapa',
      'address': 'Tecapa, Usulután, El Salvador',
      'hours': '7:00 AM - 4:30 PM',
      'prices': 'Entrada libre',
      'description':
          'El Volcán Tecapa es famoso por su impresionante cráter, que contiene la Laguna de Alegría, conocida como la "Esmeralda de América". Es un lugar ideal para los amantes del ecoturismo y la naturaleza.',
      'phone': 'No disponible',
      'email': 'No disponible',
      'tag': '#volcan',
    }
  ];

  List<Map<String, String>> conciertoInfo = [
    {
      'image': 'assets/images/concierto1.jpg',
      'title': 'Tour Ángeles Del Infierno ',
      'address':
          'Gimnasio Municipal Adolfo Pineda 4a ave sur, carretera panamericana y 6 av sur, Santa Tecla San Salvador, El Salvador',
      'hours': ' sábado 05 octubre 2024, 21:00',
      'prices': '\$\$',
      'description':
          '¡Ángeles Del Infierno en el Gimnasio Municipal Adolfo Pineda de San Salvador el sábado 5 de octubre 202,4 en punto de las 9:00PM!',
      'phone': 'No disponible',
      'email': 'No disponible',
      'tag': '#concierto',
    },
    {
      'image': 'assets/images/concierto2.jpg',
      'title': 'Carlos Sadness',
      'address':
          'MARTE, Museo de Arte de El Salvador Final Avenida La Revolución, Colonia San Benito (2.532,67 km) San Salvador, El Salvador',
      'hours': 'viernes 25 octubre 2024, 19:00',
      'prices': '\$\$',
      'description': 'Para fans de Rock.',
      'phone': 'No disponible',
      'email': 'No disponible',
      'tag': '#concierto',
    },
    {
      'image': 'assets/images/concierto3.jpg',
      'title': 'Morat',
      'address':
          'Estadio Cuscatlán Calle Antigua a Huizúcar San Salvador, El Salvador',
      'hours': 'viernes 08 noviembre 2024, 19:00',
      'prices': '\$\$',
      'description': 'Para nuestras fans de latina',
      'phone': 'No disponible',
      'email': 'No disponible',
      'tag': '#concierto',
    },
    {
      'image': 'assets/images/concierto4.jpg',
      'title': 'Aventura',
      'address':
          'Estadio Jorge Mágico González 49 Av Sur San Salvador, El Salvador',
      'hours': 'sábado 09 noviembre 2024, 19:00',
      'prices': '\$\$',
      'description': 'Para fans de Latina y Hip-Hop.',
      'phone': 'No disponible',
      'email': 'No disponible',
      'tag': '#concierto',
    },
    {
      'image': 'assets/images/concierto5.jpg',
      'title': 'Los Bukis',
      'address':
          'Estadio Jorge Mágico González 49 Av Sur San Salvador, El Salvador',
      'hours': 'Jueves 12 diciembre 2024, 19:00',
      'prices': '\$\$-\$\$\$',
      'description': 'Los bukis en El Salvador, unica presentación',
      'phone': 'No disponible',
      'email': 'No disponible',
      'tag': '#concierto',
    }
  ];

  List<Map<String, String>> seminarioInfo = [
    {
      'image': 'assets/images/seminario1.jpg',
      'title':
          'El impacto de la analítica en las empresas',
      'address': 'No disponible',
      'hours': 'viernes 20 de septiembre a las 11:00 a.m.',
      'prices': '\$\$',
      'description':
          'Te invitamos a participar en el webinar gratuito: "El impacto de la analítica en las empresas: El paso a paso de las empresas a la analítica de datos" Aprende a aplicar la inteligencia a tu negocio y usar tus datos para tomar mejores decisiones.',
      'phone': 'No disponible',
      'email': 'No disponible',
      'tag': '#seminario',
    },
    {
      'image': 'assets/images/seminario2.jpg',
      'title':
          'Fortaleciendo el crecimiento empresarial',
      'address': 'No disponible',
      'hours': 'Jueves 19 de septiembre a las 11:00 a.m.',
      'prices': '\$\$',
      'description':
          'Te invitamos a participar en el webinar gratuito: "Fortaleciendo el crecimiento empresarial: La clave del éxito en Internet, '
      'Ciberseguridad y E-commerce para medianas empresas" que tiene por objetivo, brindar insights prácticos a'
              'medianas empresas.',

    },
    {
      'image': 'assets/images/seminario3.jpg',
      'title': 'Creadores de felicidad en el servicio al cliente',
      'address': 'No disponible',
      'hours': 'Martes 10 de septiembre a las 11:00 a.m',
      'prices': '\$\$',
      'description':
          'El Comité de Servicios de Camarasal te invita a participar en el webinar gratuito: "Creadores de felicidad en el servicio al cliente" Este tiene por objetivo explorar y desarrollar habilidades y estrategias efectivas para transformar a los empleados en "Creadores de Felicidad" dentro del servicio al cliente, promoviendo una cultura organizacional. ',
      'phone': 'No disponible',
      'email': 'No disponible',
      'tag': '#seminario',
    },
    {
      'image': 'assets/images/seminario4.jpg',
      'title': 'Técnicas Innovadoras para Editar y Grabar con tu Celular',
      'address': 'No disponible',
      'hours': 'viernes 30 de agosto a las 11:00a.m',
      'prices': '\$\$',
      'description':
          'Te invitamos a participar en el webinar gratuito: "Técnicas Innovadoras para Editar y Grabar con tu Celular" que tiene por objetivo enseñar a los usuarios para que puedan producir contenidos impactantes y atractivos, optimizando el uso de herramientas y aplicaciones móviles disponibles',
      'phone': 'No disponible',
      'email': 'No disponible',
      'tag': '#seminario',
    },
    {
      'image': 'assets/images/seminario5.jpg',
      'title': 'Marca empleadora y atracción de talento',
      'address': 'No disponible',
      'hours': 'Viernes 6 de septiembre a las 11:00 a.m.',
      'prices': '\$\$',
      'description':
          'Te invitamos a participar en el webinar gratuito: "Marca empleadora y atracción de talento" y aprende sobre las herramientas, procesos y técnicas para identificar la importancia de la marca empleadora en la atracción y selección de talento',
      'phone': 'No disponible',
      'email': 'No disponible',
      'tag': '#seminario',
    },
  ];



  @override
  void initState() {
    super.initState();
    _isFavoritePlaya = List.generate(playaInfo.length, (index) => false);
    _isFavoriteRestaurante =
        List.generate(restauranteInfo.length, (index) => false);
    _isFavoriteVolcan = List.generate(volcanInfo.length, (index) => false);
    _isFavoriteConcierto =
        List.generate(conciertoInfo.length, (index) => false);
    _isFavoriteSeminario =
        List.generate(seminarioInfo.length, (index) => false);
    
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: false,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
                scrollDirection: Axis.horizontal,
              ),
              items: imageInfo.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoute.detailRoute,
                            arguments: {
                              'image': i['image'] ?? '',
                              'title': i['title'] ?? '',
                              'address': i['address'] ?? '',
                              'hours': i['hours'] ?? '',
                              'prices': i['prices'] ?? '',
                              'description': i['description'] ?? '',
                              'phone': i['phone'] ?? '',
                              'email': i['email'] ?? '',
                            });
                      },
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(i['image']!, fit: BoxFit.cover),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: GestureDetector(
                              onTap: () {
                                setState(() async {
                                  _isFavoriteBanner = !_isFavoriteBanner;
                                });
                              },
                              child: Icon(
                                _isFavoriteBanner
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: _isFavoriteBanner
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageInfo.asMap().entries.map((entry) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue
                        .withOpacity(_current == entry.key ? 1.0 : 0.4),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '  Playas',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 260,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: playaInfo.map((playa) {
                    return GestureDetector(
                      onTap: () {
                        print(playa['image']!);
                        Navigator.pushNamed(context, AppRoute.detailRoute,
                            arguments: {
                              'image': playa['image'] ?? '',
                              'title': playa['title'] ?? '',
                              'address': playa['address'] ?? '',
                              'hours': playa['hours'] ?? '',
                              'prices': playa['prices'] ?? '',
                              'description': playa['description'] ?? '',
                              'phone': playa['phone'] ?? '',
                              'email': playa['email'] ?? '',
                            });
                      },
                      child: Container(
                        width: 180,
                        height: 230,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(
                                  10), // agrega un padding de 10
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 100,
                                    child: Image.asset(playa['image'] ?? '',
                                        fit: BoxFit.cover),
                                  ),
                                  Text(
                                    playa['title'] ?? '',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 10,
                                        height: 10,
                                        margin: EdgeInsets.only(right: 5),
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Text(
                                        'Abierto',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    playa['prices'] ?? '',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() async {
                                    _isFavoritePlaya[playaInfo.indexOf(playa)] =
                                        !_isFavoritePlaya[
                                            playaInfo.indexOf(playa)];

                                    if (_isFavoritePlaya[
                                        playaInfo.indexOf(playa)]) {
                                      await _favoritosService.addFavorito(
                                          playa); // Agrega a favoritos
                                    } else {
                                      await _favoritosService.removeFavorito(
                                          playa); // Elimina de favoritos
                                    }
                                  });
                                },
                                child: Icon(
                                  _isFavoritePlaya[playaInfo.indexOf(playa)]
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color:
                                      _isFavoritePlaya[playaInfo.indexOf(playa)]
                                          ? Colors.red
                                          : Colors.grey,
                                ),
                              ),
                            ),
                            
                            Positioned(
                            bottom: 20, 
                            left: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(width: 140), 
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '  Volcanes',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 260,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: volcanInfo.map((volcan) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoute.detailRoute,
                            arguments: {
                              'image': volcan['image'] ?? '',
                              'title': volcan['title'] ?? '',
                              'address': volcan['address'] ?? '',
                              'hours': volcan['hours'] ?? '',
                              'prices': volcan['prices'] ?? '',
                              'description': volcan['description'] ?? '',
                              'phone': volcan['phone'] ?? '',
                              'email': volcan['email'] ?? '',
                            });
                      },
                      child: Container(
                        width: 180,
                        height: 230,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 100,
                                    child: Image.asset(volcan['image']!,
                                        fit: BoxFit.cover),
                                  ),
                                  Text(
                                    volcan['title']!,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 10,
                                        height: 10,
                                        margin: EdgeInsets.only(right: 5),
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Text(
                                        'Abierto',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    volcan['prices'] ?? '',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() async {
                                    _isFavoriteVolcan[
                                            volcanInfo.indexOf(volcan)] =
                                        !_isFavoriteVolcan[
                                            volcanInfo.indexOf(volcan)];
                                    if (_isFavoriteVolcan[
                                        volcanInfo.indexOf(volcan)]) {
                                      await _favoritosService.addFavorito(
                                          volcan); // Agrega a favoritos
                                    } else {
                                      await _favoritosService.removeFavorito(
                                          volcan); // Elimina de favoritos
                                    }
                                  });
                                },
                                child: Icon(
                                  _isFavoriteVolcan[volcanInfo.indexOf(volcan)]
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: _isFavoriteVolcan[
                                          volcanInfo.indexOf(volcan)]
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                              ),
                            ),
                           Positioned(
                            bottom: 20, 
                            left: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(width: 140), 
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '  Restaurantes',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 260,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: restauranteInfo.map((restaurante) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoute.detailRoute,
                            arguments: {
                              'image': restaurante['image'] ?? '',
                              'title': restaurante['title'] ?? '',
                              'address': restaurante['address'] ?? '',
                              'hours': restaurante['hours'] ?? '',
                              'prices': restaurante['prices'] ?? '',
                              'description': restaurante['description'] ?? '',
                              'phone': restaurante['phone'] ?? '',
                              'email': restaurante['email'] ?? '',
                            });
                      },
                      child: Container(
                        width: 180,
                        height: 230,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 100,
                                    child: Image.asset(restaurante['image']!,
                                        fit: BoxFit.cover),
                                  ),
                                  Text(
                                    restaurante['title']!,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 10,
                                        height: 10,
                                        margin: EdgeInsets.only(right: 5),
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Text(
                                        'Abierto',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    restaurante['prices'] ?? '',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() async {
                                    _isFavoriteRestaurante[restauranteInfo
                                            .indexOf(restaurante)] =
                                        !_isFavoriteRestaurante[restauranteInfo
                                            .indexOf(restaurante)];
                                    if (_isFavoriteRestaurante[
                                        restauranteInfo.indexOf(restaurante)]) {
                                      await _favoritosService.addFavorito(
                                          restaurante); // Agrega a favoritos
                                    } else {
                                      await _favoritosService.removeFavorito(
                                          restaurante); // Elimina de favoritos
                                    }
                                  });
                                },
                                child: Icon(
                                  _isFavoriteRestaurante[
                                          restauranteInfo.indexOf(restaurante)]
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: _isFavoriteRestaurante[
                                          restauranteInfo.indexOf(restaurante)]
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                              ),
                            ),
                            
                            Positioned(
                            bottom: 20, 
                            left: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(width: 140), 
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '  Conciertos',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 260,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: conciertoInfo.map((concierto) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoute.detailRoute,
                            arguments: {
                              'image': concierto['image'] ?? '',
                              'title': concierto['title'] ?? '',
                              'address': concierto['address'] ?? '',
                              'hours': concierto['hours'] ?? '',
                              'prices': concierto['prices'] ?? '',
                              'description': concierto['description'] ?? '',
                              'phone': concierto['phone'] ?? '',
                              'email': concierto['email'] ?? '',
                            });
                      },
                      child: Container(
                        width: 180,
                        height: 230,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 100,
                                    child: Image.asset(concierto['image']!,
                                        fit: BoxFit.cover),
                                  ),
                                  Text(
                                    concierto['title']!,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 10,
                                        height: 10,
                                        margin: EdgeInsets.only(right: 5),
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Text(
                                        'Abierto',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    concierto['prices'] ?? '',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() async {
                                    _isFavoriteConcierto[
                                            conciertoInfo.indexOf(concierto)] =
                                        !_isFavoriteConcierto[
                                            conciertoInfo.indexOf(concierto)];
                                    if (_isFavoriteConcierto[
                                        conciertoInfo.indexOf(concierto)]) {
                                      await _favoritosService.addFavorito(
                                          concierto); // Agrega a favoritos
                                    } else {
                                      await _favoritosService.removeFavorito(
                                          concierto); // Elimina de favoritos
                                    }
                                  });
                                },
                                child: Icon(
                                  _isFavoriteConcierto[
                                          conciertoInfo.indexOf(concierto)]
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: _isFavoriteConcierto[
                                          conciertoInfo.indexOf(concierto)]
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                              ),
                            ),
                            Positioned(
                            bottom: 20, 
                            left: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(width: 140), 
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '  Seminarios',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 260,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: seminarioInfo.map((seminario) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoute.detailRoute,
                            arguments: {
                              'image': seminario['image'] ?? '',
                              'title': seminario['title'] ?? '',
                              'address': seminario['address'] ?? '',
                              'hours': seminario['hours'] ?? '',
                              'prices': seminario['prices'] ?? '',
                              'description': seminario['description'] ?? '',
                              'phone': seminario['phone'] ?? '',
                              'email': seminario['email'] ?? '',
                            });
                      },
                      child: Container(
                        width: 180,
                        height: 230,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 100,
                                    child: Image.asset(seminario['image']!,
                                        fit: BoxFit.cover),
                                  ),
                                  Text(
                                    seminario['title']!,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 10,
                                        height: 10,
                                        margin: EdgeInsets.only(right: 5),
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Text(
                                        'Abierto',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    seminario['prices'] ?? '',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() async {
                                    _isFavoriteSeminario[seminarioInfo
                                            .indexOf(seminario)] =
                                        !_isFavoriteSeminario[seminarioInfo
                                            .indexOf(seminario)];
                                    if (_isFavoriteSeminario[
                                        seminarioInfo.indexOf(seminario)]) {
                                      await _favoritosService.addFavorito(
                                          seminario); // Agrega a favoritos
                                    } else {
                                      await _favoritosService.removeFavorito(
                                          seminario); // Elimina de favoritos
                                    }
                                  });
                                },
                                child: Icon(
                                  _isFavoriteSeminario[
                                          seminarioInfo.indexOf(seminario)]
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: _isFavoriteSeminario[
                                          seminarioInfo.indexOf(seminario)]
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                              ),
                            ),
                            
                            Positioned(
                            bottom: 20, 
                            left: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(width: 140), 
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
