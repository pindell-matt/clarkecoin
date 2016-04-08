require_relative './test_helper'
require 'fileutils'
require_relative '../lib/wallet.rb'

class WalletTest < Minitest::Test

  def setup
    @file_path = Dir.pwd + "/test/support/.wallet"
  end

  def teardown
    FileUtils.rm_rf(@file_path) if File.directory?(@file_path)
  end

  def test_can_create_wallet_directory
    refute File.directory?(@file_path)

    wallet = Wallet.new("/test/support")

    assert File.directory?(@file_path)
  end



end
