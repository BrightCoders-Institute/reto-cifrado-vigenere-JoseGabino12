# rubocop:disable Style/FrozenStringLiteralComment
# Class to encrypt a message using the Vigenere cipher
# rubocop:enable Style/FrozenStringLiteralComment
class Cifrado
  def initialize(key, message)
    @key = key.upcase
    @message = message.upcase
  end

  # Convert the message and key to numbers
  def convert_to_numbers(message, key)
    message_numbers = []
    key_numbers = []

    message.each_char do |char|
      message_numbers << char.ord - 65
    end

    key.each_char do |char|
      key_numbers << char.ord - 65
    end

    [message_numbers, key_numbers]
  end

  # Repeat the key to match the message length
  def repeat_key(message, key)
    key * (message.length / key.length + 1)
  end

  # Encrypt the message
  def encrypt(message, key)
    encrypted_message = ''
    encrypted_numbers = []

    message.each_with_index do |number, index|
      encrypted_numbers << (number + key[index]) % 26
    end

    encrypted_numbers.each do |number|
      encrypted_message << (number + 65).chr
    end

    encrypted_message
  end
end

key = 'SECRETO'
message = 'HOLA'

encrypted = Cifrado.new(key, message)
message_numbers, key_numbers = encrypted.convert_to_numbers(message, key)
key_repeated = encrypted.repeat_key(message_numbers, key_numbers)

puts "Message: #{message}"
puts "Key: #{key} \n\n"
puts encrypted.encrypt(message_numbers, key_repeated)
