# Forcifier [![Build Status](https://travis-ci.org/jeffdonthemic/forcifier.png?branch=master)](https://travis-ci.org/jeffdonthemic/forcifier) [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/jeffdonthemic/forcifier)

Forcifier is a gem that provides utility functions for dealing with Force.com fields to make them pretty and easier to work with.

## Key Features

1. 'Deforces' a list fields names so "`id,Name,Field1__c,field2__c`" is converted to "`id,name,field1,field2`".
2. 'Enforces' a list of fields names so "`id,name,field1,field2`" is converted to "`id,name,field1__c,field2__c`".
3. 'Deforces' JSON keys from Force.com so that all keys will be lowercase and will have "`__c`" removed. For example, fields such as 'First_Name__c' will be converted to 'first_name'.
4. 'Enforces' JSON keys so that all non-standard salesforce.com fields will be appended with "__c".

## Contributors

- [Jeff Douglas](https://github.com/jeffdonthemic) - Main developer, current maintainer.