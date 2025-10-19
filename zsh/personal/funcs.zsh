# Custom functions

catr() {
  tail -n "+$1" "$3" | head -n "$(($2 - $1 + 1))"
}

validateYaml() {
  python - <<'EOF' "$1"
import yaml, sys
with open(sys.argv[1]) as f:
    yaml.safe_load(f)
EOF
}

goWork() { cp ~/.npm_work_rc ~/.npmrc }
goPersonal() { cp ~/.npm_personal_rc ~/.npmrc }

addThrottle() {
  local kbs="kbps"
  echo "Throttling to $1 $kbs..."
  sudo tc qdisc add dev wlp59s0 handle 1: root htb default 11
  sudo tc class add dev wlp59s0 parent 1: classid 1:1 htb rate "$1$kbs"
  sudo tc class add dev wlp59s0 parent 1:1 classid 1:11 htb rate "$1$kbs"
}

removeThrottle() { sudo tc qdisc del dev wlp59s0 root }

cat1Line() { tr -d '\n' < "$1" }

ioloop() {
  local FIFO
  FIFO=$(mktemp -u /tmp/ioloop_$$_XXXXXX)
  trap "rm -f $FIFO" EXIT
  mkfifo "$FIFO"
  (: <"$FIFO" &)
  exec >"$FIFO" <"$FIFO"
}

eslintify() {
  cat "$1" > /tmp/file_to_eslint
  npx eslint /tmp/file_to_eslint
}

