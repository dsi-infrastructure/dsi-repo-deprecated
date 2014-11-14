# chef-caimito-cookbook

 Chef cookbook to install and configure caimito webdav 0.11

## Supported Platforms

 Ubuntu/Debian

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['chef-caimito']['download_url']</tt></td>
    <td>String</td>
    <td>where to include wget caimito 0.11</td>
    <td><tt>http://caimito-download.ngasi.com/caimito/caimito_64b.zip</tt></td>
  </tr>
  <tr>
    <td><tt>['chef-caimito']['prefix']</tt></td>
    <td>String</td>
    <td>where to install caimito</td>
    <td><tt>/usr/loca/bin</tt></td>
  </tr>
  <tr>
    <td><tt>['chef-caimito']['admin']</tt></td>
    <td>Strings</td>
    <td>admin login/password </td>
    <td><tt>caimitoadmin/caimito</tt></td>
  </tr>
  <tr>
    <td><tt>['chef-caimito']['resource']</tt></td>
    <td>Hash</td>
    <td>where to install caimito</td>
    <td><tt>{"type":"file", "file":{"resource.dir":"/usr/local/bin/caimito/drive"}}</tt></td>
  </tr>
  <tr>
    <td><tt>['chef-caimito']['ldap']</tt></td>
    <td>Hash</td>
    <td>ldap authentification</td>
    <td><tt>{"enable":false}</tt></td>
  </tr>
</table>

## Usage

### chef-caimito::default

Include `chef-caimito` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[chef-caimito::default]"
  ]
}
```

## License and Authors

Author:: PE, pf. (<peychart@mail.pf>)
