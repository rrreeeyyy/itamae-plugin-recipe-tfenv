# frozen_string_literal: true

node.reverse_merge!(
  tfenv: {
    scheme: "git",
    tfenv_root: "/usr/local/tfenv",
    versions: []
  }
)

include_recipe "tfenv::install"
