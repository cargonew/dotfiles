# Only source if file exists, do NOT output anything
for fzf_file in \
  /usr/share/fzf/key-bindings.zsh \
  /usr/share/fzf/completion.zsh \
  /usr/share/doc/fzf/examples/key-bindings.zsh \
  /usr/share/doc/fzf/examples/completion.zsh; do
  [[ -f "$fzf_file" ]] && source "$fzf_file"
done

