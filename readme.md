# Fallout 76 Mod - No Stealth Meter
[![nexus-mods-page](https://img.shields.io/badge/Nexus%20Mod-No%20Stealth%20Meter%20-orange?style=flat-square&logo=spinrilla)](https://next.nexusmods.com/skyrimspecialedition/collections/jqekb9)
[![github-repository](https://img.shields.io/badge/GitHub-Repository-green?style=flat-square&logo=github)](https://github.com/rdok/fallout76_mod_no_stealth_meter)

> Hides the stealth meter when crouched.
 
[![Steal Meter Hidden Showcase](stealth_meter_hidden_showcase.webp)](https://www.nexusmods.com/fallout76/mods/1070)


- *Game Version:* 1.6.4.65
- Install with [Vortex](https://www.nexusmods.com/about/vortex/).

### Features
- Hide stealth meter using normal armor, e.g. combat armor or apparel
- Power armor is not supported; immersion wise speaking, sneaking in said armor does not make sense.

***

[//]: # (DO NOT EDIT: This file has been autogenerated, any changes will be overwritten)
### Dependencies
- [Archive2](https://www.nexusmods.com/fallout76/mods/546?tab=files&file_id=13110) WARNING: the latest `Fallout 4: Creation Kit` version does not properly work anymore. Use this instead.
- [B.A.E. - Bethesda Archive Extractor](https://www.nexusmods.com/fallout4/mods/78/?)
- [NodeJS 18](https://nodejs.org/en/blog/release/v18.12.0) for automation tools
 
### Workflow
- [How to make a custom UI by editing HUDMenu.swf](https://www.nexusmods.com/fallout4/articles/10) follow the tutorial to extract only the `hudmenu.swf` from SeventySix - Interface.ba2
- Open `hudmenu.swf` with [JPEXS Free Flash Decompiler](https://github.com/jindrapetrik/jpexs-decompiler/releases/tag/version20.1.0)
    - Click on the left sidebar, and then `Ctrl+F` to open the finder menu. Copy and paste `StealthMeter`.
- Translate the Y to 42000 for all objects in frame 1 (undetected), and frame 15 (detected mode)
- Save
- Use PowerShell to build the mod: `.\scripts\build.ps1`. 
- Use Vortex to install the newly created mod
- Ensure Vortex has enabled the mod by checking the file `%USERPROFILE%\Documents\My Games\Fallout 76\Fallout76Custom.ini`.
```ini
[Archive]
sResourceArchive2List = NoStealthMeter.ba2
```
- You may use the `.\scripts\build_dev_deploy.ps1` which refreshes the installed mod with any additionally changes.

#### Sources
- [Flash SWF Editing](https://wiki.nexusmods.com/index.php/Flash_SWF_Editing)
- [HUD Modding guide for Fallout 76](https://github.com/sdaskaliesku/fo76modding)
- [FO76Edit](https://www.nexusmods.com/fallout76/mods/30)
- [HUDEditor - Customize your HUD](https://www.nexusmods.com/fallout76/mods/953)

***

[//]: # (DO NOT EDIT: This file has been autogenerated, any changes will be overwritten)
### Deployment

This is now automated. Use PowerShell to execute: `.\scripts\build.ps1`

This creates the mod in zip format ready to be deployed to NexusMods platform.


***

[//]: # (DO NOT EDIT: This file has been autogenerated, any changes will be overwritten)

