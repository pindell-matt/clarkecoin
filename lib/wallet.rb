require 'tmpdir'

class Wallet
  attr_reader :file_path, :wallet_path

  def initialize(file_path)
    @file_path   = Dir.pwd + file_path
    @wallet_path = @file_path + "/.wallet"
    create_wallet_directory unless wallet_exists?
  end

  def create_wallet_directory
    FileUtils.mkdir(wallet_path)
  end

  def wallet_exists?
    File.directory?(wallet_path)
  end

  # see if .wallet exists?
    # if .wallet does not exist -> create it + write private and public keys to file
      # print out contents of public key file

    # if .wallet DOES exist
      # check if it contains ~/.wallet/public_key.pem and ~/.wallet/private_key.pem
        # if yes, print out contents of public key file
        # else, create ~/.wallet/public_key.pem and ~/.wallet/private_key.pem
          # print out contents of public_key file

end

# def directory_exists?(directory)
#   File.directory?(directory)
# end

# arg for where to put the wallet
