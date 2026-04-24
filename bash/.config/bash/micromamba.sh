# Lazy-load micromamba
micromamba() {
    unset -f micromamba
    export MAMBA_EXE="$HOMEBREW_PREFIX/bin/micromamba"
    export MAMBA_ROOT_PREFIX="$HOME/mamba"
    eval "$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX")"
    micromamba "$@"
}

alias mamba=micromamba
