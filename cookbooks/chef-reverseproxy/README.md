chef-reverseproxy Cookbook
==========================

This cookbook install and configure a reverse proxy http without mod_SSL

Requirements
------------

#### packages
- `apache2`
- `hostsfile`

Attributes
----------

Usage
-----
#### chef-reverseproxy::default

Just include `chef-reverseproxy` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[chef-reverseproxy]"
  ]
}
```
Create a data bag named reverseproxies:
```json
knife data bag create reverseproxies
```

Create also a data bag item named with the fqdn node ("node_example_com") with underscores in place of dot.
```json
knife data bag from file reverseproxies node_example_com.json
```


With node_example_com.json :

```json
{
  "id": "node_example_com",
  "members": "test.gov.pf , test2.gov.pf , test3.gov.pf",
  "test.gov.pf": {
    "server_name": "test.gov.pf",
    "server_name_proxy": "test.srv.gov.pf",
    "server_ip_proxy": "192.168.0.210"
  },
  "test2.gov.pf": {
    "server_name": "test2.gov.pf",
    "server_name_proxy": "test2.srv.gov.pf",
    "server_ip_proxy": "192.168.0.212"
  },
  "test3.gov.pf": {
    "server_name": "test3.gov.pf",
    "server_name_proxy": "test3.srv.gov.pf",
    "server_ip_proxy": "192.168.0.213"
  }
}
```


Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Stéphane LII
