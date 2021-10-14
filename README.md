# base_config
Puppet module to enforce a basic, "starter" configuration

## base_config::base_packages
Installs a set of packages specified by `base_config::base_packages::packages`.  Several packages are provided by default in `data/common.yaml`, and more can be added here.
```
include base_config::base_packages
```
## base_config::dotfiles
Copies dotfiles specified by `base_config::base_packages::files` from this module's `files/` directory to the user's home directory.  For now this is limited to only dotfiles in the current user's directory, but could be expanded upon.  My dotfiles are provided as an example, but you'll probably want to use your own.
```
include base_config::dotfiles
```
## base_config::vim_config
Copies `.vimrc` and `init.vim` config files from the `files/` directory to the user's home directory and xdg config directory, respectively.  Using `nvim` defaults to `true`, but can be overridden by setting `$prefer_nvim` to `false` in hiera.  Like dotfiles, my rc files are provided as an example.
```
include base_config::vim_config
```

