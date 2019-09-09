module CryptoHelper
  def coin_name_helper_check(coin_name)
    if coin_name == "binance-coin"
       coin_name = "binancecoin"

    elsif coin_name == "bitcoin-sv"
      coin_name = "bitcoin-cash-sv"

    elsif coin_name == "unus-sed-leo"
      coin_name = "leo-token"

    elsif coin_name == "crypto.com-chain"
      coin_name = "crypto-com-chain"

    elsif coin_name == "paxos-standard-token"
      coin_name = "paxos-standard"
    elsif coin_name == "bittorrent"
      coin_name = "bittorrent-2"
    elsif coin_name == "nash-exchange"
      coin_name = "neon-exchange"
    elsif coin_name == "xrp"
      coin_name = "ripple"
    elsif coin_name == "trueusd"
      coin_name = "true-usd"
    elsif coin_name == "holo"
      coin_name = "holotoken"
    elsif coin_name == "hypercash"
      coin_name = "hshare"
    elsif coin_name == "abbc-coin"
      coin_name = "alibabacoin"
    elsif coin_name == "maximine-coin"
      coin_name = "maximine"
    elsif coin_name == "quant"
      coin_name = "quant-network"
    elsif coin_name == "enjin-coin"
      coin_name = "enjincoin"
    elsif coin_name == "zb"
      coin_name = "zb-token"
    elsif coin_name == "status-network-token"
      coin_name = "status"
    elsif coin_name == "crypto.com"
      coin_name = "monaco"
    elsif coin_name == "synthetix-network-token"
      coin_name = "havven"
    elsif coin_name == "cryptoindex.com-100"
      coin_name = "cryptoindex-io"
    elsif coin_name == "walton"
      coin_name = "waltonchain"
    end

    return coin_name
end

def coin_symbol_helper_check(coin_symbol)
  if coin_symbol == "IOTA"
    coin_symbol = "MIOTA"
  elsif coin_symbol == "NEM"
    coin_symbol = "XEM"
  end
      return coin_symbol
end

def coin_name_chart_helper_check(coin_name)
  if coin_name == "bchsv-bitcoin-sv"
    coin_name = "bsv-bitcoin-sv"
  elsif coin_name == "leo-unus-sed-leo"
    coin_name = "leo-leo-token"
  elsif coin_name == "iota-iota"
    coin_name = "miota-iota"
  elsif coin_name == "nem-nem"
    coin_name = "xem-nem"
  elsif coin_name == "cro-crypto.com-chain"
    coin_name = "cro-cryptocom-chain"
  elsif coin_name == "iost-iostoken"
    coin_name = "iost-iost"
  elsif coin_name == "nex-nash-exchange"
    coin_name = "nex-nash-exchange-token"
  elsif coin_name == "abbc-abbc-coin"
    coin_name = "abbc-alibabacoin"
  elsif coin_name == "snt-status-network-token"
    coin_name = "snt-status"
  elsif coin_name == "mco-crypto.com"
    coin_name = "mco-mco"
  elsif coin_name == "snx-synthetix-network-token"
    coin_name = "hav-havven"
  elsif coin_name == "cix100-cryptoindex.com-100"
    coin_name = "cix100-cryptoindexcom-100"
  elsif coin_name == "wtc-walton"
    coin_name = "wtc-waltonchain"
  end
  return coin_name
end



####################################################### API FUNCTION #############################################
require 'net/http'
  def api_request(url)
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    return response
  end
end
