# -----------------------------
# PATH setup — roketrakun edition 🚀
# -----------------------------

# helper: safely prepend dir to PATH
addToPathFront() {
  [[ -d "$1" ]] && case ":$PATH:" in
    *":$1:"*) ;;               # already there, skip
    *) PATH="$1:$PATH" ;;
  esac
}

# ---- your personal stuff ----
addToPathFront "$HOME/.zig"
addToPathFront "$HOME/.local/.npm-global/bin"
addToPathFront "$HOME/.local/scripts"
addToPathFront "$HOME/.local/bin"
addToPathFront "$HOME/.local/n/bin"
addToPathFront "$HOME/.local/go/bin"
addToPathFront "$HOME/go/bin"
addToPathFront "$HOME/personal/sumneko/bin"
addToPathFront "$HOME/.deno/bin"

# ---- system binaries (always at end, never lost) ----
for p in /usr/local/sbin /usr/local/bin /usr/bin /usr/sbin /bin /sbin; do
  addToPathFront "$p"
done

# export final PATH
export PATH

# quick sanity check (optional)
# echo "PATH loaded: $PATH"


