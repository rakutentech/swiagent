# swiagent Cookbook CHANGELOG

## 0.2.4

- Changed the guard on the resource that configures the swiagent, to not run if the swiagent.cfg has the correct FQDN.
  This is because it would not update the configuration if the process was running, which is a problem when you want to swap between solarwinds instances.

## 0.2.3

- Added CONTRIBUTING.md

## 0.2.2

- Removed mentions of Rakuten from within the cookbook

## 0.2.1

- Updated the README to contain documentation for the new 'ssl' option

## 0.2.0

- Updated the swiagent resource with a new option 'ssl' in order to support http or https URIs

## 0.1.6

- Updated the README.md

## 0.1.5

- Added \n to the end of bash command in swiagent resource

## 0.1.3 & 0.1.4

- Added testing.md

## 0.1.2

- Updated the README.md to have the correct cookbook version info

## 0.1.1

- Added a chefspec test for when action :remove is run

## 0.1.0

- Initial release.
