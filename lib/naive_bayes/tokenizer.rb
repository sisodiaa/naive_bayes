require 'stopwords'
require 'lingua/stemmer'

module NaiveBayes
  # Processing sentences
  module Tokenizer
    def tokenize(data)
      downcased = data.downcase
      splitted = splitter downcased
      stopped = stopper splitted
      stemmed = stemmer stopped
      stemmed.reject { |word| word.size < 2 }
    end

    # Remove URLs, mentions, and non words characters
    def splitter(data)
      data.split(%r{(?:@)[^\s]+|(?:http)s?:\/[^\s]+|\W}).reject(&:empty?)
    end

    def stopper(data)
      filter = Stopwords::Snowball::Filter.new 'en'
      filter.filter data
    end

    def stemmer(data)
      stemmed = Lingua.stemmer data
      stemmed.is_a?(Array) ? stemmed : [stemmed]
    end
  end
end
