function __node_binpath_cwd -v PWD
  set -l node_modules_path "$PWD/node_modules/.bin"
  if test -e "$node_modules_path"
    set -g __node_binpath "$node_modules_path"
    set -x PATH $PATH $__node_binpath
  else
    set -q __node_binpath
      and set -l index (contains -i -- $__node_binpath $PATH)
      and set -e PATH[$index]
      and set -e __node_binpath
  end
end

__node_binpath_cwd $PWD

function _nbp_uninstall --on-event nbp_uninstall
    # Erase "private" functions, variables, bindings, and other uninstall logic.
    functions -e __node_binpath_cwd
    set -e __node_binpath
end
