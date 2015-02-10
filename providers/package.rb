use_inline_resources

def load_current_resource
  @current_resource = {
      :is_installed => shell_out("which opscode-#{new_resource.name}-ctl").exitstatus == 0
  }
end

action :enable do
  unless @current_resource[:is_installed]
    execute "install-#{new_resource.name}" do
      command "chef-server-ctl install opscode-#{new_resource.name}"
    end
  end

  if new_resource.config_file
    etc_dir =
        if new_resource.config_dir
          new_resource.config_dir
        else
          "/etc/opscode-#{new_resource.name}"
        end

    directory etc_dir

    template "#{etc_dir}/#{new_resource.config_file}" do
      source "#{new_resource.config_file}.erb"

      if current_resource[:is_installed]
        notifies :run, "execute[reconfigure-#{new_resource.name}]", :immediately
      end
    end
  end

  execute "reconfigure-#{new_resource.name}" do
    command "opscode-#{new_resource.name}-ctl reconfigure"

    if current_resource[:is_installed]
      action :nothing
    end
  end
end