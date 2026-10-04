# Mac Keyboard for Windows

Usa un teclado Apple en Windows con una lógica de atajos mucho más parecida a macOS, sin hacer un remapeo destructivo de `Win` y `Ctrl` a nivel del registro.

El script está hecho para **AutoHotkey v2**.

## Idea principal

La configuración separa los dos Command del teclado:

| Tecla física | Comportamiento |
|---|---|
| Left Command ⌘ | Command estilo macOS |
| Right Command ⌘ | Windows key nativa |
| Option ⌥ | Alt nativo |
| Control ⌃ | Ctrl nativo |

Esto permite usar los atajos habituales de macOS con la mano izquierda y, al mismo tiempo, conservar una tecla Windows real para Inicio, `Win + R`, `Win + L`, Game Bar, etc.

## Por qué no usar SharpKeys

Un intercambio global como `Win → Ctrl` funciona para algunos atajos, pero también cambia el comportamiento del sistema completo.

Por ejemplo:

- `Win + G` abre Game Bar.
- `Win + D` muestra el escritorio.
- `Win + R` abre Ejecutar.
- `Win + L` bloquea Windows.

La primera versión de este proyecto confirmó además que simplemente interceptar `Win + G` podía provocar que **se ejecutaran dos acciones al mismo tiempo**: `Ctrl + G` dentro de la aplicación y `Win + G` en Windows.

La solución actual evita eso:

1. Left Command se bloquea para que Windows no lo reciba como `Win`.
2. AutoHotkey consulta su **estado físico** con `GetKeyState("LWin", "P")`.
3. Mientras Left Command esté físicamente presionado, el script traduce la siguiente tecla.
4. Right Command queda intacto como Windows key real.

## Atajos principales

| Atajo Apple | Resultado en Windows |
|---|---|
| ⌘ C | Ctrl + C |
| ⌘ V | Ctrl + V |
| ⌘ X | Ctrl + X |
| ⌘ Z | Ctrl + Z |
| ⌘ Shift Z | Ctrl + Y |
| ⌘ S | Ctrl + S |
| ⌘ F | Ctrl + F |
| ⌘ T | Ctrl + T |
| ⌘ W | Ctrl + W |
| ⌘ Q | Alt + F4 |
| ⌘ M | Minimizar ventana |
| ⌘ ← / → | Inicio / fin de línea |
| ⌘ ↑ / ↓ | Inicio / fin de documento |
| ⌘ Shift + flechas | Selección estilo macOS |
| ⌥ ← / → | Moverse palabra por palabra |
| ⌥ Shift + ← / → | Seleccionar palabra por palabra |
| ⌥ Backspace | Borrar palabra anterior |
| ⌘ Backspace | Borrar hasta inicio de línea |
| ⌘ Shift 3 | Captura de pantalla completa |
| ⌘ Shift 4 | Selección de área |
| ⌘ Shift 5 | Abrir Snipping Tool |
| ⌥ Tab | Alt + Tab nativo |

También se traducen muchos `Command + letra` y `Command + Shift + letra` a sus equivalentes con Ctrl para que funcionen en aplicaciones que definan atajos propios.

## Windows sigue disponible

Right Command no se modifica.

Por ejemplo:

- Right Command solo → menú Inicio.
- Right Command + R → Ejecutar.
- Right Command + L → bloquear Windows.
- Right Command + G → Xbox Game Bar.
- Right Command + D → mostrar escritorio.

## Instalación

1. Instala [AutoHotkey v2](https://www.autohotkey.com/).
2. Descarga `MacKeyboard.ahk` de este repositorio.
3. Haz doble clic en el archivo.
4. Debería aparecer el icono de AutoHotkey en la bandeja del sistema.

Para recargar cambios:

- clic derecho sobre el icono de AutoHotkey;
- selecciona **Reload Script**.

## Inicio automático con Windows

Puedes colocar un acceso directo de `MacKeyboard.ahk` en:

```text
shell:startup
```

Para abrir esa carpeta:

1. Presiona `Win + R`.
2. Escribe `shell:startup`.
3. Pulsa Enter.

## Requisitos

- Windows 10 u 11.
- AutoHotkey v2.
- Teclado Apple cuya tecla Command izquierda sea detectada por Windows como `LWin`.

## Compatibilidad

La versión 1.0 se validó manualmente con operaciones de edición de texto, atajos de aplicación, navegación de texto, capturas y accesos nativos de Windows.

Dependiendo de la aplicación, algunos atajos pueden tener semánticas propias.

## Limitaciones actuales

Todavía no se implementan como comportamiento especial:

- `⌘ + \`` para recorrer ventanas de la misma aplicación.
- `⌘ + Space` como equivalente de Spotlight.
- `⌘ + H` como equivalente real de “ocultar aplicación”.
- Caracteres especiales de Option según layout/idioma.

## Seguridad y recuperación

Si un atajo deja de responder como esperas:

1. Busca el icono de AutoHotkey en la bandeja.
2. Clic derecho.
3. Selecciona **Exit**.

El teclado volverá inmediatamente a su comportamiento normal de Windows.

## Licencia

MIT. Consulta [LICENSE](LICENSE).
