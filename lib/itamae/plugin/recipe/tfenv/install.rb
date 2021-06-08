# frozen_string_literal: true

package "git"

scheme = node[:tfenv][:scheme]
tfenv_root = node[:tfenv][:tfenv_root]

git tfenv_root do
  repository "#{scheme}://github.com/tfutils/tfenv.git"
  user node[:tfenv][:user] if node[:tfenv][:user]
end

directory File.join(tfenv_root, "plugins") do
  user node[:tfenv][:user] if node[:tfenv][:user]
end

tfenv_init = <<-TFENV_INIT
  export TFENV_ROOT=#{tfenv_root}
  export PATH="#{tfenv_root}/bin:${PATH}"
TFENV_INIT

node[:tfenv][:versions].each do |version|
  execute "tfenv install #{version}" do
    command "#{tfenv_init} tfenv install #{version}"
    not_if  "#{tfenv_init} tfenv versions | grep #{version}"
    user node[:tfenv][:user] if node[:tfenv][:user]
  end
end
