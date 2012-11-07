#!/bin/sh

# The tmux-powerline directory path.
tmux_powerline_dir="${TMUX_POWERLINE_WRAPPER_DIR%/*}/tmux-powerline"
if [ ! -d "$tmux_powerline_dir" ]; then
    echo "tmux-powerline directory is not found: $tmux_powerline_dir"
    exit 1
fi

# PLATFORM {linux,bsd,mac}
if [ -z "$PLATFORM" ]; then
    case "$OSTYPE" in
        darwin*)
            export PLATFORM="mac"
            ;;
        freebsd*)
            export PLATFORM="bsd"
            ;;
        linux*)
            export PLATFORM="linux"
            ;;
    esac
fi

# Source tmux-powerline global configurations.
source "${tmux_powerline_dir}/config.sh"

# Source lib functions.
source "${tmux_powerline_dir}/lib.sh"


# The tmux-powerline segments path.
segments_path="${tmux_powerline_dir}/${segments_dir}"
if [ ! -d "$segments_path" ]; then
    echo "tmux-powerline segments directory is not found: $segments_path"
    exit 1
fi

# The tmux-powerline-wrapper segments path.
wrapper_segments_path="${TMUX_POWERLINE_WRAPPER_DIR}/segments"
if [ ! -d "$wrapper_segments_path" ]; then
    echo "tmux-powerline-wrapper segments directory is not found: $wrapper_segments_path"
    exit 1
fi

# tmux window width
window_width="$(${wrapper_segments_path}/window-width.sh)"
