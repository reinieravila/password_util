module PasswordUtil
  module CharacterSets
    UPPER_LETTERS = ('A'..'Z').to_a.freeze
    LOWER_LETTERS = ('a'..'z').to_a.freeze
    NUMBERS = ('0'..'9').to_a.freeze
    SYMBOLS = %w[~ ` ! @ # $ % ^ & * ( ) _ - + = { \[ } \] | \\ : ; " ' < , > . ? /].freeze
  end
end
