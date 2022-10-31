module PasswordUtil
  class ConfigurationError < StandardError; end;

  UPPER_LETTERS = ('A'..'Z').to_a.freeze
  LOWER_LETTERS = ('a'..'z').to_a.freeze
  NUMBERS = ('0'..'9').to_a.freeze
  SYMBOLS = %w[~ ` ! @ # $ % ^ & * ( ) _ - + = { \[ } \] | \\ : ; " ' < , > . ? /].freeze

  def self.generate
    charset = []
    password = []

    if has_lower_letters
      charset << LOWER_LETTERS
      min_lower_letters.times do
        password << LOWER_LETTERS.sample
      end
    end

    if has_upper_letters
      charset << UPPER_LETTERS
      min_upper_letters.times do
        password << UPPER_LETTERS.sample
      end
    end

    if has_numbers
      charset << NUMBERS
      min_numbers.times do
        password << NUMBERS.sample
      end
    end

    if has_symbols
      charset << SYMBOLS
      min_symbols.times do
        password << SYMBOLS.sample
      end
    end

    password.shuffle!
    fail ConfigurationError('No usable character set.') if charset.empty?
    password << charset.sample.sample while password.length < password_length
    password.join('')[0...password_length]
  end

  singleton_class.attr_accessor :password_length
  self.password_length = 8

  singleton_class.attr_accessor :has_lower_letters
  self.has_lower_letters = true

  singleton_class.attr_accessor :min_lower_letters
  self.min_lower_letters = 1

  singleton_class.attr_accessor :has_upper_letters
  self.has_upper_letters = true

  singleton_class.attr_accessor :min_upper_letters
  self.min_upper_letters = 1

  singleton_class.attr_accessor :has_numbers
  self.has_numbers = true

  singleton_class.attr_accessor :min_numbers
  self.min_numbers = 1

  singleton_class.attr_accessor :has_symbols
  self.has_symbols = true

  singleton_class.attr_accessor :min_symbols
  self.min_symbols = 1
end
