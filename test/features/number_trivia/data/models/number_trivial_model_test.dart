import 'dart:convert';

import 'package:clean_arch_tdd_example/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:clean_arch_tdd_example/features/number_trivia/domain/entities/number_triviadart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'Text test');

  test(
    'should be a subclass of NumberTrivia entity',
    () async {
      // assert
      expect(tNumberTriviaModel, isA<NumberTrivia>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model when the JSON number is an integer',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('trivia.json'));
        // act
        final result = NumberTriviaModel.fromJson(jsonMap);
        // assert
        expect(result, tNumberTriviaModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = tNumberTriviaModel.toJson();
        // assert
        final expectedJsonMap = {
          "text": "Text test",
          "number": 1,
        };
        expect(result, expectedJsonMap);
      },
    );
  });
}
