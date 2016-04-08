require_relative './test_helper'
require_relative '../lib/keygen.rb'

class KeyGenTest < Minitest::Test

  def test_can_generate_private_key
    keygen      = KeyGen.new
    private_key = keygen.private_key_pem

    assert private_key.include?("BEGIN RSA PRIVATE KEY")
    assert private_key.include?("END RSA PRIVATE KEY")
  end

  def test_can_generate_public_key
    keygen      = KeyGen.new
    public_key = keygen.public_key_pem

    assert public_key.include?("BEGIN PUBLIC KEY")
    assert public_key.include?("END PUBLIC KEY")
  end

end
