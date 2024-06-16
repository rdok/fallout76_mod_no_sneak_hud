### Status: Blocked
Attempting to load the modded file either causes a freeze upon login, or does no changes.

### Workflow
- [How to make a custom UI by editing HUDMenu.swf](https://www.nexusmods.com/fallout4/articles/10) follow the tutorial to extract SeventySix - Interface.ba2, and get the hudmenu.swf
- Use the [JPEXS Free Flash Decompiler](https://www.free-decompiler.com/flash/download/) to decompile the hudemenu.swf flash file. Click `Yes to all` upon the warning prompt, `No` when prompted to select local file.
- On JPEXS application, having opened the hudmenu.swf: Click on the left sidebar, and then `Ctrl+F` to open the finder menu. Copy and paste StealthMeterInternal.
- Expand the sprites folder, and click on the HUDMenu_fla package. Next scroll down to the StealthMeterInternal and change matrix object translateY to 42000:
Undetected

#### Undetected
```
frame 1
PlaceObject2 (~791) Depth: 1 (stealthTextStates)
PlaceObject3 (~794) Depth: 3 (BracketRightInstance)
PlaceObject3 (~797) Depth: 5 (BracketLeftInstance)
```

#### Detected/in combat
frame 15
PlaceObject3 (~800) Depth: 3 (BracketRightInstance)
PlaceObject3 (~803) Depth: 5 (BracketLeftInstance)

![framed_moved_showcase.png](https://raw.githubusercontent.com/rdok/fallout76_mod_no_sneak_hud/main/framed_moved_showcase.png)

#### Sources
- [Flash SWF Editing](https://wiki.nexusmods.com/index.php/Flash_SWF_Editing)