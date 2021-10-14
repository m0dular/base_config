class base_config::vim_config (
  $home,
  $prefer_nvim = false,
){
  require base_config::base_packages

  file {"$home/.vimrc":
    ensure  => present,
    source  => "puppet:///modules/base_config/vimrc",
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
