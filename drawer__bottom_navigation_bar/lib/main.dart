import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Navegacion Flutter',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override 
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Indice actual del BottomNavigationBar
  
  // Lista de pantallas para las secciones del BottomNavigationBar
  final List<Widget> _screens = [
    Center(child: Text('Inicio', style: TextStyle(fontSize: 24))),
    Center(child: Text('Noticias', style: TextStyle(fontSize: 24))),
    Center(child: Text('Perfil', style: TextStyle(fontSize: 24))),
  ];

  // Método para actualizar la pantalla activa
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplicación de Noticias'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child:Text('Menú', style: TextStyle(color: Colors.white, fontSize: 24))
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _currentIndex = 0;
                });
              }
            ),
            ListTile(
              leading: Icon(Icons.article),
              title: Text('Noticias'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _currentIndex = 1;
                });
              }
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Perfil'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _currentIndex = 2;
                });
              }
            )
          ],
        ),
      ),
      body: _screens[_currentIndex], // Muestra la panatlla activa
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Noticias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          )
        ],
        currentIndex: _currentIndex, // Indice seleccionado
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped, // Método al hacer click
      )
    );
  }

}