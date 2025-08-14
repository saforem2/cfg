# at the start of your .bashrc file
[[ -f ~/.local/share/blesh/ble.sh ]] && [[ $- == *i* ]] && source ~/.local/share/blesh/ble.sh --noattach

set -o vi

setup_codestats() {
    # Use cases
    source <(curl -L https://bit.ly/ezpz-utils)
    mn=$(ezpz_get_machine_name)
    # cas
    case "${mn}" in
        *"sophia"*)
            export CODESTATS_API_KEY="SFMyNTY.YzJGdFptOXlaVzFoYmc9PSMjTWpNek9UYz0.IwZza04Vl83YpJWXm1tqH8tQtil74SkQtnmjGyM3h7c"
            ;;
        *"polaris"* | *"x3"*)
            export CODESTATS_API_KEY="SFMyNTY.YzJGdFptOXlaVzFoYmc9PSMjTWpBNE1UTT0.20nVrgzuPbOPdPqzhQ5-iAoFynrBpVz4SP3x7pWW2H0"
            ;;
        *"aurora"* | *"x4"*)
            export CODESTATS_API_KEY="SFMyNTY.YzJGdFptOXlaVzFoYmc9PSMjTWpFM05qZz0.lABjjxtOfsGrmaUJKqFOtiJt-BZxd9AmWlshGD6xnKA"
            ;;
        *"sunspot"* | *"x1"* | *"uan"* | *"bastion"*)
            export CODESTATS_API_KEY="SFMyNTY.YzJGdFptOXlaVzFoYmc9PSMjTWpJd09URT0.7yHzS3Ccy2JelR4geEmLzu0UzHJJ_7IShND72zv-xyk"
            ;;
        *)
            echo "Unknown machine: ${mn}"
            ;;
    esac

}

[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash
# Source the Lazyman shell initialization for aliases and nvims selector
# shellcheck source=.config/nvim-Lazyman/.lazymanrc
[[ -f ~/.config/nvim-Lazyman/.lazymanrc ]] && source ~/.config/nvim-Lazyman/.lazymanrc
# Source the Lazyman .nvimsbind for nvims key binding
# shellcheck source=.config/nvim-Lazyman/.nvimsbind
[[ -f ~/.config/nvim-Lazyman/.nvimsbind ]] && source ~/.config/nvim-Lazyman/.nvimsbind
# Luarocks bin path
[[ -d "${HOME}/.luarocks/bin" ]] && {
    export PATH="${HOME}/.luarocks/bin${PATH:+:${PATH}}"
}
# cargo bin path
[[ -f "${HOME}/.cargo/env" ]] && source "${HOME}/.cargo/env"
# Perlbrew
[[ -f "${HOME}/perl5/perlbrew/etc/bashrc" ]] && source "${HOME}/perl5/perlbrew/etc/bashrc"
# x-cmd
[[ ! -f "$HOME/.x-cmd.root/X" ]] || . "$HOME/.x-cmd.root/X" # boot up x-cmd.
# bash-preexec
[[ -f "${HOME}/.bash-preexec.sh" ]] && source "${HOME}/.bash-preexec.sh"

export STARSHIP_CONFIG="${HOME}/.config/starship_bash.toml"
[[ -f "${STARSHIP_CONFIG}" ]] && eval "$(starship init bash)"

MACHINE=$(ezpz_get_machine_name | tr '[:upper:]' '[:lower:]')
export PATH="${HOME}/bin/${MACHINE}:${PATH}"
export HISTFILE="$HOME/.zsh_history-${MACHINE}"
setup_codestats

# # >>> mamba initialize >>>
# # !! Contents within this block are managed by 'micromamba shell init' !!
# export MAMBA_EXE='/home/foremans/.local/bin/micromamba';
# export MAMBA_ROOT_PREFIX='/lus/flare/projects/Aurora_deployment/foremans/micromamba';
# __mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__mamba_setup"
# else
#     alias micromamba="$MAMBA_EXE"  # Fallback on help from micromamba activate
# fi
# unset __mamba_setup
# # <<< mamba initialize <<<

if command -v atuin >/dev/null 2>&1; then
    # shellcheck source=/dev/null
    # source "$(atuin init bash-hook)"
    eval "$(atuin init bash)"
fi

[[ ! ${BLE_VERSION-} ]] || ble-attach
. "$HOME/.cargo/env"
