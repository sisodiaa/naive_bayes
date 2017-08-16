# Naive Bayes Text Classifier

Naive Bayes classification method is a supervised learning algorithm. It applies Bayes' theorm with the "naive" assupmtion of independence between every pair of features.

You can learn more about this method at [MonkeyLearn blog on Naive Bayes Classifier](https://monkeylearn.com/blog/practical-explanation-naive-bayes-classifier).

## Usage

Clone this repository 
		$ git clone https://github.com/sisodiaa/naive_bayes.git

Change the directory
		$ cd naive_bayes

Run Bundler console
		$ bundler console

Assign a tweet to a variable
		$ str = "Intel diversity report shows progress is tough to measure http://cnet.co/2x3aGmB"

Run
		$ NaiveBayes.classifier(dataset: 'data/tweets.csv', delimiter: ';', percent: 80, categories: ['technology', 'travel', 'news'], text: str)

You wull learn more about its usage in the meet-up.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/naive_bayes. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

