---
name: documentation
description: Feature documentation workflow for Flutter projects. Use when creating a new feature, changing feature behavior, updating project structure, or doing documentation-only work so another developer can understand the feature without opening the code first.
---

# Documentation

## Goal
Create practical documentation that explains how the feature works without repeating the code.

## When To Document
- New feature added
- Feature flow changed
- New Cubit, repository, model, or API dependency introduced
- Shared component usage changed in a meaningful way
- Documentation-only task requested

## Root README
The app root `README.md` should include:
- App overview
- Folder structure
- State flow
- API flow
- Shared packages
- Features overview

## Feature README Must Include
- Purpose
- UI Tree
- Screen Flow
- Business Flow
- Cubits
- States
- Repositories
- Models
- Shared Components
- API Endpoints
- Navigation
- Dependencies
- Known limitations when relevant

## Component Documentation Rules
When documenting a feature, make sure these responsibilities are clear:
- Repository: API endpoint, returned data, and which Cubit uses it
- Cubit: purpose, repository methods used, states emitted, and UI consumers
- State: why it exists, who listens to it, and what UI change it causes
- Shared Component: purpose, location, where it is used, and impact of changing it

## Writing Rules
- Keep it concise and practical.
- Use bullets and tables when clearer than paragraphs.
- Document real flows, not hypothetical ones.
- Summarize responsibilities instead of mirroring code file-by-file.
- A developer should understand the feature quickly.

## UI Tree Rule
Represent the visible structure clearly, for example:

```text
OrdersScreen
├── HeaderSection
├── FiltersSection
├── OrdersListSection
└── ActionsSection
```

## Update Rule
- If code behavior changed, update the README in the same task.
- If structure changed in a meaningful way, update the README in the same task.
- If nothing meaningful changed, do not rewrite the README just for noise.
