fnum() {
  echo "$1" | numfmt --to=si
}
fn () {
   find . -name ".git" -prune -o -type f -iname "$1" -print
}

fng () {
   find . -name ".git" -prune -o -type f -exec grep -lis "$1" {} \+
}

pgrep() {
   ps $(/usr/bin/pgrep "$1")
}

fpgrep() {
   ps $(/usr/bin/pgrep -f "$1")
}
