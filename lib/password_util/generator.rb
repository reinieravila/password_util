module PasswordUtil
  class Generator
    def initialize(config)
      @config = config
    end

    def generate
      config.validate!

      charset = []
      password = []

      if config.has_upper_letters
        charset << config.upper_letters
        config.min_upper_letters.times do
          password << config.upper_letters.sample
        end
      end

      if config.has_lower_letters
        charset << config.lower_letters
        config.min_lower_letters.times do
          password << config.lower_letters.sample
        end
      end

      if config.has_numbers
        charset << config.numbers
        config.min_numbers.times do
          password << config.numbers.sample
        end
      end

      if config.has_symbols
        charset << config.symbols
        config.min_symbols.times do
          password << config.symbols.sample
        end
      end

      password.shuffle!
      password << charset.sample while password.length < config.password_length
      password.join('')[0...config.password_length]
    end

    private

    attr_reader :config
  end
end
