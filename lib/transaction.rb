require "json"
require "digest"

class Transaction

  def self.coinbase(public_key)
    inputs    = []
    outputs   = []

    raw_json  = { 'amount' => 25, 'address' => "#{public_key}" }.to_json
    outputs   << JSON.parse(raw_json)
    timestamp = (Time.now.to_f * 1000).to_i

    inputs_string      = inputs.map { |i| i["source_hash"] + i["source_index"].to_s + i["signature"] }.join
    outputs_string     = outputs.map { |i| i["amount"].to_s + i["address"] }.join
    transaction_string = inputs_string + outputs_string + timestamp.to_s
    txn_hash           = Digest::SHA256.hexdigest(transaction_string)
  end

end
