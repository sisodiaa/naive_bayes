require 'csv'

module NaiveBayes
  # Dataset module containing methods to load and split data
  module Dataset
    def self.load_and_split_dataset(dataset, delimiter, percent)
      dataset = load_data(dataset, delimiter)
      factor = Float(percent) / 100
      split(dataset, factor)
    end

    def self.load_data(data_file, delimiter)
      CSV.read(data_file, col_sep: delimiter, quote_char: '|', encoding: 'ISO-8859-1')
    rescue CSV::MalformedCSVError => e
      abort("Error: #{e}")
    end

    def self.split(dataset, factor)
      shuffled = dataset.shuffle
      partition_index = (dataset.size * factor).floor
      [shuffled[0..partition_index - 1], shuffled[partition_index..-1]]
    end
  end
end
