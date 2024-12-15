import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestión Médica',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {"icon": Icons.calendar_today, "title": "Citas Médicas", "route": CitasMedicasScreen()},
    {"icon": Icons.local_hospital, "title": "Urgencias"},
    {"icon": Icons.person_search, "title": "Especialistas"},
    {"icon": Icons.local_pharmacy, "title": "Farmacia"},
    {"icon": Icons.people, "title": "Pacientes"},
    {"icon": Icons.healing, "title": "Terapias"},
    {"icon": Icons.science, "title": "Laboratorio"},
    {"icon": Icons.bloodtype, "title": "Sangre"},
    {"icon": Icons.accessible, "title": "Rehabilitación"},
    {"icon": Icons.chat, "title": "Consultas"},
    {"icon": Icons.insert_drive_file, "title": "Informes"},
    {"icon": Icons.event, "title": "Calendario"},
    {"icon": Icons.payments, "title": "Pagos"},
    {"icon": Icons.contact_phone, "title": "Contactos"},
    {"icon": Icons.info, "title": "Información"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Menú Hospital', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Número de columnas
            crossAxisSpacing: 10, // Espaciado entre columnas
            mainAxisSpacing: 10, // Espaciado entre filas
          ),
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            final item = menuItems[index];
            return GestureDetector(
              onTap: () {
                if (item["route"] != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => item["route"]),
                  );
                }
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item["icon"], size: 50, color: Colors.orange),
                    SizedBox(height: 10),
                    Text(
                      item["title"],
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CitasMedicasScreen extends StatelessWidget {
  final List<Map<String, dynamic>> specialties = [
    {"icon": Icons.local_hospital, "title": "Medicina General"},
    {"icon": Icons.mood, "title": "Odontología"},
    {"icon": Icons.psychology, "title": "Psicología"},
    {"icon": Icons.favorite, "title": "Cardiología"},
    {"icon": Icons.healing, "title": "Neurología"},
    {"icon": Icons.female, "title": "Ginecología"},
    {"icon": Icons.spa, "title": "Dermatología"},
    {"icon": Icons.child_care, "title": "Pediatría"},
    {"icon": Icons.visibility, "title": "Oftalmología"},
    {"icon": Icons.accessibility, "title": "Ortopedia"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Citas Médicas' , style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      body: ListView.builder(
        itemCount: specialties.length,
        itemBuilder: (context, index) {
          final item = specialties[index];
          return ListTile(
            leading: Icon(item["icon"], size: 30, color: Colors.orange),
            title: Text(item["title"], style: TextStyle(fontSize: 16)),
            onTap: () {
              // Aquí podrías agregar navegación adicional si cada especialidad tiene su propia pantalla.
            },
          );
        },
      ),
    );
  }
}
