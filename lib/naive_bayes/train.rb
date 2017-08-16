module NaiveBayes
  # Trainig naive bayesian model
  module Train
    def train(category, text)
      categories_table[category] += 1
      tokens = tokenize(text)
      category_tokens(category, tokens)
      tokens_category_count(category, tokens)
    end

    def category_tokens(category, tokens)
      categories[category].merge(tokens)
    end

    def tokens_category_count(category, tokens)
      tokens.each do |token|
        if token_with_category?(token, category)
          tokens_table[token][category] += 1
        else
          add_token_to_category(token, category)
        end
      end
    end

    def add_token_to_category(token, category)
      tokens_table[token] = {} unless tokens_table.key?(token)
      tokens_table[token][category] = 1
    end

    def assign_weights
      tokens_weight.each do |token, distribution|
        distribution.each do |category, frequency|
          # La Placian Smoothing
          # Adding one to numerator
          num = frequency + 1
          tokens_weight[token][category] = num / la_placian_denominator(category)
        end
      end
    end
  end
end
