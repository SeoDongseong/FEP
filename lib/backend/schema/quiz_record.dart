import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'quiz_record.g.dart';

abstract class QuizRecord implements Built<QuizRecord, QuizRecordBuilder> {
  static Serializer<QuizRecord> get serializer => _$quizRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'QuizAuthInfo')
  String get quizAuthInfo;

  @nullable
  @BuiltValueField(wireName: 'Quiz')
  String get quiz;

  @nullable
  @BuiltValueField(wireName: 'QuizAnswer')
  String get quizAnswer;

  @nullable
  @BuiltValueField(wireName: 'QuizReward')
  int get quizReward;

  @nullable
  @BuiltValueField(wireName: 'QuizRightAnswerStdList')
  BuiltList<String> get quizRightAnswerStdList;

  @nullable
  @BuiltValueField(wireName: 'QuizWrongAnswerStdList')
  BuiltList<String> get quizWrongAnswerStdList;

  @nullable
  @BuiltValueField(wireName: 'QuizTimeStamp')
  DateTime get quizTimeStamp;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(QuizRecordBuilder builder) => builder
    ..quizAuthInfo = ''
    ..quiz = ''
    ..quizAnswer = ''
    ..quizReward = 0
    ..quizRightAnswerStdList = ListBuilder()
    ..quizWrongAnswerStdList = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Quiz');

  static Stream<QuizRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<QuizRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  QuizRecord._();
  factory QuizRecord([void Function(QuizRecordBuilder) updates]) = _$QuizRecord;

  static QuizRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createQuizRecordData({
  String quizAuthInfo,
  String quiz,
  String quizAnswer,
  int quizReward,
  DateTime quizTimeStamp,
}) =>
    serializers.toFirestore(
        QuizRecord.serializer,
        QuizRecord((q) => q
          ..quizAuthInfo = quizAuthInfo
          ..quiz = quiz
          ..quizAnswer = quizAnswer
          ..quizReward = quizReward
          ..quizRightAnswerStdList = null
          ..quizWrongAnswerStdList = null
          ..quizTimeStamp = quizTimeStamp));
