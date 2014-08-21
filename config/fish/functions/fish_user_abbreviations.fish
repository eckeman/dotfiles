function fish_user_abbreviations
  set -U fish_user_abbreviations \
    'sc=sudo systemctl' \
    'scu=systemctl --user' \
    'jf=journalctl -f' \
    'pac=pacman' \
    'aur=aura' \
    '!=sudo' \
    'tf=tail -f' \
    'l=ls -a' \
    'l.=ls -d .*' \
    'ccat=pygmentize' \
    'g=git' \
    'gs=git status -sb' \
    'gh=git head' \
    'gl=git l' \
    'gll=git ll' \
    'gwc=git wc' \
    'gd=git diff' \
    'gdt=git difftool' \
    'gdc=git diff --cached' \
    'gdw=git diff --color-words' \
    'gds=git diff --stat' \
    'ga=git add' \
    'gc=git commit -v' \
    'gca=git commit -v -a' \
    'gb=git branch' \
    'gco=git checkout' \
    'gf=git fetch' \
    'gfa=git fetch --all' \
    'gm=git merge' \
    'gr=git rebase' \
    'gcp=git cherry-pick' \
    'gpr=git pull-request' \
    'b=bundle' \
    'be=bundle exec' \
    'f=farm' \
    'fcd=farm cd' \
    'fc=farm console' \
    'fs=farm server' \
    'prs=prax restart' \
    'kc=kviberg-config' \
    'v=vagrant' \
    'x=systemctl --user start desktop.target' \
    'm=systemctl --user start mopidy'
end
