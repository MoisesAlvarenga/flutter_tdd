import 'dart:convert';

import 'package:flutter_tdd/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:flutter_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'Test Text');
  test(
    'shold be a subclass of NumberTriviaEntity',
    () async {
      // assert
      expect(tNumberTriviaModel, isA<NumberTrivia>());
    },
  );

  group(
    "fromJson",
    () {
      test(
        'should return a valid model when JSON number is integer.',
        () async {
          // arrang
          final Map<String, dynamic> jsonMap =
              json.decode(fixture('trivia.json'));
          // act
          final result = NumberTriviaModel.fromJson(jsonMap);
          // assert
          expect(result, equals(tNumberTriviaModel));
        },
      );

      test(
        'should return a valid model when JSON number is regarded as a double.',
        () async {
          // arrang
          final Map<String, dynamic> jsonMap =
              json.decode(fixture('trivia_double.json'));
          // act
          final result = NumberTriviaModel.fromJson(jsonMap);
          // assert
          expect(result, equals(tNumberTriviaModel));
        },
      );
    },
  );

  group(
    "toJson",
    () {
      test(
        "should return a JSON map containing the proper data.",
        () async {
          // act
          final result = tNumberTriviaModel.toJson();
          // assert
          final expecteddMap = {
            "text": "Test Text",
            "number": 1,
          };
          expect(result, expecteddMap);
        },
      );
    },
  );
}
