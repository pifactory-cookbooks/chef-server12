# chef_server12

Installs and configures standalone Chef Server 12.

## Supported Platforms

- ubuntu 14.04

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['chef-server']['download_url']</tt></td>
    <td>String</td>
    <td>Download URL for the server package</td>
    <td>https://web-dl.packagecloud.io/chef/stable/packages/ubuntu/trusty/chef-server-core_12.0.2-1_amd64.deb</td>
  </tr>
  <tr>
      <td><tt>['chef-server']['...']</tt></td>
      <td>...</td>
      <td>See attributes/default.rb for more attributes</td>
      <td>...</td>
    </tr>
</table>

## Usage

### chef_server12::default

Include `chef-server12` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[chef-server12::default]"
  ]
}
```

### chef_server12::web-ui

Installs Chef management console to manage data bags, attributes, run-lists, roles, environments,
and cookbooks from a web user interface. Includes default recipe.

### chef_server12::push-jobs-server

Installs Chef push jobs to run jobs—an action or a command to be executed —
against nodes independently of a chef-client run. Includes default recipe.

### chef_server12::reporting

Installs Chef replication to asynchronously distribute cookbook, environment,
role, and data bag data from a single, primary Chef server to one (or more)
replicas of that Chef server. Includes default recipe.

### chef_server12::backup_scripts

Installs backup scripts on the server.

## License and Authors

Author:: Alexander Dvorkovyy
