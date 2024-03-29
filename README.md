# PasswordUtil

## Installation:

```
gem install password_util

# File: Gemfile
gem 'password_util'
```

## Usage:

In Ruby:
```
require 'password_util'

# Default Length: 8
PasswordUtil.generate
```

As executable:
```
# ENV vars:
#   - LENGTH=<number>
#   - UPPER_LETTERS=<0: off | 1: on>
#   - LOWER_LETTERS=<0: off | 1: on>
#   - NUMBERS=<0: off | 1: on>
#   - SYMBOLS=<0: off | 1: on>

LENGTH=4 password_util
# Aa1!

SYMBOLS=0 LENGTH=4 password_util
# 1Xn2
```

## Configuration:

For Rails, configuration can be placed in `config/initializers/password_util.rb`.

```
# NOTE: All values assigned below are the default values

# Sets the length of the password
PasswordUtil.password_length = 8

# Password will contain lower letters
PasswordUtil.has_lower_letters = true

# Minimum number of lower letters
PasswordUtil.min_lower_letters = 1

# Password will contain upper letters
PasswordUtil.has_upper_letters = true

# Minimum number of upper letters
PasswordUtil.min_upper_letters = 1

# Password will contain numbers
PasswordUtil.has_numbers = true

# Minimum number of numbers
PasswordUtil.min_numbers = 1

# Password will contain symbols
PasswordUtil.has_symbols = true

# Minimum number of symbols
PasswordUtil.min_symbols = 1
```
