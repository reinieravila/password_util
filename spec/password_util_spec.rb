require_relative '../lib/password_util'

RSpec.describe PasswordUtil do
  context 'with default config' do
    let(:password) { described_class.generate }

    it 'has 8 characters' do
      expect(password.length).to eq(8)
    end

    it 'contains at least 1 upper letter' do
      expect(password.split('')).to(be_any { PasswordUtil::CharacterSets::UPPER_LETTERS.include?(_1) })
    end

    it 'contains at least 1 lower letter' do
      expect(password.split('')).to(be_any { PasswordUtil::CharacterSets::LOWER_LETTERS.include?(_1) })
    end

    it 'contains at least 1 number' do
      expect(password.split('')).to(be_any { PasswordUtil::CharacterSets::NUMBERS.include?(_1) })
    end

    it 'contains at least 1 symbol' do
      expect(password.split('')).to(be_any { PasswordUtil::CharacterSets::SYMBOLS.include?(_1) })
    end
  end

  context 'when all character types are disabled' do
    before do
      described_class.has_lower_letters = false
      described_class.has_upper_letters = false
      described_class.has_numbers = false
      described_class.has_symbols = false
    end

    after do
      described_class.has_lower_letters = true
      described_class.has_upper_letters = true
      described_class.has_numbers = true
      described_class.has_symbols = true
    end

    it 'throws ConfigurationError: No usable character set.' do
      expect { described_class.generate }.to raise_error(PasswordUtil::Config::ConfigurationError, 'No usable character set.')
    end
  end
end
