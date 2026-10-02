# Taller 2 - Procesos en Segundo Plano con Flutter

## Descripción

Este proyecto corresponde al segundo taller de Flutter y tiene como objetivo demostrar el uso de procesos asíncronos y tareas en segundo plano mediante `Future`, `async/await`, `Timer` e `Isolate`.

La aplicación está organizada en un menú principal desde el cual el usuario puede acceder a tres módulos:

- Consulta asíncrona con `Future` y `async/await`.
- Cronómetro utilizando `Timer`.
- Proceso pesado utilizando `Isolate`.

La finalidad es comprender cuándo utilizar cada una de estas herramientas y cómo evitar que procesos de espera o tareas pesadas bloqueen la interfaz de usuario.

---

## Objetivo

Desarrollar una aplicación Flutter que permita implementar y comprender diferentes mecanismos de asincronía y ejecución en segundo plano.

El proyecto demuestra cómo utilizar:

- `Future`
- `async`
- `await`
- `Timer`
- `Isolate`
- `SendPort`
- `ReceivePort`

También se busca mantener una interfaz fluida mientras se ejecutan operaciones asíncronas o procesos que requieren un mayor consumo de CPU.

---

## Funcionalidades implementadas

La aplicación cuenta con un menú principal que permite acceder a tres funcionalidades diferentes.

### 1. Future / async / await

En este módulo se simula una consulta de datos mediante:

```dart
Future.delayed()
```

La consulta tarda aproximadamente tres segundos.

Durante la ejecución se muestran diferentes estados:

- Sin consultar.
- Cargando.
- Éxito.
- Error.

También se incluye una opción para simular un error y comprobar el manejo de excepciones.

El proceso utiliza `async` y `await` para esperar la respuesta sin bloquear la interfaz principal de la aplicación.

---

### 2. Cronómetro con Timer

En este módulo se implementa un cronómetro mediante:

```dart
Timer.periodic()
```

El cronómetro actualiza el tiempo cada segundo.

El usuario puede realizar las siguientes acciones:

- Iniciar.
- Pausar.
- Reanudar.
- Reiniciar.

El `Timer` se cancela cuando se pausa el cronómetro y también cuando el usuario abandona la pantalla.

---

### 3. Proceso pesado con Isolate

En este módulo se ejecuta una operación que requiere un alto consumo de CPU.

La tarea consiste en realizar una suma de una gran cantidad de números.

Para evitar bloquear la interfaz principal se utiliza:

```dart
Isolate.spawn()
```

La comunicación entre el Isolate principal y el Isolate secundario se realiza mediante:

```dart
SendPort
ReceivePort
```

Al finalizar el proceso, la aplicación muestra:

- Estado del proceso.
- Resultado obtenido.
- Tiempo de ejecución.

---

# ¿Cuándo usar Future?

`Future` se utiliza cuando una operación no devuelve un resultado inmediatamente, pero se espera que lo entregue en algún momento posterior.

Se recomienda utilizar `Future` para tareas que implican espera, por ejemplo:

- Consultar información desde una API.
- Leer información desde una base de datos.
- Leer archivos.
- Esperar una respuesta de un servicio.
- Ejecutar una operación que tarda algunos segundos.

Ejemplo:

```dart
Future<String> consultarDatos() async {
  await Future.delayed(
    const Duration(seconds: 3),
  );

  return 'Datos cargados correctamente';
}
```

En este proyecto, `Future` se utiliza para simular una consulta de datos con una espera de tres segundos.

Durante este tiempo, la interfaz continúa respondiendo normalmente.

---

# ¿Cuándo usar async y await?

`async` y `await` se utilizan para trabajar con operaciones asíncronas de una manera más clara, organizada y fácil de leer.

La palabra:

```dart
async
```

indica que una función puede contener operaciones asíncronas.

La palabra:

```dart
await
```

permite esperar el resultado de un `Future` antes de continuar con la siguiente instrucción.

Ejemplo:

```dart
Future<void> ejecutarConsulta() async {
  final resultado = await consultarDatos();

  print(resultado);
}
```

Se recomienda utilizar `async` y `await` cuando:

- Se necesita esperar el resultado de un `Future`.
- Se realizan consultas a servicios externos.
- Se realizan operaciones de entrada y salida.
- Se necesita mantener un código más ordenado.
- Se desea evitar el uso excesivo de callbacks.

En este taller se utilizan para esperar la respuesta de la consulta simulada sin bloquear la interfaz.

---

# ¿Cuándo usar Timer?

`Timer` se utiliza cuando se necesita ejecutar una acción después de cierto tiempo o de forma repetitiva.

