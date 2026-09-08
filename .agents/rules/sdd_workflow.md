# Spec-Driven Development (SDD) Guidelines

This repository follows the **Spec-Driven Development (SDD)** methodology to ensure code quality, architecture consistency, and smooth pair programming with AI Coding Assistants.

All changes must follow this lifecycle before code is modified.

---

## 1. Phase 1: Research & Specification
Before modifying any source code:
1. Define the requirements and architectural boundaries.
2. If integrating APIs, ensure the OpenAPI/Swagger schema (e.g., `swagger.yaml`) is referenced.
3. Create or update the technical specification in `implementation_plan.md`.

The plan must detail:
- Architectural impact (Vertical slices, Clean Architecture layer modifications).
- Detailed list of modified/new files.
- Verification and testing steps.

---

## 2. Phase 2: Design Alignment & Review
1. Present the design specification/plan to the developer or code reviewer.
2. Address questions and refine the requirements.
3. **Wait for explicit approval** before proceeding to execution.

---

## 3. Phase 3: Task Breakdown
Create a `task.md` document mapping out atomic checkboxes for implementation:
```markdown
- [ ] Task 1 (e.g., REST API Service implementation)
- [ ] Task 2 (e.g., Repositories & DTOs generation)
- [ ] Task 3 (e.g., UI updates in screens)
- [ ] Task 4 (e.g., Running tests and static analyzer)
```

---

## 4. Phase 4: Implementation, Verification & Documentation
1. Develop the changes following the step checklist.
2. Keep dependencies decoupled and use the project design system components (`AppCard`, `AppButton`, `AppTextField`, `AppAlertDialog`, etc.).
3. Regenerate build outputs if needed (`dart run build_runner build --delete-conflicting-outputs`).
4. Validate changes:
   - Run `flutter analyze` (ensure 0 warnings/errors).
   - Run `flutter test`.
5. **Mandatory Documentation Update**:
   - Update `CONTEXT.md` in the workspace root with every functional/architectural change made.
   - Update `walkthrough.md` with links to modified files and verification results.
