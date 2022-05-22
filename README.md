# sh
collection of personal scripts

- [tdo](tdo): Simple to-do list.
- [sux](sux): Run scripts as sudo.
- [sxt](sxt): System exit manager.
- [blk](blk): Easily block internet pages.
- [rrr](rrr): Easily run any of this scripts.
- [skb](skb): Easily set your keyboard layout.
- [nfy](nfy): Easily send predefined notifications.
- [ppp](ppp): Easily install scripts' dependencies.
- [wal](wal): Easily set your wallpaper. See [walls](https://github.com/jaimecgomezz/walls).
- [lok](lok): Lock screen. Inspired by @alfunx [lock](https://github.com/alfunx/.dotfiles/blob/master/.bin/lock).
- [dkr](dkr): Easily run common Docker commands.
- [slc](slc): Select interactively based on caller context.
- [xpl](xpl): Easily access man pages in their PDF format.
- [pmo](pmo): A pomodoro manager written in POSIX shell.
- [dkc](dkc): Easily run common Docker Compose commands.
- [fch](fch): A fetch written in POSIX shell without any external commands. [Source](https://github.com/6gk/fet.sh).

## Installation

### Requirements

[yay](https://github.com/Jguer/yay), [i3lock-color](https://github.com/Raymo111/i3lock-color), [notify-send.sh](https://github.com/vlevit/notify-send.sh), [xorg-setxkbmap](https://github.com/freedesktop/xorg-setxkbmap), [dmenu](https://tools.suckless.org/dmenu/), [fzf](https://github.com/junegunn/fzf), [polkit](https://gitlab.freedesktop.org/polkit/polkit), [hsetroot](https://github.com/himdel/hsetroot), [jq](https://github.com/stedolan/jq), and [zathura](https://git.pwmt.org/pwmt/zathura) with [PDF support](https://git.pwmt.org/pwmt/zathura-pdf-mupdf).

```sh
~ $ git clone https://github.com/jaimecgomezz/sh
~ $ export PATH="$PATH:~/sh" # Available in current terminal
~ $ echo "PATH=\"$PATH:~/sh\"" >> .profile # Available permanentely
~ $ ppp i # install dependencies
```

## FAQ

1. Why `rrr`?

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
