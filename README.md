# sh

collection of personal scripts

- [tdo](tdo): Simple to-do list.
- [xcl](xcl): Pick screen colors.
- [swc](swc): Easily colorschemes across the OS.
- [nfy](nfy): Easily send predefined notifications.
- [wal](wal): Easily set your wallpaper. See [walls](https://github.com/jaimecgomezz/walls).
- [dkc](dkc): Easily run common Docker Compose commands.
- [xpl](xpl): Easily access man pages in their PDF format.
- [slc](slc): Select interactively based on caller context.
- [nsl](nsl): Echo arguments, each in new lines and [slc](slc) them.
- [fch](fch): A fetch written in POSIX shell without any external commands. [Source](https://github.com/6gk/fet.sh).
- [exit-manager.sh](exit-manager.sh): System exit manager.
- [runner.sh](runner.sh): Easily run any of this scripts.
- [screens.sh](screens.sh): Easily set predefined xrandr configs.
- [configs-editor.sh](configs-editor.sh): Easily edit any config file.
- [keyboard-setter.sh](keyboard-setter.sh): Easily set your keyboard layout.
- [docker-assistant.sh](docker-assistant.sh): Easily run common Docker commands.
- [screen-locker.sh](screen-locker.sh): Lock screen. Inspired by @alfunx [lock](https://github.com/alfunx/.dotfiles/blob/master/.bin/lock).

### Extras

- [go2pdf](go2pdf): Download every Go's dev blog entry and join them as PDF

## Installation

### Requirements

[yay](https://github.com/Jguer/yay), [i3lock-color](https://github.com/Raymo111/i3lock-color), [notify-send.sh](https://github.com/vlevit/notify-send.sh), [xorg-setxkbmap](https://github.com/freedesktop/xorg-setxkbmap), [dmenu](https://tools.suckless.org/dmenu/), [fzf](https://github.com/junegunn/fzf), [hsetroot](https://github.com/himdel/hsetroot), [jq](https://github.com/stedolan/jq), and [zathura](https://git.pwmt.org/pwmt/zathura) with [PDF support](https://git.pwmt.org/pwmt/zathura-pdf-mupdf).

```sh
~ $ git clone https://github.com/jaimecgomezz/sh
~ $ export PATH="$PATH:~/sh" # Available in current terminal
~ $ echo "PATH=\"$PATH:~/sh\"" >> .profile # Available permanentely
```

## FAQ

1. Why `runner.sh`?

   I have a special key binding within my WM config that allows me to trigger `rrr` and quickly access any of my scripts and enter their interactive mode without the need to open a console.

2. Why `nfy`?

   I really don't like to have a status bar in my WM. Whenever I need to check for some mundane stuff like the date I can trigger a special key binding to run `nfy date`.

3. Why `slc`?

   I really wanted to use this scripts smoothly whether I run them through my WM as a key binding, or directly in the console; `slc` encapsulates this concern by deciding which selector to use based on the process' parent name.

   For example, when launching `xpl` as a WM key binding, its parent process name would be `systemd`, contrary to `bash`, `shell` or `zsh` that we would get when running it directly in the console. If we detect `systemd` the we use `dmenu` as the selector, and `fzf` in any other case.

   This simple concept allows us to change our selector for all of our scripts only by editing `slc`.

4. I'm trying to execute one of the scripts with a key binding in my WM, but it throws a `command not found` error, how to fix it?

   Add the `PATH` to your `.profile`

   ```sh
   # ~/.profile
   export PATH="$PATH:~/sh"
   ```

## History

I've been learning a couple of things since I released [scripts](https://github.com/jaimecgomezz/scripts), my first, now archived, collection of executables. I decided to keep them because the reflect how I used to understand and design code. This project could be considered a `v2`.
