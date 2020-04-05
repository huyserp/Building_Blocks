def stock_picker(stock_prices)
    day_comparisons = stock_prices.combination(2).to_a
    buy_sell_profit = []

    day_comparisons.each do |startday, endday|
        if startday >= endday
            next
        else
            growth = endday - startday
            results = [stock_prices.index(startday), stock_prices.index(endday), growth]
            buy_sell_profit.push(results)
        end
    end

end

puts stock_picker([17,3,6,9,15,8,6,1,10])