Algunos ejemplos son:

- Cronómetros.
- Contadores regresivos.
- Actualizaciones periódicas.
- Alertas temporizadas.
- Ejecución de tareas cada cierto número de segundos.

En este taller se utiliza:

```dart
Timer.periodic()
```

para aumentar el cronómetro cada segundo.

Ejemplo:

```dart
Timer.periodic(
  const Duration(seconds: 1),
  (timer) {
    segundos++;
  },
);
```

También es importante cancelar el `Timer` cuando ya no sea necesario:

```dart
timer.cancel();
```

Esto evita que el proceso continúe ejecutándose cuando el usuario ya no se encuentra en la pantalla.

---

# ¿Cuándo usar Isolate?

`Isolate` se utiliza cuando se necesita ejecutar una operación que requiere un alto consumo de CPU.

Es apropiado para tareas como:

- Cálculos matemáticos grandes.
- Procesamiento de grandes cantidades de datos.
- Transformación de archivos.
- Procesamiento de información.
- Operaciones complejas que podrían bloquear la interfaz.

Si una tarea pesada se ejecuta directamente en el Isolate principal, la aplicación puede congelarse temporalmente.

Por esta razón se utiliza:

```dart
Isolate.spawn()
```

para ejecutar el procesamiento en un Isolate separado.

En este taller se realiza una suma de una gran cantidad de números como ejemplo de una tarea CPU-bound.

---

# Diferencia entre Future e Isolate

Aunque `Future` e `Isolate` permiten trabajar con tareas que no deberían afectar la experiencia del usuario, tienen propósitos diferentes.

## Future

`Future` se utiliza principalmente para operaciones que requieren esperar un resultado.

Ejemplos:

- Consultas de red.
- Lectura de información.
- Acceso a bases de datos.
- Espera de servicios externos.

Un `Future` no significa necesariamente que la operación se esté ejecutando en otro Isolate.

---

## Isolate

`Isolate` se utiliza principalmente para tareas que requieren procesamiento intensivo de CPU.

Ejemplos:

- Cálculos matemáticos grandes.
- Procesamiento masivo de datos.
- Transformaciones complejas.
- Procesos que podrían bloquear la interfaz.

El Isolate permite ejecutar estas tareas en un espacio de ejecución separado.

---

# Pantallas de la aplicación

La aplicación se encuentra organizada en las siguientes pantallas.

## Pantalla 1 - Menú principal

Es la pantalla inicial de la aplicación.

Desde esta pantalla se puede acceder a:

1. Future / async / await.
2. Cronómetro con Timer.
3. Proceso pesado con Isolate.

---

## Pantalla 2 - Future / async / await

Esta pantalla permite realizar una consulta simulada.

Estados disponibles:

- Sin consultar.
- Cargando.
- Éxito.
- Error.

Botones disponibles:

- Consultar datos.
- Simular error.

---

## Pantalla 3 - Cronómetro con Timer

Esta pantalla muestra el tiempo transcurrido en formato:

```text
HH:MM:SS
```

Contiene los siguientes controles:

- Iniciar.
- Pausar.
- Reanudar.
- Reiniciar.

---

## Pantalla 4 - Proceso pesado con Isolate

Esta pantalla permite ejecutar un proceso intensivo de CPU.

Muestra:

- Estado del proceso.
- Resultado obtenido.
- Tiempo empleado.

También contiene el botón:

```text
Ejecutar proceso pesado
```

---

# Diagrama general de navegación

```text
                    INICIO
                      |
                      v
              +----------------+
              | Menú principal |
              +----------------+
                /      |      \
               /       |       \
              v        v        v
        +---------+ +---------+ +---------+
        | Future  | |  Timer  | | Isolate |
        +---------+ +---------+ +---------+
```

---

# Flujo del módulo Future

```text
Inicio
  |
  v
Pantalla Future
  |
  v
Presionar "Consultar datos"
  |
  v
Estado: Cargando
  |
  v
Future.delayed (3 segundos)
  |
  v
¿Operación correcta?
  |
  +-------------------+
  |                   |
  v                   v
Sí                  No
  |                   |
  v                   v
Estado: Éxito      Estado: Error
  |                   |
  v                   v
Mostrar datos      Mostrar mensaje
```

---

# Flujo del cronómetro

