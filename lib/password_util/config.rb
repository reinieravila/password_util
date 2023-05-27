require_relative './character_sets'

module PasswordUtil
  DEFAULT_PASSWORD_LENGTH = 8
  DEFAULT_HAS_LOWER_LETTERS = true
  DEFAULT_MIN_LOWER_LETTERS = 1
  DEFAULT_HAS_UPPER_LETTERS = true
  DEFAULT_MIN_UPPER_LETTERS = 1
  DEFAULT_HAS_NUMBERS = true
  DEFAULT_MIN_NUMBERS = 1
  DEFAULT_HAS_SYMBOLS = true
  DEFAULT_MIN_SYMBOLS = 1

  class Config
    class ConfigurationError < StandardError; end

    attr_accessor :has_lower_letters, :has_numbers, :has_symbols, :has_upper_letters, :lower_letters, :min_lower_letters, :min_numbers, :min_symbols, :min_upper_letters, :numbers, :password_length, :symbols, :upper_letters

    def initialize(params)
      @upper_letters = params.fetch(:upper_letters, CharacterSets::UPPER_LETTERS)
      @lower_letters = params.fetch(:lower_letters, CharacterSets::LOWER_LETTERS)
      @numbers = params.fetch(:numbers, CharacterSets::NUMBERS)
      @symbols = params.fetch(:symbols, CharacterSets::SYMBOLS)

      @password_length = params.fetch(:password_length, DEFAULT_PASSWORD_LENGTH)

      @has_lower_letters = params.fetch(:has_lower_letters, DEFAULT_HAS_LOWER_LETTERS)
      @min_lower_letters = params.fetch(:min_lower_letters, DEFAULT_MIN_LOWER_LETTERS)

      @has_upper_letters = params.fetch(:has_upper_letters, DEFAULT_HAS_UPPER_LETTERS)
      @min_upper_letters = params.fetch(:min_upper_letters, DEFAULT_MIN_UPPER_LETTERS)

      @has_numbers = params.fetch(:has_numbers, DEFAULT_HAS_NUMBERS)
      @min_numbers = params.fetch(:min_numbers, DEFAULT_MIN_NUMBERS)

      @has_symbols = params.fetch(:has_symbols, DEFAULT_HAS_SYMBOLS)
      @min_symbols = params.fetch(:min_symbols, DEFAULT_MIN_SYMBOLS)
    end

    def validate!
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
  end
end
