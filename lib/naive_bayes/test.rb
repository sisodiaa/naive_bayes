module NaiveBayes
  # Test naive bayesian model
  module Test
    def test(category, text)
      tokens = tokenize(text)
      weights = calculate_weights(tokens)
      sort_weights(weights).first.keys.first == category
    end

    def calculate_weights(tokens)
      categories.keys.map do |category|
        category_weight = Math.log(categories_weight(category))
        Hash[category, weight(tokens, category, category_weight)]
      end
    end

    def weight(tokens, category, category_weight)
      tokens.reduce(category_weight) do |acc, token|
        acc + Math.log(token_weight(token, category))
      end
    end

    def token_weight(token, category)
      bool = token_with_category?(token, category)
      bool ? tokens_weight[token][category] : 1 / la_placian_denominator(category)
    end

    def sort_weights(weights)
      weights.sort { |x, y| y.values[0] <=> x.values[0] }
    end
  end
end
