import 'dart:math';
import 'package:get/get.dart';
import '../models/quote.dart';

class QuoteController extends GetxController {
  final List<Quote> quotes = [
    Quote(
      quote:
          'The only limit to our realization of tomorrow is our doubts of today.',
      author: 'Franklin D. Roosevelt',
      category: 'Motivational',
      details:
          'Franklin D. Roosevelt was the 32nd President of the United States.',
      imageUrl: 'assets/images/Franklin-D-Roosevelt-1937.webp',
    ),
    Quote(
      quote: 'An investment in knowledge pays the best interest.',
      author: 'Benjamin Franklin',
      category: 'Finance',
      details:
          'Benjamin Franklin was an American polymath and Founding Father.',
      imageUrl: 'assets/images/images (1).jpg',
    ),
    Quote(
      quote: 'Love all, trust a few, do wrong to none.',
      author: 'William Shakespeare',
      category: 'Romance',
      details: 'Shakespeare was an English playwright and poet.',
      imageUrl: 'assets/images/images.jpg',
    ),
    Quote(
      quote:
          'Success is not final, failure is not fatal: it is the courage to continue that counts.',
      author: 'Winston Churchill',
      category: 'Motivational',
      details:
          'Winston Churchill was the Prime Minister of the United Kingdom during World War II.',
      imageUrl: 'assets/images/imafges (2).jpg',
    ),
    Quote(
      quote:
          'Do not save what is left after spending, but spend what is left after saving.',
      author: 'Warren Buffett',
      category: 'Finance',
      details:
          'Warren Buffett is an American investor and philanthropist, known as the "Oracle of Omaha."',
      imageUrl: 'assets/images/licensed-image.jpg',
    ),
    Quote(
      quote: 'The best thing to hold onto in life is each other.',
      author: 'Audrey Hepburn',
      category: 'Romance',
      details:
          'Audrey Hepburn was a British actress and humanitarian, known for her timeless elegance and charm.',
      imageUrl: 'assets/images/licensed-image (1).jpg',
    ),
  ];

  final RxString selectedCategory = 'Motivational'.obs;
  final Rx<Quote> currentQuote = Quote(
    quote: '',
    author: '',
    category: '',
    details: '',
    imageUrl: '',
  ).obs;

  @override
  void onInit() {
    fetchRandomQuote();
    super.onInit();
  }

  void fetchRandomQuote() {
    var filteredQuotes =
        quotes.where((q) => q.category == selectedCategory.value).toList();
    currentQuote.value =
        filteredQuotes[Random().nextInt(filteredQuotes.length)];
  }
}
