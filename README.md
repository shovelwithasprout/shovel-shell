# shovel-shell
a "minimal" shell with quickshell as the main bar

<img width="1366" height="768" alt="shovel-shell" src="https://github.com/user-attachments/assets/cf646a1d-4a54-466e-9bc3-b209bf57e0e1" />

## Components / Dependencies
- niri (if using hyprland, you will need to replace the workspaces.qml)
- fuzzel
- quickshell (for the top bar)
- mpd (Mpris module can be configured to allow other players, but I personally reserve it for MPD)
- rmpc (mpd client of choice)
- mako

## Install
Installing should be as simple as just installing the dependencies above and then transferring all necessary config files into their respective folders. For example...

Niri's ``config.kdl`` should be put in ~/.config/niri/
You can find any config file directories elsewhere online.

If you want the splatoon fastfetch image, it will need to be located at ``~/Pictures/melody.png``

As for themes and icons, i will not be including those here. However, i can tell you which themes and icons i use.

### Icon Packs
Qt - Papirus-Dark for its tray icons <a href="https://github.com/PapirusDevelopmentTeam/papirus-icon-theme?tab=readme-ov-file#installation">(link)</a><br>
GTK - Adwaitaru-magenta <a href="https://github.com/ricardoherreramx/adwaitaru">(link)</a>

Make sure you set these via qt5ct (or qt6ct) and nwg-look, respectively!!

### Cursor Pack
I use the <a href="https://github.com/vinceliuice/McMojave-cursors">McMojave-cursors</a> in pretty much all of my linux installations. this is up to personal preference, however.

### Qt Font (for quickshell)
I have my Qt font set to URW Gothic 9, in the Demi font style.
