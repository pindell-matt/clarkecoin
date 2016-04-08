require_relative 'keygen'

class Wallet
  attr_reader :key, :file_path, :wallet_path, :public_key

  def initialize(file_path)
    @key         = KeyGen.new
    @file_path   = Dir.pwd + file_path
    @wallet_path = @file_path + "/.wallet"

    create_wallet_directory unless wallet_exists?
    create_keys
  end

  def create_keys
    create_public_key_pem
    create_private_key_pem
  end

  def create_wallet_directory
    FileUtils.mkdir(wallet_path)
  end

  def create_public_key_pem
    @public_key = key.public_key_pem
    File.write("#{wallet_path}/public_key.pem", public_key)
  end

  def create_private_key_pem
    private_key = key.private_key_pem
    File.write("#{wallet_path}/private_key.pem", private_key)
  end

  def wallet_exists?
    File.directory?(wallet_path)
  end

end
