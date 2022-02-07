# dotfiles

#### for help in colours selection:
https://askubuntu.com/questions/821157/print-a-256-color-test-pattern-in-the-terminal

```bash
for i in {0..255} ; do
    printf "\x1b[48;5;%sm%3d\e[0m " "$i" "$i"
    if (( i == 15 )) || (( i > 15 )) && (( (i-15) % 6 == 0 )); then
        printf "\n";
    fi
done
```

#### clipboard
- check "vim --version" for '+clipboard' or '+xterm_clipboard'
[vim clipboard to system clipboard](https://advancedweb.hu/working-with-the-system-clipboard-in-vim/)

#### vim suchen ersetzen:
- https://www.admin-magazin.de/Das-Heft/2013/03/Suchen-und-Ersetzen-im-Vim-Editor/(offset)/4
- https://www.admin-magazin.de/News/Tipps/ADMIN-Tipp-Suchen-und-Ersetzen-in-Vim

