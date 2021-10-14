class base_config::vim_config (
  $prefer_nvim = true,
){
  require base_config::base_packages

  case $facts['identity']['user'] {
    'root': { $home = '/root' }
    default: { $home = "/home/$user" }
  }

  file {"$home/.vimrc":
    ensure  => present,
    source  => "puppet:///modules/base_config/.vimrc",
  }

  if $prefer_nvim {
    file {["$home/.config/", "$home/.config/nvim"]:
      ensure  => directory,
    }

    file {"$home/.config/nvim/init.vim":
      ensure  => present,
      source  => "puppet:///modules/base_config/init.vim",
    }
  }
}
