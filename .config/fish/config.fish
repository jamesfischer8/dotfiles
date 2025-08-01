if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -x PATH /opt/local/bin /opt/local/sbin $PATH
set -gx EDITOR vim
set -gx VISUAL vim
set -gx IRB_USE_AUTOCOMPLETE false
set -gx IRB_COMPLETOR type
set fish_cursor_default block
function fish_greeting
  # fortune -s
end

eval "$(/opt/homebrew/bin/brew shellenv)"

# asdf

## ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

## Do not use fish_add_path (added in Fish 3.2) because it
## potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

if test -f ~/.fish_secrets
    source ~/.fish_secrets
end

# pnpm
set -gx PNPM_HOME "/Users/james/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
