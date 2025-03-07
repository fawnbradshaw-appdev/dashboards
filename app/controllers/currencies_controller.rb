class CurrenciesController < ApplicationController

def first_currency

  @raw_data = open("https://api.exchangerate.host/symbols").read

  @parsed_data = JSON.parse(@raw_data)
  @symbols_hash = @parsed_data.fetch("symbols")

  @array_of_symbols = @symbols_hash.keys


  render({ :template => "currency_templates/step_one.html.erb"})
  
end



def second_currency

  @raw_data = open("https://api.exchangerate.host/symbols").read

  @parsed_data = JSON.parse(@raw_data)
  @symbols_hash = @parsed_data.fetch("symbols")

  @array_of_symbols = @symbols_hash.keys

  @from_symbol = params.fetch("from_currency")



  render({ :template => "currency_templates/step_two.html.erb"})
  
end

def conversion

  @from_symbol = params.fetch("from_currency")
  @to_symbol = params.fetch("to_currency")
  

  @conversion_data = open("https://api.exchangerate.host/convert?from=" + @from_symbol+"&to="+@to_symbol).read

  @parsed_data = JSON.parse(@conversion_data)

  @conversion_hash = @parsed_data.fetch("info")


  @conversion_amount = @conversion_hash.fetch("rate")

  render({ :template => "currency_templates/conversion.html.erb"})
  
end

end
