---
name: ai-development
description: >
  Coordinates AI-assisted development in existing projects using SDD,
  Graphify, project architecture, specialized skills, and verification.
---

# AI Development

Use this skill for development tasks in existing projects.

This skill coordinates the development workflow. Project-specific skills remain responsible for their own domain.

## 1. Understand Before Changing

Before modifying source code:

1. Read `ARCHITECTURE.md` when present.
2. Read relevant project documentation and `CONTEXT.md` when present.
3. Inspect existing implementation patterns.
4. Use Graphify when repository relationships or dependencies are unclear.
5. Identify affected layers, files, dependencies, tests, and generated code.
6. Check relevant project-specific skills.

Do not modify source code during research unless explicitly requested.

## 2. Follow SDD

Follow the repository SDD rule:

1. Research requirements and architecture.
2. Create or update `implementation_plan.md`.
3. Present the plan for review.
4. Wait for explicit approval.
5. Create or update `task.md`.
6. Implement tasks incrementally.
7. Verify the result.
8. Update required documentation.

Do not skip approval when the SDD rule requires it.

## 3. Reuse Existing Architecture

For mature projects:

- Prefer existing patterns over introducing new patterns.
- Reuse existing services, repositories, models, widgets, state management, and design-system components.
- Do not introduce new dependencies without justification.
- Do not refactor unrelated code.
- Do not change architecture unless required by the specification.
- Do not invent APIs, endpoints, models, or business rules.
- Use existing API specifications such as OpenAPI/Swagger when available.

## 4. Use Specialized Skills

Before implementing a task, determine whether a project-specific skill applies.

Examples:

- Tenant creation → `create-tenant`
- Investigation → investigation skill
- Refactoring → safe-refactor skill
- Verification → verification skill

Use the specialized skill for its domain instead of duplicating its instructions here.

## 5. Implementation

After approval:

1. Follow `task.md`.
2. Implement the smallest complete change.
3. Keep changes focused on the specification.
4. Preserve existing behavior outside the requested scope.
5. Update generated files only when required.
6. Keep task checkboxes synchronized with actual progress.

For Flutter projects, use project-defined commands and patterns.

Common verification commands include:

```bash
flutter analyze
flutter test