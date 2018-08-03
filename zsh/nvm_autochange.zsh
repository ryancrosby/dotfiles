# http://zanshin.net/2013/02/02/zsh-configuration-from-the-ground-up/
# determine Ruby version whether using RVM or rbenv
# the chpwd_functions line cause this to update only when the directory changes
function _update_nvm_node_version() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default) ]]; then
    nvm use default
  fi
}
chpwd_functions+=(_update_nvm_node_version)
#
