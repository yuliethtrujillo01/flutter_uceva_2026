# Taller 2 - Procesos en Segundo Plano con Flutter

## Descripción

Este proyecto corresponde al segundo taller de Flutter y tiene como objetivo demostrar el manejo de procesos asíncronos y tareas en segundo plano mediante el uso de:

- `Future`
- `async` / `await`
- `Timer`
- `Isolate`

La aplicación permite visualizar de forma práctica cómo ejecutar tareas sin bloquear la interfaz de usuario, controlar un cronómetro y realizar un proceso pesado utilizando un Isolate.

---

## Objetivo

Desarrollar una aplicación Flutter que implemente diferentes mecanismos para el manejo de tareas asíncronas y procesos en segundo plano, garantizando que la interfaz continúe respondiendo correctamente durante la ejecución de dichas tareas.

---

## Funcionalidades implementadas

La aplicación cuenta con un menú principal desde el cual se puede acceder a tres módulos:

### 1. Future / async / await

En este módulo se simula una consulta de datos mediante:

```dart
Future.delayed()
