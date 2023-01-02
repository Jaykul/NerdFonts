# Downloads and installs [NerdFonts](https://www.nerdfonts.com).

By default, installs only the fonts "Caskaydia Cove NF" (and "Caskaydia Cove NF Mono"), but supports installing any and all NerdFonts from the release. Note that this specifically uses the "Windows Compatible" font files (which have shortened font names), and the name has to match the zip file. Some of the current zip files are named with the _reserved_ font names, rather than the actual name that will show up on the font once it's installed, so there's a bit of a weird mix.

## Package parameters

Pass the `/name` parameter to install one or more specific fonts. However, note that theFor example, to install "Caskaydia Cove Nerd Font" and "FiraCode Nerd Font,"  use:

`choco install nerdfonts -y --params="/name=CascadiaCode FiraCode"`

To install all fonts, use:

`choco install nerdfonts -y --params="/name=.*"`

## Available font names:

3270, Agave, AnonymousPro, Arimo, AurulentSansMono, BigBlueTerminal, BitstreamVeraSansMono, CascadiaCode, CodeNewRoman, Cousine, DaddyTimeMono, DejaVuSansMono, DroidSansMono, FantasqueSansMono, FiraCode, FiraMono, Go-Mono, Gohu, Hack, Hasklig, HeavyData, Hermit, iA-Writer, IBMPlexMono, Inconsolata, InconsolataGo, InconsolataLGC, Iosevka, JetBrainsMono, Lekton, LiberationMono, Lilex, Meslo, Monofur, Monoid, Mononoki, MPlus, NerdFontsSymbolsOnly, Noto, OpenDyslexic, Overpass, ProFont, ProggyClean, RobotoMono, ShareTechMono, SourceCodePro, SpaceMono, Terminus, Tinos, Ubuntu, UbuntuMono, VictorMono

For more information see [https://www.nerdfonts.com](https://www.nerdfonts.com) and [https://github.com/ryanoasis/nerd-fonts/releases/](https://github.com/ryanoasis/nerd-fonts/releases/).
