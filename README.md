# swiagent

[![Cookbook Version](https://img.shields.io/cookbook/v/swiagent.svg)](https://supermarket.chef.io/cookbooks/swiagent)
[![License](https://img.shields.io/badge/License-Apache%202.0-green.svg)](https://opensource.org/licenses/Apache-2.0)

## Purpose

This cookbook provides a resource to download and install the swiagent from Solarwinds Orion on target Linux servers.


## Resource: swiagent

### Actions

| Action  | Description                                              |
| ------- | -------------------------------------------------------- |
| install | Downloads, installs and possibly configures the swiagent |
| remove  | Removes the swiagent and related repositories            |

### Properties

| Properties | Description              | Type    | Values and Default                                   |
| ---------- | -------------------------| --------| ---------------------------------------------------- |
| fqdn       | FQDN of the Orion server | String  | Required, no default                                 |
| port       | Port for swiagent to use | Integer | Required, default is 17778                           |
| username   | Orion admin username     | String  | Desired_state is false, identity is true, no default |
| password   | Orion admin password     | String  | Desired_state is false, sensitve is true, no default |

### Example Usage

```ruby
swiagent 'install swiagent' do
  fqdn     'orion.solarwinds.com'
  username 'admin'
  password 'mypassword'
end
```

```ruby
swiagent 'remove swiagent' do
  action :remove
end
```

## Authors

- Contributor: Rolf Fujino
