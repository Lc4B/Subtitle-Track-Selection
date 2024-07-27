# Subtitle Track Selection
Small script that automatically sets the correct subtitle via flags.

## How it works
Subtitle Track Selection analyzes whether there are subtitles for the file (internal or external) and sets the most correct one via flag priority:
1. forced + default
2. forced
3. default
4. external (subtitles external to the file)

## Info
In the case of multiple subtitles with the same priority (flag), the first one present will be set according to the order of the subtitles.<br>
If there are only subtitles without flags, not only will they not be set, but they will also be deselected (in case mpv selects one automatically).<br>
There is the possibility to enable or disable external subtitle control via `script-message` to the `toggleExternal` function (for manual use via console or to bind it to a key).

## Installation
Place the [`Subtitle_Track_Selection.lua`](https://github.com/Lc4B/Subtitle-Track-Selection/blob/main/Subtitle_Track_Selection.lua) file into mpv `scripts` folder.
