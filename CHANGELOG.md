# Changelog

## v1.0.0 — 2026-10-04

Primera versión estable.

### Incluye

- Left Command como modificador estilo macOS.
- Right Command preservado como Windows key nativa.
- Traducción de Command a Ctrl para atajos habituales.
- Navegación de texto con Command y Option.
- Selección de texto con Shift.
- Borrado por palabra y hasta inicio de línea.
- Cmd + Q para cerrar.
- Cmd + M para minimizar.
- Navegación de pestañas.
- Atrás/adelante.
- Capturas con Cmd + Shift + 3/4/5.
- Option + Tab preservado como Alt + Tab nativo.

### Arquitectura

Left Command se bloquea para Windows y se consulta mediante estado físico con `GetKeyState("LWin", "P")`. Esto evita ejecutar simultáneamente el atajo traducido y el atajo nativo de Windows.
