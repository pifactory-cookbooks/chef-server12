# chef-server12-cookbook

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
    <td><tt>['chef-server']['create-user']</tt></td>
    <td>Boolean</td>
    <td>Create user after install</td>
    <td>true</td>
  </tr>
  <tr>
      <td><tt>['chef-server']['...']</tt></td>
      <td>...</td>
      <td>See attributes/default.rb for more attributes</td>
      <td>...</td>
    </tr>
</table>

## Usage

### chef-server12::default

Include `chef-server12` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[chef-server12::default]"
  ]
}
```

### chef-server12::backup_scripts

Installs backup scripts on the server.

Include `chef-server12::backup_scripts` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[chef-server12::backup_scripts]"
  ]
}
```

## License and Authors

Author:: Alexander Dvorkovyy
