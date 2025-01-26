if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -x PATH /opt/local/bin /opt/local/sbin $PATH
source /opt/local/share/asdf/asdf.fish
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx IRB_USE_AUTOCOMPLETE false
set -gx IRB_COMPLETOR type
function fish_greeting
  # fortune -s
end
