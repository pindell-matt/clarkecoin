require 'base64'
require 'openssl'

class KeyGen
  attr_reader :private_key_pem, :public_key_pem

  def initialize
    @key             = generate_private_key
    @private_key_pem = @key.to_pem
    @public_key_pem  = generate_public_key.to_pem
  end

  def generate_public_key
    @key.public_key
  end

  private

  def generate_private_key
    OpenSSL::PKey::RSA.generate(2048)
  end

end
