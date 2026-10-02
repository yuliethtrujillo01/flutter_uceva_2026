import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taller 1 Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String titulo = 'Hola, Flutter';

  bool tituloCambiado = false;

  void cambiarTitulo() {
    setState(() {
      tituloCambiado = !tituloCambiado;

      if (tituloCambiado) {
        titulo = '¡Título cambiado!';
      } else {
        titulo = 'Hola, Flutter';
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Título actualizado'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
  
              const Text(
                'Yulieth Yahaira Trujillo Rivera',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Taller 1 - Introducción a Flutter',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 25),

              // IMÁGENES
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Imagen desde Internet
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          'Image.network()',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Image.network(
                          'https://tse1.mm.bing.net/th/id/OIP._hpQbfHcPyZilPFxrbRfzQAAAA?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 15),

                  // Imagen local
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          'Image.asset()',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Image.asset(
                          'assets/images/flutter.png',
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // BOTÓN QUE UTILIZA SETSTATE
              ElevatedButton.icon(
                onPressed: cambiarTitulo,
                icon: const Icon(Icons.change_circle),
                label: const Text(
                  'Cambiar título',
                ),
              ),

              const SizedBox(height: 30),

              /*
              WIDGET ADICIONAL 1
              CONTAINER
              */
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.deepPurple,
                    width: 2,
                  ),
                ),
                child: const Column(
                  children: [
                    Icon(
                      Icons.flutter_dash,
                      size: 50,
                      color: Colors.deepPurple,
                    ),

                    SizedBox(height: 10),

                    Text(
                      'Widget adicional: Container',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      'Este Container utiliza color, bordes, márgenes internos y bordes redondeados.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /*
              WIDGET ADICIONAL 2
              LISTVIEW
              */

              const Text(
                'Widgets utilizados',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  ListTile(
                    leading: Icon(
                      Icons.widgets,
                      color: Colors.deepPurple,
                    ),
                    title: Text('StatefulWidget'),
                    subtitle: Text(
                      'Permite manejar estados que pueden cambiar.',
                    ),
                  ),

                  ListTile(
                    leading: Icon(
                      Icons.refresh,
                      color: Colors.deepPurple,
                    ),
                    title: Text('setState()'),
                    subtitle: Text(
                      'Actualiza el estado y reconstruye la interfaz.',
                    ),
                  ),

                  ListTile(
                    leading: Icon(
                      Icons.image,
                      color: Colors.deepPurple,
                    ),
                    title: Text('Image'),
                    subtitle: Text(
                      'Permite visualizar imágenes locales y de Internet.',
                    ),
                  ),

                  ListTile(
                    leading: Icon(
                      Icons.view_list,
                      color: Colors.deepPurple,
                    ),
                    title: Text('ListView'),
                    subtitle: Text(
                      'Permite organizar elementos en forma de lista.',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // BOTÓN ADICIONAL
              OutlinedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        '¡Bienvenido a mi primera aplicación Flutter!',
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Mostrar mensaje',
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}