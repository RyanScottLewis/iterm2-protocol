# ITerm2::Protocol

A wrapper for the iTerm2 xterm protocol extensions.

## Install

### Bundler: `gem "iterm2-protocol"`

### RubyGems: `gem install iterm2-protocol`

## Usage

### Print an Image to Standard Output

```rb
require "iterm2/protocol"

puts ITerm2::Protocol.image(path: path)
```

## Copyright

Copyright © 2016 Ryan Scott Lewis <ryan@rynet.us>.

The MIT License (MIT) - See `LICENSE.md` for further details.
