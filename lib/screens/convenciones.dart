class Event {
  final String name;
  final String date;
  final String price;
  final String link;
  final String about;
  final List<String> imageUrls;

  Event({
    required this.name,
    required this.date,
    required this.price,
    required this.link,
    required this.about,
    required this.imageUrls,
  });
}

class Convention {
  final int id;
  final String type;
  final String name;
  final double latitude;
  final double longitude;
  final List<Event> events; // Lista de eventos en el lugar

  Convention({
    required this.id,
    required this.type,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.events, // Se pasa la lista de eventos
  });
}

// Ejemplo de Convención con varios eventos
final List<Convention> conventions = [
  Convention(
    id: 1,
    type: 'stadium',
    name: 'Estadio Cuscatlán',
    latitude: 13.681133612358213,
    longitude: -89.22237450648515,
    events: [
      Event(
        name: 'MORAT',
        date: '26 oct 2024',
        price: 'Consulte Taquilla',
        link:
            'https://www.bandsintown.com/es/a/11910418-morat?came_from=253&utm_medium=web&utm_source=artist_event_page&utm_campaign=artist',
        about: 'Concierto de pop con artistas famosos.',
        imageUrls: ['assets/images/Morat.jpg'],
      ),
      Event(
        name: 'Humbe',
        date: '2 nov 2024',
        price: 'Consulte Taquilla',
        link:
            'https://www.bandsintown.com/es/e/105930834-humbe-at-besport?came_from=253&utm_medium=web&utm_source=city_page&utm_campaign=top_event',
        about: 'Humbe',
        imageUrls: ['assets/images/humbe.jpg'],
      ),
      Event(
        name: 'Reik',
        date: '16 nov 2024',
        price: 'Consulte Taquilla',
        link:
            'https://www.bandsintown.com/es/e/105811285-reik-at-complejo-deportivo-cuscatlan?came_from=253&utm_medium=web&utm_source=city_page&utm_campaign=top_event',
        about: 'Reik',
        imageUrls: ['assets/images/reik.jpg'],
      ),
      Event(
        name: 'Greeicy - Yeliana World Tour',
        date: '7 dic 2024',
        price: 'Consulte Taquilla',
        link:
            'https://www.bandsintown.com/es/a/15514642-greeicy?came_from=253&utm_medium=web&utm_source=artist_event_page&utm_campaign=artist',
        about: 'Yeliana World Tour',
        imageUrls: ['assets/images/greeicy.jpg'],
      ),
    ],
  ),
  Convention(
    id: 1,
    type: 'stadium',
    name: 'Estadio Cuscatlán',
    latitude: 13.688230986611293,
    longitude: -89.23207145904216,
    events: [
      Event(
        name: 'MORAT',
        date: '26 oct 2024',
        price: 'Consulte Taquilla',
        link:
            'https://www.bandsintown.com/es/a/11910418-morat?came_from=253&utm_medium=web&utm_source=artist_event_page&utm_campaign=artist',
        about: 'Concierto de pop con artistas famosos.',
        imageUrls: ['assets/images/Morat.jpg'],
      ),
      Event(
        name: 'Humbe',
        date: '2 nov 2024',
        price: 'Consulte Taquilla',
        link:
            'https://www.bandsintown.com/es/e/105930834-humbe-at-besport?came_from=253&utm_medium=web&utm_source=city_page&utm_campaign=top_event',
        about: 'Humbe',
        imageUrls: ['assets/images/humbe.jpg'],
      ),
      Event(
        name: 'Reik',
        date: '16 nov 2024',
        price: 'Consulte Taquilla',
        link:
            'https://www.bandsintown.com/es/e/105811285-reik-at-complejo-deportivo-cuscatlan?came_from=253&utm_medium=web&utm_source=city_page&utm_campaign=top_event',
        about: 'Reik',
        imageUrls: ['assets/images/reik.jpg'],
      ),
      Event(
        name: 'Greeicy - Yeliana World Tour',
        date: '7 dic 2024',
        price: 'Consulte Taquilla',
        link:
            'https://www.bandsintown.com/es/a/15514642-greeicy?came_from=253&utm_medium=web&utm_source=artist_event_page&utm_campaign=artist',
        about: 'Yeliana World Tour',
        imageUrls: ['assets/images/greeicy.jpg'],
      ),
    ],
  ),
];
