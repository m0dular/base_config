class base_config::dotfiles (
  $home,
  $files,
){
  $file_resources = $files.reduce({}) |$memo, $value| {
    $memo + { "${home}/$value" => { source => "puppet:///modules/base_config/${value}" } }
  }
  unless empty($file_resources) {
    create_resources(file, $file_resources)
  }
}
