# Custom Card for EDOPro

This file provides a short description of the custom card/expansion in this
folder for EDOPro.

## Overview

This expansion contains one or more custom cards for EDOPro. It includes the
card database, Lua script(s) for effects, and artwork images.

## Folder structure

- `database_file.cdb` — CDB file containing card data (IDs, names, descriptions,
  ATK/DEF, etc.).
- `script/` — contains Lua script files for the cards (e.g., `c360000000.lua`).
- `pics/` — contains card artwork images (e.g., `360000000.jpg`).

Note: Script filenames must follow the `c<cardid>.lua` format and artwork must
be named `<cardid>.jpg` so EDOPro can recognize them properly.

## Installation

1. Close EDOPro if it's running.
2. Copy this entire folder into EDOPro's `expansions` directory (for example:
   `EDOPro/expansions/<expansion-name>/`).
3. Open EDOPro. You may need to reload the Pack Manager or Deck Editor to see
   the new cards.

## Quick checks

- Ensure `database_file.cdb` is exported/imported in the correct CDB format.
- Check Lua scripts for syntax errors; EDOPro's log on startup will show script
  errors.

## Author

- Created by: (add your name if desired)

## License

- For personal use. If you publish this expansion publicly, please credit the
  original author(s) and respect copyright for card content and artwork.
