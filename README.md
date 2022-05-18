zsh-eval-cached
===============

evals its arguments and caches the output.

Usage:
------

In your zshrc:

```bash
# include the source
source $HOME/src/zsh-eval-cached/zsh-eval-cached.zsh

# execute:
eval_cached \
 'hcloud completion zsh' \
 'kubectl completion zsh' \
 'helm completion zsh' \
 'cat $HOME/.cargo/env'

# clean the cache with:
# rm "${TMPDIR-/tmp}/zsh_eval_cache.*
```
