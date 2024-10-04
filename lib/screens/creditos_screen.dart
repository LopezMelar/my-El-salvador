import 'package:flutter/material.dart';

class CreditosScreen extends StatelessWidget {
  const CreditosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Créditos'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
           
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/usam.png',
                    height: 120,
                  ),
                  const SizedBox(height: 8), 
                  const Text(
                    'Universidad Salvadoreña Alberto Masferrer',
                    style: TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.bold, 
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40), 
            const Text(
              'Creadores de la Aplicación:',
              style: TextStyle(
                fontSize: 15, 
                fontWeight: FontWeight.bold, 
              ),
            ),
          
            const CreatorTile(
              name: 'Gabriel Mejia',
              role: 'Estudiante Universitario',
              imagePath: 'assets/images/avatar1.jpeg',
            ),
            const CreatorTile(
              name: 'Ismael Lopez',
              role: 'Estudiante Universitario',
              imagePath: 'assets/images/avatar2.jpeg',
            ),
            const CreatorTile(
              name: 'Alejandro Arevalo',
              role: 'Estudiante Universitario',
              imagePath: 'assets/images/avatar3.jpeg',
            ),
            const CreatorTile(
              name: 'Meylin Zavaleta',
              role: 'Estudiante Universitario',
              imagePath: 'assets/images/avatar4.jpeg',
            ),
            const CreatorTile(
              name: 'Rigoberto Araujo',
              role: 'Estudiante Universitario',
              imagePath: 'assets/images/avatar5.jpeg',
            ),
          ],
        ),
      ),
    );
  }
}


class CreatorTile extends StatelessWidget {
  final String name;
  final String role;
  final String imagePath;

  const CreatorTile({
    super.key,
    required this.name,
    required this.role,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30, 
          backgroundImage: AssetImage(imagePath),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(role),
      ),
    );
  }
}