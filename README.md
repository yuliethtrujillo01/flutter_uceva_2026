# Taller 1 - Flutter: StatefulWidget y setState()

## Descripción

Este proyecto corresponde al **Taller 1 de Flutter**, desarrollado con el propósito de comprender el funcionamiento de los widgets con estado mediante `StatefulWidget` y el uso del método `setState()`.

La aplicación permite modificar dinámicamente el título del `AppBar` entre **"Hola, Flutter"** y **"¡Título cambiado!"** al presionar un botón. Después de realizar el cambio se muestra un `SnackBar` con el mensaje **"Título actualizado"**.

Además, se implementaron imágenes locales y desde Internet, junto con widgets adicionales como `Container` y `ListView`.

---

## Objetivo

Construir una pantalla básica en Flutter utilizando `StatefulWidget` y evidenciar el funcionamiento de `setState()` para actualizar dinámicamente elementos de la interfaz.

También se aplicó un flujo de trabajo con Git y GitHub mediante las ramas:

- `main`
- `dev`
- `feature/taller1`

---

## Datos del estudiante

**Nombre:** Yulieth Yahaira Trujillo Rivera  
**Código:** 230232015  
**Asignatura:** Electiva Profesional  
**Taller:** Taller 1 - StatefulWidget y setState()

---

## Funcionalidades desarrolladas

La aplicación cuenta con las siguientes funcionalidades:

- AppBar con título inicial **"Hola, Flutter"**.
- Visualización del nombre del estudiante.
- Imagen cargada desde Internet mediante `Image.network()`.
- Imagen local cargada mediante `Image.asset()`.
- Botón para modificar el título de la aplicación.
- Uso de `setState()` para actualizar la interfaz.
- Alternancia del título entre:
  - `Hola, Flutter`
  - `¡Título cambiado!`
- Visualización de un `SnackBar` con el mensaje:
  - `Título actualizado`
- Implementación de widgets adicionales.
- Organización de la interfaz mediante `Column`, `Row`, `Padding` y `SizedBox`.

---


## Estructura del proyecto

La estructura principal utilizada en el proyecto es:

```text
taller1_flutter/
│
├── android/
├── assets/
│   └── images/
│       └── flutter.png
│
├── evidencias/
│   ├── estado_inicial.png
│   ├── titulo_cambiado.png
│   ├── snackbar.png
│   ├── widgets_adicionales.png
│   ├── ramas_git.png
│   ├── pr_feature_dev.png
│   └── pr_dev_main.png
│
├── ios/
├── lib/
│   └── main.dart
│
├── test/
├── web/
├── windows/
├── pubspec.yaml
└── README.md
```

---


# Conclusión

El desarrollo del Taller 1 permitió aplicar los conceptos básicos de manejo de estado en Flutter mediante `StatefulWidget` y `setState()`.

Se logró actualizar dinámicamente el título de la aplicación, utilizar imágenes locales y desde Internet, implementar diferentes widgets para organizar la interfaz y mostrar mensajes mediante `SnackBar`.

Adicionalmente, se aplicó un flujo de control de versiones utilizando Git y GitHub, trabajando con las ramas `main`, `dev` y `feature/taller1`, e integrando los cambios mediante Pull Requests.

