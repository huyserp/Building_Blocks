def stock_picker(stock_prices)
    day_comparisons = stock_prices.combination(2).to_a
    buy_sell_profit_report = []
    profits = []

    day_comparisons.each do |startday, endday|
        if startday >= endday
            next
        else
            growth = endday - startday
            results = [stock_prices.index(startday), stock_prices.index(endday), growth]
            buy_sell_profit_report.push(results)
        end
    end
    
    buy_sell_profit_report.each do |buy, sell, profit|
        profits.push(profit)
    end
    
    best_earnings = profits.index(profits.max)
    best_buy_sell_days = buy_sell_profit_report[best_earnings]
    best_buy_sell_days.pop
    best_buy_sell_days
    
end

puts stock_picker([17,3,6,9,8,4,2,6,15,8,18,1,10])

