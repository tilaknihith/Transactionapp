class TransactionsController < ApplicationController
  require 'httparty' 
  API_URL = 'https://quietstreamfinancial.github.io/eng-recruiting/transactions.json'.freeze
  def index
   response = fetch_transactions(API_URL)
    transactions = JSON.parse(response.body)
    @customer_summary = calculate_customer_summary(transactions)

  end
  private
  def fetch_transactions(url)
    HTTParty.get(url)
  end

  def calculate_customer_summary(transactions)
  customer_summary = Hash.new { |h, k| h[k] = { checking: 0, savings: 0, total: 0, customer_name: nil } }
    transactions.each do |transaction|
    customer_id = transaction['customer_id']
    amount = transaction['transaction_amount'].delete('$').to_f
    account_type = transaction['account_type'].to_sym

    customer_summary[customer_id][:customer_name] = transaction['customer_name']
    customer_summary[customer_id][account_type] += amount
    customer_summary[customer_id][:total] += amount
  end

  customer_summary
end

end
