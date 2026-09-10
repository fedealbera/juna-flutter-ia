# Repository Rules: Event Platform V3

## 1. Metodología Obligatoria: SDD (Spec-Driven Development)

En este repositorio **SIEMPRE Y DE FORMA OBLIGATORIA** se trabaja bajo la metodología **SDD** para **CUALQUIER** tarea (nuevas features, cambios de UI, corrección de bugs, refactors o ajustes de endpoints), sin necesidad de que el usuario lo solicite explícitamente.

---

## 2. Ciclo de Vida Obligatorio por Tarea

Para toda petición del usuario, el asistente debe ejecutar estrictamente este ciclo:

1. **Fase 1: Research & Planificación (Plan)**
   - Investigar el código existente sin modificar archivos de código fuente.
   - Crear el artefacto `implementation_plan.md` con el diseño técnico, archivos a modificar, detalles visuales/lógicos y plan de verificación.
   - Establecer `RequestFeedback: true` en el artefacto.

2. **Fase 2: Aprobación del Usuario (Review)**
   - **DETENERSE y esperar la confirmación/aprobación explícita del usuario** antes de escribir código.

3. **Fase 3: Ejecución & Verificación (Execute & Verify)**
   - Realizar las modificaciones en el código siguiendo Clean Architecture y el Design System.
   - Ejecutar `flutter analyze` para garantizar 0 errores y 0 advertencias de compilación/linter.
   - Si se modifican DTOs/modelos, correr `dart run build_runner build --delete-conflicting-outputs`.

4. **Fase 4: Documentación y Cierre (Definition of Done)**
   - **Actualizar obligatoriamente `CONTEXT.md`**: Es la fuente única de la verdad del proyecto. Cualquier cambio en lógica, pantallas, endpoints o flujos debe quedar reflejado de inmediato en `CONTEXT.md`.
   - **Actualizar `walkthrough.md`**: Resumen de los cambios realizados y los resultados de las pruebas.
