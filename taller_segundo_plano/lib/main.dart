import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// =============================================================
// APLICACIÓN PRINCIPAL
// =============================================================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Procesos en Segundo Plano',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const MenuPrincipal(),
    );
  }
}

// =============================================================
// MENÚ PRINCIPAL
// =============================================================

class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Procesos en Segundo Plano',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 15),

              const Icon(
                Icons.developer_mode,
                size: 70,
                color: Colors.deepPurple,
              ),

              const SizedBox(height: 15),

              const Text(
                'Taller Flutter',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                'Asincronía, Timer e Isolate',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 35),

              _TarjetaMenu(
                icono: Icons.cloud_download_outlined,
                titulo: 'Future / async / await',
                descripcion:
                    'Consulta simulada con estados Cargando, Éxito y Error.',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FuturePage(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 18),

              _TarjetaMenu(
                icono: Icons.timer_outlined,
                titulo: 'Cronómetro con Timer',
                descripcion:
                    'Iniciar, pausar, reanudar y reiniciar el tiempo.',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TimerPage(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 18),

              _TarjetaMenu(
                icono: Icons.memory_outlined,
                titulo: 'Proceso pesado con Isolate',
                descripcion:
                    'Ejecuta una tarea intensiva sin bloquear la interfaz.',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const IsolatePage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =============================================================
// TARJETA DEL MENÚ
// =============================================================

class _TarjetaMenu extends StatelessWidget {
  final IconData icono;
  final String titulo;
  final String descripcion;
  final VoidCallback onTap;

  const _TarjetaMenu({
    required this.icono,
    required this.titulo,
    required this.descripcion,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  icono,
                  size: 38,
                  color: Colors.deepPurple,
                ),
              ),

              const SizedBox(width: 18),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titulo,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      descripcion,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =============================================================
// 1. FUTURE / ASYNC / AWAIT
// =============================================================

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String estado = 'Sin consultar';

  String resultado = 'Presiona uno de los botones para iniciar.';

  bool cargando = false;

  Future<String> consultarDatos({
    bool provocarError = false,
  }) async {
    print('Consultando datos...');

    await Future.delayed(
      const Duration(seconds: 3),
    );

    if (provocarError) {
      throw Exception(
        'Error simulado al consultar los datos',
      );
    }

    return 'Datos cargados correctamente';
  }

  Future<void> ejecutarConsulta({
    bool provocarError = false,
  }) async {
    setState(() {
      cargando = true;
      estado = 'Cargando...';
      resultado = 'Esperando respuesta del servicio';
    });

    print('Iniciando consulta...');

    try {
      final respuesta = await consultarDatos(
        provocarError: provocarError,
      );

      if (!mounted) return;

      setState(() {
        cargando = false;
        estado = 'Éxito';
        resultado = respuesta;
      });

      print('Consulta completada correctamente.');
    } catch (e) {
      if (!mounted) return;

      setState(() {
        cargando = false;
        estado = 'Error';
        resultado = 'No fue posible consultar los datos.';
      });

      print('Error al consultar los datos.');
    }
  }

  Color obtenerColorEstado() {
    if (estado == 'Éxito') {
      return Colors.green;
    }

    if (estado == 'Error') {
      return Colors.red;
    }

    if (estado == 'Cargando...') {
      return Colors.orange;
    }

    return Colors.grey;
  }

  IconData obtenerIconoEstado() {
    if (estado == 'Éxito') {
      return Icons.check_circle;
    }

    if (estado == 'Error') {
      return Icons.error;
    }

    if (estado == 'Cargando...') {
      return Icons.hourglass_top;
    }

    return Icons.info_outline;
  }

  @override
  Widget build(BuildContext context) {
    final colorEstado = obtenerColorEstado();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Future / async / await',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Consulta asíncrona',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Se simula una consulta de datos utilizando '
                'Future.delayed durante 3 segundos.',
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Icon(
                        obtenerIconoEstado(),
                        size: 65,
                        color: colorEstado,
                      ),

                      const SizedBox(height: 15),

                      Text(
                        estado,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: colorEstado,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        resultado,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 20),

                      if (cargando)
                        const CircularProgressIndicator(),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              ElevatedButton.icon(
                onPressed: cargando
                    ? null
                    : () {
                        ejecutarConsulta();
                      },
                icon: const Icon(
                  Icons.cloud_download,
                ),
                label: const Text(
                  'Consultar datos',
                ),
              ),

              const SizedBox(height: 12),

              OutlinedButton.icon(
                onPressed: cargando
                    ? null
                    : () {
                        ejecutarConsulta(
                          provocarError: true,
                        );
                      },
                icon: const Icon(
                  Icons.error_outline,
                ),
                label: const Text(
                  'Simular error',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =============================================================
// 2. TIMER
// =============================================================

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  Timer? _timer;

  int segundos = 0;

  bool iniciado = false;

  bool pausado = false;

  void iniciar() {
    _timer?.cancel();

    setState(() {
      iniciado = true;
      pausado = false;
    });

    print('Cronómetro iniciado');

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          segundos++;
        });
      },
    );
  }

  void pausar() {
    if (!iniciado || pausado) {
      return;
    }

    _timer?.cancel();

    setState(() {
      pausado = true;
    });

    print('Cronómetro pausado');
  }

  void reanudar() {
    if (!iniciado || !pausado) {
      return;
    }

    setState(() {
      pausado = false;
    });

    print('Cronómetro reanudado');

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          segundos++;
        });
      },
    );
  }

  void reiniciar() {
    _timer?.cancel();

    setState(() {
      segundos = 0;
      iniciado = false;
      pausado = false;
    });

    print('Cronómetro reiniciado');
  }

  String obtenerTiempo() {
    final horas = segundos ~/ 3600;

    final minutos = (segundos % 3600) ~/ 60;

    final segundosRestantes = segundos % 60;

    return '${horas.toString().padLeft(2, '0')}:'
        '${minutos.toString().padLeft(2, '0')}:'
        '${segundosRestantes.toString().padLeft(2, '0')}';
  }

  String obtenerEstado() {
    if (!iniciado) {
      return 'Detenido';
    }

    if (pausado) {
      return 'Pausado';
    }

    return 'En ejecución';
  }

  @override
  void dispose() {
    print('Timer cancelado al salir de la vista');

    _timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cronómetro con Timer',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 30),

            const Icon(
              Icons.timer_outlined,
              size: 70,
              color: Colors.deepPurple,
            ),

            const SizedBox(height: 25),

            Text(
              obtenerTiempo(),
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              obtenerEstado(),
              style: TextStyle(
                fontSize: 18,
                color: pausado
                    ? Colors.orange
                    : iniciado
                        ? Colors.green
                        : Colors.grey,
              ),
            ),

            const SizedBox(height: 40),

            Wrap(
              alignment: WrapAlignment.center,
              spacing: 12,
              runSpacing: 12,
              children: [
                ElevatedButton.icon(
                  onPressed:
                      iniciado ? null : iniciar,
                  icon: const Icon(
                    Icons.play_arrow,
                  ),
                  label: const Text(
                    'Iniciar',
                  ),
                ),

                ElevatedButton.icon(
                  onPressed:
                      iniciado && !pausado
                          ? pausar
                          : null,
                  icon: const Icon(
                    Icons.pause,
                  ),
                  label: const Text(
                    'Pausar',
                  ),
                ),

                ElevatedButton.icon(
                  onPressed:
                      iniciado && pausado
                          ? reanudar
                          : null,
                  icon: const Icon(
                    Icons.play_circle_outline,
                  ),
                  label: const Text(
                    'Reanudar',
                  ),
                ),

                OutlinedButton.icon(
                  onPressed: reiniciar,
                  icon: const Icon(
                    Icons.restart_alt,
                  ),
                  label: const Text(
                    'Reiniciar',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// =============================================================
// 3. ISOLATE
// =============================================================

class IsolatePage extends StatefulWidget {
  const IsolatePage({super.key});

  @override
  State<IsolatePage> createState() => _IsolatePageState();
}

class _IsolatePageState extends State<IsolatePage> {
  bool procesando = false;

  String estado = 'Sin ejecutar';

  String resultado = '-';

  int tiempoMs = 0;

  Future<void> ejecutarProceso() async {
    setState(() {
      procesando = true;
      estado = 'Procesando...';
      resultado = '-';
      tiempoMs = 0;
    });

    print('Iniciando proceso pesado...');

    final stopwatch = Stopwatch()
      ..start();

    final receivePort = ReceivePort();

    await Isolate.spawn(
      tareaPesada,
      receivePort.sendPort,
    );

    final resultadoRecibido =
        await receivePort.first;

    stopwatch.stop();

    receivePort.close();

    print('Proceso pesado finalizado.');

    print(
      'Tiempo total: ${stopwatch.elapsedMilliseconds} ms',
    );

    if (!mounted) return;

    setState(() {
      procesando = false;
      estado = 'Proceso finalizado';

      resultado =
          resultadoRecibido.toString();

      tiempoMs =
          stopwatch.elapsedMilliseconds;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Proceso pesado con Isolate',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),

              const Icon(
                Icons.memory,
                size: 75,
                color: Colors.deepPurple,
              ),

              const SizedBox(height: 15),

              const Text(
                'Tarea CPU-bound',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'La suma se ejecuta en un Isolate para '
                'evitar bloquear la interfaz principal.',
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      if (procesando)
                        const CircularProgressIndicator(),

                      if (procesando)
                        const SizedBox(height: 20),

                      Text(
                        estado,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        'Resultado:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        resultado,
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        'Tiempo de ejecución:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        '$tiempoMs ms',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              ElevatedButton.icon(
                onPressed:
                    procesando ? null : ejecutarProceso,
                icon: const Icon(
                  Icons.memory,
                ),
                label: const Text(
                  'Ejecutar proceso pesado',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =============================================================
// FUNCIÓN PESADA
// =============================================================

void tareaPesada(
  SendPort sendPort,
) {
  print('Isolate iniciado');

  int suma = 0;

  for (int i = 0; i < 100000000; i++) {
    suma += i;
  }

  print('Isolate terminado');

  sendPort.send(suma);
}