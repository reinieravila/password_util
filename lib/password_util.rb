module PasswordUtil
  ##
  # Configuration exception.
  class ConfigurationError < StandardError; end

  UPPER_LETTERS = ('A'..'Z').to_a.freeze
  LOWER_LETTERS = ('a'..'z').to_a.freeze
  NUMBERS = ('0'..'9').to_a.freeze
  SYMBOLS = %w[~ ` ! @ # $ % ^ & * ( ) _ - + = { \[ } \] | \\ : ; " ' < , > . ? /].freeze

  ##
  # Validates configuration.
  #
  # @return [String] the generated password
  def self.validate_config!
    boolean_classes = [TrueClass, FalseClass]

    raise ConfigurationError, 'password_length: expected Integer' unless password_length.is_a?(Integer)
    raise ConfigurationError, 'has_lower_letters: expected Boolean' unless boolean_classes.include?(has_lower_letters.class)
    raise ConfigurationError, 'min_lower_letters: expected Integer' unless min_lower_letters.is_a?(Integer)
    raise ConfigurationError, 'has_upper_letters: expected Boolean' unless boolean_classes.include?(has_upper_letters.class)
    raise ConfigurationError, 'min_upper_letters: expected Integer' unless min_upper_letters.is_a?(Integer)
    raise ConfigurationError, 'has_numbers: expected Boolean' unless boolean_classes.include?(has_numbers.class)
    raise ConfigurationError, 'min_numbers: expected Integer' unless min_numbers.is_a?(Integer)
    raise ConfigurationError, 'has_symbols: expected Boolean' unless boolean_classes.include?(has_symbols.class)
    raise ConfigurationError, 'min_symbols: expected Integer' unless min_symbols.is_a?(Integer)

    raise ConfigurationError, 'No usable character set.' unless has_lower_letters || has_upper_letters || has_numbers || has_symbols
  end

  ##
  # Resets configuration to default.
  def self.reset_config
    self.password_length = 8
    self.has_lower_letters = true
    self.min_lower_letters = 1
    self.has_upper_letters = true
    self.min_upper_letters = 1
    self.has_numbers = true
    self.min_numbers = 1
    self.has_symbols = true
    self.min_symbols = 1
  end

  ##
  # Generates password.
  #
  # @return [String] the generated password
  def self.generate
    validate_config!
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
