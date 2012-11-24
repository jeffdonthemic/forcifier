# Forcifier [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/jeffdonthemic/forcifier)

Forcifier is a gem that provides utility functions for dealing with Force.com fields to make them pretty and easier to work with.

## Key Features

1. 'Deforces' fields names so "`id,name,field1__c,field2__c`" is converted to "`id,name,field1,field2`".
2. 'Enforces' fields names so "`id,name,field1,field2`" is converted to "`id,name,field1__c,field2__c`".
3. 'Deforces' JSON from Force.com so that all keys will be lowercase and will have "`__c`" removed.

## Contributors

- [Jeff Douglas](https://github.com/jeffdonthemic) - Main developer, current maintainer.