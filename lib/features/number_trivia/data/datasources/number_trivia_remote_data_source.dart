import 'package:flutter_tdd/features/number_trivia/data/models/number_trivia_model.dart';

abstract class NumberTriviaRemoteDataSource {
  /// Calls the http://numbersapi.com/{number} endpoint.
  ///
  /// Throw a [ServerException] for all error codes.
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);

  /// Calss the http://numbersapi.com/random endpoint
  ///
  /// Throw a [ServerException] for all error codes.
  Future<NumberTriviaModel> getRandomNumberTrivia();
}
