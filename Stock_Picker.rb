
=begin

### THE PROBLEM ###
###################

Take an array of stock prices.  The index of each price value in the array represents the day at which the stock being considered was that price.
The first price in the array is day 0, the second price listed is day 1, and so on...

Write a program that considers all the stock prices in the array and returns which day you should have bought the stock and which day you should have sold
the stock in order to have generate the most revenue.

### THE PLAN ###
################

This program will be run from the command line.

The program takes one input, an array listing stock prices over a series of days. the user should input this array as a parameter to the method.

The program will return a pair of days (i.e. the index values) for when you should have bought and sold the stock, based on the price values that would provide
the largest profit.

### THE ALGORITHM ###
#####################

The input list of prices will be stored in a local variable called 'stock_prices'. 

The values in 'stock_prices' must be compared to itself, pairing every value with every other value in the list, in order to determine which two values 
have the greatest difference.  The value pair that has the greatest (positive value) difference between them represents the largest profit return.

store the comparison pairs as nested arrays in a new array with the name 'comparison'.

loop through 'comparison' to look at each nested array of value pairs

    Only value pairs in which the low price in the pair has an index value in 'stock_prices' that is lower than the high price index value 'stock_prices' 
    should be considered, because you cannot buy a stock in the future and sell it in the past 
        - if this condition is not true for a given itoration in the loop, skip to the next itoration.
        - if the condition is true, push the value pair into a new array called 'valid_comparisons'

filter 'valid_comparisons' to remove duplicate pairs and any value pairs that have a negative value difference (loss of money) - call a bang method to mutate.

calculate the differences between each value pair store these values in a new array called 'profits_per_comparison'

the largest value in 'profits_per_comparison' is the profit that would be earned from the optimal buy / sell day. The index for the maximum value in 
profits_per_comparison will match the index for the two days it represents in valid_comparisons (because its was mapped). use this to identify the two prices
that will give the highest profit - return the index of those two price in the original given array 'stock_prices' (thus getting the day the stock was that price).

store the 'stock_prices' index values for both the first value in 'buy_sell_prices' and the second value in 'buy_sell_prices' in a new variable 'buy_sell_days". 
return 'buy_sell_days'. It's values are the days in which you should have bought and sold the stock.

=end

require 'pry'

def stock_picker(stock_prices)
    comparison = stock_prices.product(stock_prices)
    valid_comparisons = []

    comparison.each do |pair|
        if stock_prices.index(pair[0]) > stock_prices.index(pair[1])
            next
        else
            valid_comparisons.push(pair)
        end
    end
    valid_comparisons.uniq!.select! { |pair| (pair[1] - pair[0]) > 0 }
    profits_per_comparison = valid_comparisons.map { |pair| pair[1] - pair[0] }
    buy_sell_prices = valid_comparisons[profits_per_comparison.index(profits_per_comparison.max)]
    buy_sell_days = [stock_prices.index(buy_sell_prices[0]), stock_prices.index(buy_sell_prices[1])]
end
puts stock_picker([17,3,6,9,8,4,2,6,15,8,18,1,10])

def stock_picker2(stock_prices)
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
puts puts
puts stock_picker2([17,3,6,9,8,4,2,6,15,8,18,1,10])

