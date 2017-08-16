require 'naive_bayes/tokenizer'
require 'naive_bayes/train'
require 'naive_bayes/test'
require 'naive_bayes/utils'

module NaiveBayes
  # Naive Bayes state and method
  class TextClassifier
    include Train
    include Test
    include Tokenizer
    include Utils

    attr_reader :categories, :tokens_table, :categories_table

    def initialize(categories)
      @categories = Hash[categories.collect { |v| [v, Set.new] }]
      @tokens_table = {}
      @categories_table = Hash[categories.collect { |v| [v, 0] }]
    end

    def train_data(dataset)
      trainer(dataset)
      assign_weights
    end

    def trainer(dataset)
      dataset.each do |row|
        category = row[0]
        text = row[1]
        train(category, text) if categories.key?(category)
      end
    end

    def test_data(dataset)
      # array of booleans values signifying positive or negative test results
      results = tester(dataset).reject { |v| v == false }
      Float(results.size) / dataset.size # returns accuracy
    end

    def tester(dataset)
      dataset.map do |row|
        category = row[0]
        text = row[1]
        test(category, text)
      end
    end

    def predict(text)
      tokens = tokenize(text)
      weights = calculate_weights(tokens)
      top_weight = sort_weights(weights).first.to_a.first
      top_weight.first.capitalize
    end

    alias tokens_weight tokens_table
  end
end
