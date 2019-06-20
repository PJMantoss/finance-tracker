class Stock < ApplicationRecord
    def self.new_from_lookup(ticker_symbol)
        begin
            client=IEX::Api::Client.new(publishable_token:'pk_2c0aeff38fe04a53b5a83568040db1cb')
            looked_up_stock= client.quote(ticker_symbol)
            new(name: looked_up_stock.company_name, ticker:looked_up_stock.symbol, last_price: looked_up_stock.latest_price)
        rescue Exception => e
            return nil
        end
    end
end
