require_relative './password_util/config'
require_relative './password_util/generator'

module PasswordUtil
  singleton_class.attr_accessor :config
  self.config = Config.new({})

  class << self
    ##
    # Resets configuration to default.
    #
    def reset_config
      self.config = Config.new({})
    end

    ##
    # Generates password.
    #
    # @return [String] the generated password
    def generate
      Generator.new(config).generate
    end

    def has_lower_letters=(value)
      config.has_lower_letters = value
    end

    def has_numbers=(value)
      config.has_numbers = value
    end

    def has_symbols=(value)
      config.has_symbols = value
    end

    def has_upper_letters=(value)
      config.has_upper_letters = value
    end

    def lower_letters=(value)
      config.lower_letters = value
    end

    def min_lower_letters=(value)
      config.min_lower_letters = value
    end

    def min_numbers=(value)
      config.min_numbers = value
    end

    def min_symbols=(value)
      config.min_symbols = value
    end

    def min_upper_letters=(value)
      config.min_upper_letters = value
    end

    def numbers=(value)
      config.numbers = value
    end

    def password_length=(value)
      config.password_length = value
    end

    def symbols=(value)
      config.symbols = value
    end

    def upper_letters=(value)
      config.upper_letters = value
    end
  end
end
