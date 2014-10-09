cron-apt Cookbook
=================

Installs and configures cron-apt to automatically update system packages.


Requirements
------------
Platforms:

- Debian Wheezy
- Ubuntu 12.04
- Ubuntu 14.04

Dependencies:

- [cron](https://supermarket.getchef.com/cookbooks/cron) cookbook

Attributes
----------

- ``node['cron_apt']['minute']`` - Minute field for cron-apt cronjob
- ``node['cron_apt']['hour']`` - Hour field for cron-apt cronjob
- ``node['cron_apt']['day']`` - Day field for cron-apt cronjob
- ``node['cron_apt']['month']`` - Month field for cron-apt cronjob
- ``node['cron_apt']['weekday']`` - Day of week field for cron-apt cronjob

Usage
-----

### cron-apt::default

Include `cron-apt` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[cron-apt::default]"
  ]
}
```

License and Authors
-------------------

- Author:: Daniel Givens (<daniel@givens.io>)

```text
Copyright (C) 2014 Daniel Givens

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
