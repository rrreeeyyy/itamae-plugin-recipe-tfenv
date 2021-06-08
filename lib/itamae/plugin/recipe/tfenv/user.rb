node.reverse_merge!(
  tfenv: {
    scheme:      'git',
    tfenv_root: File.join(ENV['HOME'], '.tfenv'),
    user:        ENV['USER'],
    versions:    [],
  },
)

include_recipe 'tfenv::install'
