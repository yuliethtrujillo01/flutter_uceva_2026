# Firebase App Distribution – Taller Flutter

## Descripción

Este proyecto corresponde al ejercicio de distribución y prueba de una aplicación Flutter mediante **Firebase App Distribution**.

El objetivo principal fue generar un APK en modo `release`, distribuirlo a un grupo de pruebas, validar su instalación en un dispositivo Android y posteriormente realizar una actualización incremental de la aplicación.

El desarrollo se realizó dentro del repositorio de la asignatura, utilizando una carpeta independiente denominada:

```text
app_distribution
```

De esta manera se conservaron sin modificaciones los talleres anteriores.

## Repositorio

Repositorio público:

```text
https://github.com/yuliethtrujillo01/flutter_uceva_2026
```

## Rama de trabajo

Para el desarrollo de este ejercicio se utilizó la rama:

```text
feature/app_distribution
```

El flujo Git utilizado fue:

```text
feature/app_distribution
        ↓
       dev
        ↓
       main
```

## Objetivo

Distribuir y probar un APK generado desde una aplicación Flutter mediante Firebase App Distribution.

El proceso incluye:

```text
Generar APK
    ↓
Firebase App Distribution
    ↓
Testers
    ↓
Instalación
    ↓
Actualización
```

## Aplicación

Nombre de la aplicación:

```text
app_distribution
```

Identificador Android:

```text
com.example.app_distribution
```

## Estructura del proyecto

```text
app_distribution/
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
└── README.md
```

## Versionado

La primera versión de la aplicación fue configurada en `pubspec.yaml` de la siguiente manera:

```yaml
version: 1.0.0+1
```

Esto corresponde a:

```text
versionName = 1.0.0
versionCode = 1
```

Posteriormente se realizó una actualización incremental:

```yaml
version: 1.0.1+2
```

Correspondiente a:

```text
versionName = 1.0.1
versionCode = 2
```

El incremento del `versionCode` permite que Android reconozca la segunda compilación como una actualización de la aplicación instalada.

## Configuración Android

El `applicationId` utilizado se encuentra en:

```text
android/app/build.gradle.kts
```

Configuración:

```kotlin
applicationId = "com.example.app_distribution"
```

Además, se verificó el permiso de Internet en:

```text
android/app/src/main/AndroidManifest.xml
```

Configuración utilizada:

```xml
<uses-permission android:name="android.permission.INTERNET"/>
```

## Generación del APK

Para generar el APK en modo release se utilizó:

```bash
flutter build apk
```

El archivo generado se encuentra en:

```text
build/app/outputs/flutter-apk/app-release.apk
```

Este APK fue utilizado para realizar la distribución mediante Firebase App Distribution.

## Firebase App Distribution

Se creó un proyecto en Firebase y se registró la aplicación Android utilizando el identificador:

```text
com.example.app_distribution
```

Posteriormente se ingresó a:

```text
Firebase Console
→ App Distribution
```

## Grupo de pruebas

Se creó el grupo:

```text
QA_Clase
```

Tester asignado:

```text
dduran@uceva.edu.co
```

El tester recibió una invitación mediante correo electrónico para acceder a la aplicación distribuida.

## Primera distribución

La primera versión distribuida fue:

```text
1.0.0+1
```

### Release Notes

```text
Versión 1.0.0

Primera versión de prueba de la aplicación Flutter distribuida mediante Firebase App Distribution.

Cambios:
- Generación inicial del APK en modo release.
- Configuración de Firebase App Distribution.
- Creación del grupo QA_Clase.
- Registro del tester.
- Validación de instalación y ejecución de la aplicación.
```

## Instalación y prueba

Después de distribuir la versión inicial:

1. El tester recibió la invitación de Firebase App Distribution.
2. Se aceptó el acceso a la aplicación.
3. Se descargó el APK.
4. Se instaló la aplicación en un dispositivo Android.
5. Se verificó que la aplicación iniciara correctamente.

Firebase permitió verificar el estado de aceptación y descarga del tester desde el panel de App Distribution.

## Actualización de la aplicación

Para validar el proceso de actualización se modificó la versión en `pubspec.yaml`.

Versión anterior:

```yaml
version: 1.0.0+1
```

Nueva versión:

```yaml
version: 1.0.1+2
```

Luego se generó nuevamente el APK:

```bash
flutter build apk
```

El nuevo APK se volvió a cargar en Firebase App Distribution.

## Segunda distribución

Versión distribuida:

```text
1.0.1+2
```

### Release Notes

```text
Versión 1.0.1

Actualización incremental de la aplicación Flutter distribuida mediante Firebase App Distribution.

Cambios:
- Incremento de versionName de 1.0.0 a 1.0.1.
- Incremento de versionCode de 1 a 2.
- Generación de un nuevo APK en modo release.
- Redistribución mediante Firebase App Distribution.
- Validación del flujo de actualización.
```

## Flujo completo de publicación

El proceso utilizado puede resumirse de la siguiente manera:

```text
1. Desarrollar aplicación Flutter
        ↓
2. Configurar versión 1.0.0+1
        ↓
3. Ejecutar flutter build apk
        ↓
4. Obtener app-release.apk
        ↓
5. Registrar aplicación en Firebase
        ↓
6. Crear grupo QA_Clase
        ↓
7. Agregar tester
        ↓
8. Subir APK a App Distribution
        ↓
9. Distribuir versión 1.0.0
        ↓
10. Tester acepta invitación
        ↓
11. Descargar e instalar aplicación
        ↓
12. Cambiar versión a 1.0.1+2
        ↓
13. Generar nuevo APK
        ↓
14. Redistribuir actualización
        ↓
15. Validar actualización
```

## Bitácora de QA

| Versión | Fecha | Cambios | Incidencias | Estado |
|---|---|---|---|---|
| 1.0.0+1 | 2 de noviembre de 2026 | Generación inicial del APK, configuración de Firebase, creación del grupo QA_Clase y distribución inicial | No se presentaron incidencias críticas | Aprobado |
| 1.0.1+2 | 2 de noviembre de 2026 | Actualización de versión, generación de nuevo APK y redistribución | No se identificaron errores críticos | Aprobado |


## Tecnologías utilizadas

- Flutter.
- Dart.
- Android.
- Firebase.
- Firebase App Distribution.
- Git.
- GitHub.
- PowerShell.

## Resultado

El proceso de distribución se realizó correctamente.

La versión inicial `1.0.0+1` fue publicada y distribuida a través de Firebase App Distribution. Posteriormente se realizó una actualización incremental a la versión `1.0.1+2`.

Se verificó el flujo de:

```text
Generación
→ Distribución
→ Invitación
→ Instalación
→ Ejecución
→ Actualización
```

## Conclusión

Firebase App Distribution permitió realizar una distribución controlada del APK a testers específicos antes de una publicación definitiva.

El ejercicio permitió comprender el proceso de generación de builds en modo release, control de versiones, gestión de testers, distribución de APK y actualización incremental de una aplicación Flutter.

También se aplicó un flujo de trabajo basado en GitFlow para mantener organizada la integración de los cambios mediante las ramas `feature`, `dev` y `main`.
