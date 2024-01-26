# dotfiles

"My" dotfiles—presently used w/MacOSX with aspirations toward Ubuntu Budgie.

**Highlights:**

* Multi-terminal w/unified UX<br>
* Dual Shell (fish & zsh) with unified prompt (using superthingy)

## Utilities

### Markdown Preview

There are two targeted methods for previewing markdown:
* In-terminal preview
* Browser preview (restoring soon)

# In-Terminal Markdown Preview

A method for previewing formatted markdown while editing it.

Presently using `entr` and `glow`. Not sure I've got the paging right.


Run: `mdp [FILENAME.md]` to **[pre]view** a markdown file.
Run: `mdw [FILENAME.md]` to **watch** a markdown file, updating with each change.

## Shell

### ZSH


|    MOD      | TARGET | Label               | Description 
|:-----------:|:------:|:--------------------|:--------------------------------|
|   CTRL      |   Y    | Copy prompt    | Copy current command in prompt to system clipboard

## Terminals

Presently, I don't utilize tabs and am still building toward tmux... so I probably
don't _really_ know what I'm doing._

[x] wezterm
[ ] kitty _Installed unconfigured_
[ ] alacrity? maybe

### Terminal Keybindings

Notable keybindings are intended for all included terminals.

The current source of truth can be found in the
[wezterm config](./config/wezterm/wezterm.lua).

|    MOD      | TARGET  | Label               | Description 
|:-----------:|:-------:|:--------------------|:-------------------------------|
|    CMD      | Enter   | Toggle Full Window | Toggle fullscreen mode for terminal window
| CMD & SHIFT | Enter   | Toggle Full Pane | Toggle fullscreen mode for active pane
|     -       |   -     | New pane above | n/a
| CMD & SHIFT |   D     | New pane below | Create a (horizontal) split pane **below** the active pane
|     -       |   -     | New pane left  | n/a
|    CMD      |   D     | New pane right | Create a (vertical) split pane **right** of the active pane
| CMD & ALT   | Up/K    | Focus pane above | Focus to the pane above the active pane
| CMD & ALT   | Down/J  | Focus pane below | Focus to the pane below the active pane
| CMD & ALT   | Right/L | Focus pane right | Focus the pane to the right of the active pane
| CMD & ALT   | Left/H  | Focus pane left  | Focus the pane to the left of the active pane
| ALT & SHIFT | UP/K    | Scroll pane up   | Scroll the active pane upwards 1/2 page
| ALT & SHIFT | DOWN/J  | Scroll pane down | Scroll the active pane upwards 1/2 page
| CTRL & ALT  | Up/K    | Resize pane upward | Resize the active pane upwards (1)
| CTRL & ALT  | Down/J  | Resize pane downward | Resize the active pane downwards (2)
| CTRL & ALT  | Right/L | Resize pane rightward | Resize the active pane toward the right
| CTRL & ALT  | Left/H  | Resize pane leftward | Resize the active pane toward the left
|    CMD      |   M     | Disabled | Disable screen minimization
<!--
|    CMD      |   W     | Disabled | Prevent closing panes (type exit) [Would like to make the default work when there's only one pane]
-->

## Eye Candy

### htop

![./images/htop.png](http://htop.org)
