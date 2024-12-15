import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navegación con Tabs',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: TabsScreen(),
    );
  }
}

class TabsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Número de pestañas
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Navegación con Tabs', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Poppins')), 
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.pink.shade200,
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Inicio'),
              Tab(icon: Icon(Icons.article), text: 'Noticias'),
              Tab(icon: Icon(Icons.person), text: 'Perfil'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Contenido de Inicio', style: TextStyle(fontSize: 24))),
            Center(child: Text('Contenido de Noticias', style: TextStyle(fontSize: 24))),
            Center(child: Text('Contenido de Perfil', style: TextStyle(fontSize: 24))),
          ],
        ),
      ),
    );
  }
}