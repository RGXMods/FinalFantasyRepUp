# <span style="color: #2563EB;">🔷 </span> <span style="color: #8b4b5c;">R</span><span style="color: #8b4b5c;">G</span><span style="color: #8b4b5c;">X</span> <span style="color: #2563EB;">| </span> <span style="color: #2563EB;">F</span><span style="color: #ffffff;">inal </span><span style="color: #2563EB;">F</span><span style="color: #ffffff;">antasy </span><span style="color: #2563EB;">R</span><span style="color: #ffffff;">ep </span><span style="color: #2563EB;">U</span><span style="color: #ffffff;">p</span><span style="color: #2563EB;">!</span>

![FFRU Logo](media/logo.png)

## ![](media/kiwi.gif) <span style="color: #8b4b5c;">R</span><span style="color: #8b4b5c;">G</span><span style="color: #8b4b5c;">X</span> <span style="color: #4ecdc4;">Mods</span> <span style="color: #3598db;">-</span> <span style="color: #8b4b5c;">R</span><span style="color: #6b8fb0;">ealm</span><span style="color: #8b4b5c;">G</span><span style="color: #8b4b5c;">X</span> <span style="color: #6b8fb0;">Community Project</span>

***

## <span style="color: #2563EB;">🎯 Overview</span>

**Final Fantasy Rep Up! (FFRU)** brings a Final Fantasy-inspired victory fanfare to World of Warcraft reputation progression. It watches faction standing data and plays its replacement sound when a tracked faction advances to a higher standing.

The addon is intentionally focused: it has no options window and does not change reputation values, faction UI, or chat output. Sound playback and persisted settings are provided by RGX-Framework.

![RealmGX Kiwi](media/kiwi.gif) **<span style="color: #2dc26b;">The Kiwi Says:</span>** <span style="color: #b96ad9;">"Victory! Bwwiiiee."</span>

***

## <span style="color: #2563EB;">⚠️ Deprecation Notice</span>

<span style="color: #ff6b6b;">**This addon is no longer receiving updates.**</span> Its functionality and Final Fantasy sound are available in [BLU | Better Level Up!](https://www.curseforge.com/wow/addons/blu-better-level-up) and [BLU Classic | Better Level Up!](https://www.curseforge.com/wow/addons/blu-classic), which combine this sound with a larger sound collection.

Existing standalone users may continue to use this repository as-is, but new installations should prefer the appropriate BLU addon.

***

## <span style="color: #2563EB;">✨ Behavior and Features</span>

- Detects faction standing increases after `UPDATE_FACTION` and `QUEST_LOG_UPDATE`.
- Establishes the initial faction-standing snapshot at login, avoiding a sound merely for loading the character.
- Provides high, medium, and low OGG variants; medium is selected by default.
- Plays through the Master sound channel by default.
- Requests that RGX-Framework mute the configured default reputation sound while FFRU is enabled.
- Stores enablement and sound-variant choices in `FFRUSettings`.
- Shows a welcome message on login while that saved preference remains enabled.
- Includes a test command so playback can be checked without waiting for a standing increase.

FFRU reacts to a higher faction standing value, not every individual reputation-point gain within the same standing.

***

## <span style="color: #2563EB;">🎮 Requirements and Compatibility</span>

`RGX-Framework` is a required dependency and must be installed and enabled. The current TOCs declare these game interfaces:

| WoW flavor | TOC | Interface |
|---|---|---:|
| Retail | `FinalFantasyRepUp.toc` | `120005` |
| Wrath Classic | `FinalFantasyRepUp_Wrath.toc` | `30403` |
| Burning Crusade Classic | `FinalFantasyRepUp_TBC.toc` | `20504` |
| Classic Era | `FinalFantasyRepUp_Vanilla.toc` | `11500` |

These values describe the preserved release metadata. The addon is deprecated, so they are not a promise of compatibility with later game clients.

***

## <span style="color: #2563EB;">📥 Installation</span>

1. Download a packaged release of FinalFantasyRepUp and install RGX-Framework.
2. Extract both addon folders into the WoW client's `Interface/AddOns` directory.
3. Confirm that the folder is named `FinalFantasyRepUp` rather than a source-archive name.
4. Enable `RGX-Framework` and `Final Fantasy Rep Up!` at the character-selection AddOns screen.

For the consolidated replacement, install BLU or BLU Classic instead of the standalone addon.

***

## <span style="color: #2563EB;">⌨️ Usage and Configuration</span>

FFRU works automatically once enabled. It has no graphical configuration panel; use `/ffru` commands in chat:

| Command | Result |
|---|---|
| `/ffru` or `/ffru help` | List available commands. |
| `/ffru test` | Play the selected sound variant. |
| `/ffru enable` | Enable replacement playback. |
| `/ffru disable` | Disable replacement playback. |
| `/ffru high` | Select the high-quality file. |
| `/ffru med` or `/ffru medium` | Select the medium-quality file. |
| `/ffru low` | Select the low-quality file. |

The initial defaults are enabled, medium quality, Master-channel playback, default-sound muting, and the welcome message. Settings persist between sessions in `FFRUSettings`.

***

## <span style="color: #2563EB;">🧩 Files and Runtime</span>

- `data/locales.lua` defines chat and welcome text.
- `data/core.lua` registers the sound set, events, saved settings, and `/ffru` command.
- `sounds/final_fantasy_rep_{high,med,low}.ogg` are the active playback files.
- `media/icon.tga`, `media/logo.png`, and `media/kiwi.gif` provide addon and project artwork.

At addon load, FFRU initializes its RGX-Framework sound handle. At login it snapshots faction standings and displays the optional welcome message. Later faction or quest-log updates rescan standings and play the selected sound only when a tracked standing increases. Logout allows the framework handle to finalize its state.

***

## <span style="color: #2563EB;">🛠️ Troubleshooting</span>

- If WoW marks FFRU as missing a dependency, install or enable `RGX-Framework`.
- If no custom sound plays, run `/ffru test`, then `/ffru enable` and select a variant again.
- If the default sound still plays, verify that FFRU and RGX-Framework both loaded without Lua errors.
- If an ordinary reputation gain is silent, remember that FFRU triggers on a standing increase rather than every point gain.
- If WoW cannot find the addon, verify the exact `Interface/AddOns/FinalFantasyRepUp` folder name.

Because the standalone project is retired, migrate to BLU or BLU Classic when you prefer the consolidated sound addon.

***

## <span style="color: #2563EB;">🔗 Project Links</span>

- [Repository](https://github.com/RGXMods/FinalFantasyRepUp)
- [Releases](https://github.com/RGXMods/FinalFantasyRepUp/releases)
- [Issues](https://github.com/RGXMods/FinalFantasyRepUp/issues)
- [Author: DonnieDice](https://github.com/donniedice)
- [Support development](https://www.buymeacoffee.com/donniedice)

This repository is retained for existing users and historical context. Issue reports and contributions should account for the deprecation notice and the migration path above.

***

## <span style="color: #4ecdc4;">🌟 Thank you for choosing </span> <span style="color: #8b4b5c;">R</span><span style="color: #8b4b5c;">G</span><span style="color: #8b4b5c;">X</span> <span style="color: #4ecdc4;">Mods! 🌟</span>
