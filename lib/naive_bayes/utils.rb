module NaiveBayes
  # Common methods
  module Utils
    def category_size(category)
      Float(categories[category].size)
    end

    def token_with_category?(token, category)
      tokens_table.key?(token) && tokens_table[token].key?(category)
    end

    def la_placian_denominator(category)
      # La Placian Smoothing
      # Adding total number of possible words to denominator
      category_size(category) + tokens_table.size + 1
    end

    def categories_weight(category)
      num = Float(categories_table[category])
      den = categories_table.values.reduce(:+)
      num / den
    end
  end
end
