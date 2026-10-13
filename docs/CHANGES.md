# Non-beta Candidate: [v2.0.2](changelogs/2.0.2.md)

Retail 12.1.5 / Interface `120105`; client testing and publication pending.

# v2.0.0 - 2026-04-30

## Changes

- **Full architecture migration**: Restructured from legacy single-file to modern RGX-Framework architecture with `data/core.lua`, `data/locales.lua`, and `sounds/` directory.
- **Migrated to RGX-Framework**: Added `RequiredDeps: RGX-Framework` to TOC. Core logic now uses `RGX:GetSound()`, `RGX:RegisterEvent()`, and `RGX:RegisterSlashCommand()`.
- **Sound variants**: Added high/medium/low quality sound variants.
- **Localization**: Added multi-language support (enUS, deDE, frFR, esES, ruRU).
- **Settings**: Added persistent SavedVariables with slash commands for enable/disable, sound variant, and volume channel.
- **RGXSound handle**: Sound playback, variant management, mute/unmute, settings, and welcome message are now handled by the RGXSound module in RGX-Framework.
- **Reputation tracking**: Faction standing tracking preserved — plays sound when reputation rank increases.
