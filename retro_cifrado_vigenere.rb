# Class to encrypt a message using the Vigenere cipher
class Cifrado
  def initialize(key, message)
    @key = key
    @message = message
  end

  def encrypt
    message = @message.upcase
    key = @key.upcase
    message_numbers = []
    key_numbers = []
    encrypted_numbers = []
    encrypted_message = ''

    message.each_char do |char|
      message_numbers << char.ord - 65
    end

    key.each_char do |char|
      key_numbers << char.ord - 65
    end

    key_numbers *= (message_numbers.length / key_numbers.length + 1)

    message_numbers.each_with_index do |number, index|
      encrypted_numbers << (number + key_numbers[index]) % 26
    end

    encrypted_numbers.each do |number|
      encrypted_message << (number + 65).chr
    end

    encrypted_message
  end
end

key = 'SECRETO'
message = 'HOLA'

cifrado = Cifrado.new(key, message)
puts cifrado.encrypt
