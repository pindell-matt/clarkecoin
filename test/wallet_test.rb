require_relative './test_helper'
require 'fileutils'
require_relative '../lib/wallet.rb'

class WalletTest < Minitest::Test

  def setup
    @file_path = Dir.pwd + "/test/support/.wallet"
    FileUtils.rm_rf(@file_path) if File.directory?(@file_path)
  end

  # def teardown
  #   FileUtils.rm_rf(@file_path) if File.directory?(@file_path)
  # end

  def test_can_create_wallet_directory
    refute File.directory?(@file_path)

    wallet = Wallet.new("/test/support")

    assert File.directory?(@file_path)
  end

  def test_can_create_public_key_pem_file
    wallet          = Wallet.new("/test/support")
    public_key_path = @file_path + "/public_key.pem"

    assert File.exist?(public_key_path)
  end

  def test_can_create_private_key_pem_file
    wallet           = Wallet.new("/test/support")
    private_key_path = @file_path + "/private_key.pem"

    assert File.exist?(private_key_path)
  end

  def test_can_return_public_key
    wallet         = Wallet.new("/test/support")
    public_key_pem = wallet.public_key

    assert wallet.public_key.include?("BEGIN PUBLIC KEY")
  end

  def test_can_create_wallet_and_public_and_private_keys
    refute File.directory?(@file_path)

    wallet           = Wallet.new("/test/support")
    public_key_path  = @file_path + "/public_key.pem"
    private_key_path = @file_path + "/private_key.pem"

    assert File.directory?(@file_path)
    assert File.exist?(public_key_path)
    assert File.exist?(private_key_path)

    wallet.generate_coinbase
  end

end
