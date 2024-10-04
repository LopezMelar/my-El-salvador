import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String image;
  final String title;
  final String address;
  final String hours;
  final String prices;
  final String description;
  final String phone;
  final String email;

  DetailScreen({
    required this.image,
    required this.title,
    required this.address,
    required this.hours,
    required this.prices,
    required this.description,
    required this.phone,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Image.asset(image),
          ListTile(
            title: Text(title),
            subtitle: Text(address),
          ),
          ListTile(
            title: Text('Horario'),
            subtitle: Text(hours),
          ),
          ListTile(
            title: Text('Precios'),
            subtitle: Text(prices),
          ),
          ListTile(
            title: Text('Descripción'),
            subtitle: Text(description),
          ),
          ListTile(
            title: Text('Teléfono'),
            subtitle: Text(phone),
          ),
          ListTile(
            title: Text('Correo electrónico'),
            subtitle: Text(email),
          ),
        ],
      ),
    );
  }
}