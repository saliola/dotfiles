# Lazy-load micromamba
micromamba() {
    unset -f micromamba
    export MAMBA_EXE='/opt/homebrew/bin/micromamba'
    export MAMBA_ROOT_PREFIX='/Users/saliola/mamba'
    eval "$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX")"
    micromamba "$@"
}

alias mamba=micromamba
