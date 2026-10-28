# Getting started with Act Chat

This repository documents a fantasy MMORPG being built in Roblox Studio. It currently has an initial Baseplate project and starter source files; no complete or tested gameplay system has been published.

## 1. Create the folder structure in Roblox Studio

In the **Explorer** window, add these folders:

```text
ReplicatedStorage
└── Shared

ServerScriptService
├── Services
└── Data

StarterPlayer
└── StarterPlayerScripts
    └── Controllers
```

These are *Roblox Studio instance folders*, not the same as GitHub folders.

## 2. Add the starter module

Create a **ModuleScript** named `LevelMath` in `ReplicatedStorage > Shared`. Copy the contents of [src/shared/LevelMath.luau](../src/shared/LevelMath.luau) into it.

This utility calculates the XP required to level up and converts total earned XP into a level and progress. It does **not** grant XP or save player data by itself.

### Quick manual check

In Studio's Command Bar, with the ModuleScript in place:

```lua
local mathModule = require(game.ReplicatedStorage.Shared.LevelMath)
print(mathModule.requiredXPForNextLevel(1)) -- 100
print(mathModule.progressFromTotalXP(125)) -- 2, 25, 125
```

## 3. Next development steps

- Create a server-side service to track player XP.
- Add a UI that displays the level and XP progress.
- Decide on character classes and starter abilities.
- Test locally in Studio before publishing gameplay claims.
- Add safe DataStore persistence later, with validation and error handling.

## GitHub workflow

Use this repo to track genuine improvements and issues. Commit changes when they are ready, describing what actually changed. You can upload Roblox projects as `.rbxl` or `.rbxlx` files, or set up a file sync workflow such as Rojo later.
