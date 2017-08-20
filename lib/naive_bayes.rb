require 'naive_bayes/version'
require 'naive_bayes/dataset'
require 'naive_bayes/text_classifier'

# Classifier
module NaiveBayes
  def self.classifier(dataset:, delimiter:, percent:, categories:, text:)
    # Load data from CSV and split it into training and testing dataset
    data = Dataset.load_data(dataset, delimiter)
    training_data, test_data = Dataset.split(data, percent)

    # Initiate a naive bayes text classifier object with classes
    text_classifier = TextClassifier.new(categories)

    # Train naive bayes text classifier
    text_classifier.train_data(training_data)

    # Test naive bayes text classifier
    accuracy = text_classifier.test_data(test_data)

    # Predict class for given text
    prediction = text_classifier.predict(text)

    print_data(training_data.size, test_data.size, accuracy, prediction)
  end

  def self.print_data(train_size, test_size, accuracy, prediction)
    puts "Training Dataset Size: #{train_size}"
    puts "Test Dataset Size: #{test_size}"
    puts "Accuracy on test dataset: #{(accuracy * 100).round(2)}%"
    puts "Category: #{prediction}\n\n"
  end
end
