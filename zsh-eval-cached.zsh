CACHE_TIME=$((60*60*24))

# usage: eval_cached "cmd1" "cmd2" ...
# e.g.: eval_cached 'gh completion -s zsh' 'kubectl completion zsh'

eval_cached() {
	local CACHE_DIR="${TMPDIR-/tmp}"
	local CACHE_FILE="$CACHE_DIR/zsh_eval_cache.$(
		printf "%s;" "$@" | \
			sha256sum | \
			cut -d' ' -f1 || return 1).${UID}"

	if ! [ -e "$CACHE_FILE" ] || ! [ $(($(date +%s) - $(date +%s -r "$CACHE_FILE"))) -lt $CACHE_TIME ]; then
		local TMP_FILE="$(mktemp "$CACHE_FILE.XXXXXX")"
		for i; do
			printf "\n#######################\n# %s\n" "$i"
			eval "$i"
		done > "$TMP_FILE"
		mv "$TMP_FILE" "$CACHE_FILE"
	fi

	source "$CACHE_FILE"
}