```text
Inicio
  |
  v
Pantalla Timer
  |
  v
Cronómetro = 00:00:00
  |
  v
Presionar "Iniciar"
  |
  v
Timer.periodic
  |
  v
Aumentar 1 segundo
  |
  v
¿Usuario pausa?
  |
  +----------------------+
  |                      |
 Sí                     No
  |                      |
  v                      |
Cancelar Timer           |
  |                      |
  v                      |
Estado: Pausado          |
  |                      |
  v                      |
¿Reanudar?               |
  |                      |
  +---- Sí --------------+
  |
  v
Crear nuevamente Timer.periodic
  |
  v
Continuar conteo
  |
  v
¿Reiniciar?
  |
 Sí
  |
  v
Cancelar Timer
  |
  v
Segundos = 0
  |
  v
00:00:00
```

---

# Flujo del proceso pesado con Isolate

```text
Inicio
  |
  v
Pantalla Isolate
  |
  v
Presionar
"Ejecutar proceso pesado"
  |
  v
Iniciar medición de tiempo
  |
  v
Crear ReceivePort
  |
  v
Isolate.spawn()
  |
  v
Ejecutar tarea pesada
  |
  v
Realizar suma de números
  |
  v
Enviar resultado mediante SendPort
  |
  v
ReceivePort recibe el resultado
  |
  v
Detener medición de tiempo
  |
  v
Mostrar:
- Resultado
- Tiempo de ejecución
- Estado finalizado
```

---

# Flujo de comunicación entre Isolates

```text
Isolate principal
      |
      | crea ReceivePort
      |
      v
Isolate.spawn()
      |
      v
Isolate secundario
      |
      | ejecuta proceso pesado
      |
      v
SendPort.send(resultado)
      |
      v
ReceivePort
      |
      v
Isolate principal
      |
      v
Actualizar interfaz
```

---

# Estructura del proyecto

```text
taller_segundo_plano/
│
├── android/
├── ios/
├── lib/
│   └── main.dart
├── linux/
├── macos/
├── test/
├── web/
├── windows/
├── pubspec.yaml
├── pubspec.lock
└── README.md
```

La lógica principal del taller se encuentra en:

```text
lib/main.dart
```

---

# Ejecución del proyecto

Para ejecutar el proyecto se debe ingresar a la carpeta:

```bash
cd taller_segundo_plano
```

Luego descargar las dependencias:

```bash
flutter pub get
```

Finalmente ejecutar:

```bash
flutter run
```

---

# GitFlow utilizado

Para el desarrollo del taller se utilizó el siguiente flujo:

```text
feature/taller_segundo_plano
            |
            v
           dev
            |
            v
           main
```

El desarrollo se realizó inicialmente en:

```text
feature/taller_segundo_plano
```

Posteriormente se realizó un Pull Request hacia:

```text
dev
```

Finalmente, los cambios fueron integrados desde:

```text
dev
```

hacia:

```text
main
```

---

# Repositorio

Repositorio del proyecto:

```text
https://github.com/yuliethtrujillo01/flutter_uceva_2026
```

Carpeta correspondiente al segundo taller:

```text
taller_segundo_plano
```

---

# Evidencias sugeridas

Para documentar el funcionamiento del proyecto se pueden incluir las siguientes evidencias.

## Future / async / await

- Pantalla antes de iniciar la consulta.
- Estado Loading.
- Estado de éxito.
- Estado de error.
- Mensajes mostrados en consola.

## Timer

- Cronómetro en estado inicial.
- Cronómetro iniciado.
- Cronómetro pausado.
- Cronómetro reanudado.
- Cronómetro reiniciado.

## Isolate

- Pantalla antes de ejecutar el proceso.
- Estado de procesamiento.
- Resultado final.
- Tiempo de ejecución.
- Mensajes mostrados en consola.

## Git

- Rama `feature/taller_segundo_plano`.
- Commit realizado.
- Pull Request hacia `dev`.
- Pull Request de `dev` hacia `main`.

---

# Conclusión

El desarrollo de este taller permitió comprender diferentes mecanismos disponibles en Flutter y Dart para ejecutar operaciones asíncronas y procesos en segundo plano.

`Future` se utiliza cuando una operación entregará un resultado posteriormente.

`async` y `await` permiten gestionar de manera ordenada la ejecución de operaciones asíncronas.

`Timer` permite ejecutar acciones periódicas y es especialmente útil para cronómetros, contadores y tareas programadas.

`Isolate` permite realizar operaciones de alto consumo de CPU sin bloquear el Isolate principal de la aplicación.

La implementación de estas herramientas permite crear aplicaciones más fluidas, eficientes y capaces de ejecutar diferentes tipos de procesos sin afectar la experiencia del usuario.

---

# Autor

**Yulieth Trujillo**

Taller desarrollado como parte de las actividades académicas de Flutter.
