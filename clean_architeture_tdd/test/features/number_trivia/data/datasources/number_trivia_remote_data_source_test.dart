import 'dart:convert';

import 'package:clean_architeture_tdd/core/error/exception.dart';
import 'package:clean_architeture_tdd/features/number_trivia/data/data_sources/number_trivia_remote_data_source.dart';
import 'package:clean_architeture_tdd/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  NumberTriviaRemoteDataSourceImpl dataSourceImpl;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSourceImpl = NumberTriviaRemoteDataSourceImpl(client: mockHttpClient);
  });

  void setUpMockHttpClientSuccess200() {
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixture('trivia.json'), 200),
      );
    }

    void setUpMockHttpClientFailure404() {
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response('Something went wrong', 404),
      );
    }

  group('getConcreteNumberTrivia', () {
    final tNumber = 1;

    final tNumberTriviaModel =
        NumberTriviaModel.fromJson(json.decode(fixture('trivia.json')));

    test(
      'should performe a GET request on a URL with number being the endpoint and with application/json header',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        dataSourceImpl.getConcreteNumberTrivia(tNumber);
        // assert
        verify(mockHttpClient.get('http://numbersapi.com/$tNumber',
            headers: {'Content-Type': 'application/json'}));
      },
    );

    test(
      'should return NumberTrivia when response code is 200 (success)',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        final result = await dataSourceImpl.getConcreteNumberTrivia(tNumber);
        // assert
        expect(result, equals(tNumberTriviaModel));
      },
    );

    test(
      'should return ServerException when the response is 404 or other',
      () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSourceImpl.getConcreteNumberTrivia;
        // assert
        expect(() => call(tNumber), throwsA(isA<ServerException>()));
      },
    );
  });

  group('getRandomNumberTrivia', () {
    final tNumberTriviaModel =
        NumberTriviaModel.fromJson(json.decode(fixture('trivia.json')));

    test(
      'should performe a GET request on a URL with number being the endpoint and with application/json header',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        dataSourceImpl.getRandomNumberTrivia();
        // assert
        verify(mockHttpClient.get('http://numbersapi.com/random',
            headers: {'Content-Type': 'application/json'}));
      },
    );

    test(
      'should return NumberTrivia when response code is 200 (success)',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        final result = await dataSourceImpl.getRandomNumberTrivia();
        // assert
        expect(result, equals(tNumberTriviaModel));
      },
    );

    test(
      'should return ServerException when the response is 404 or other',
      () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSourceImpl.getRandomNumberTrivia;
        // assert
        expect(() => call(), throwsA(isA<ServerException>()));
      },
    );
  });
}
