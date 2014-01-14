[![Build Status](https://secure.travis-ci.org/LambdaHub/lambdahub-content.png)](http://travis-ci.org/LambdaHub/lambdahub-content)

### Copyright

Copyright &copy; LambdaHub contributors

All content is triple-licensed:
[MIT](LICENSES/LICENSE-MIT.txt),
[ODbL](http://opendatacommons.org/licenses/odbl/),
[CC BY 4.0](http://creativecommons.org/licenses/by/4.0/deed.en_US)


### Function Example

```coffee
name: 'split'
args: [
  {name: 's',         type: 'unicode'}
  {name: 'delimiter', type: 'non-empty unicode'}
]
returns:              {type: 'unicode-list'}
code: {
  js:       's.split(delimiter)'
  ruby:     's.split(delimiter)'
  python:   's.split(delimiter)'
  java:     's.split(Pattern.quote(delimiter))'
  objc:     '[s componentsSeparatedByString:delimiter]'
}
unit_tests: [
  {args: ['a:b:c', ':'], result: ['a', 'b', 'c']}
  {args: ['foobar', 'ob'], result: ['fo', 'ar']}
  {args: ['a', ':'], result: ['a']}
  {args: ['a:', ':'], result: ['a', '']}
  {args: [':a', ':'], result: ['', 'a']}
  {args: ['', ':'], result: ['']}
  {args: [':', ':'], result: ['', '']}
]
```

### Encoding Example

    TODO
