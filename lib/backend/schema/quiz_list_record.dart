import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'quiz_list_record.g.dart';

abstract class QuizListRecord
    implements Built<QuizListRecord, QuizListRecordBuilder> {
  static Serializer<QuizListRecord> get serializer =>
      _$quizListRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Quiz')
  String get quiz;

  @nullable
  @BuiltValueField(wireName: 'Answer')
  String get answer;

  @nullable
  @BuiltValueField(wireName: 'QuizAuthInfo')
  String get quizAuthInfo;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(QuizListRecordBuilder builder) => builder
    ..quiz = ''
    ..answer = ''
    ..quizAuthInfo = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('QuizList');

  static Stream<QuizListRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<QuizListRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  QuizListRecord._();
  factory QuizListRecord([void Function(QuizListRecordBuilder) updates]) =
      _$QuizListRecord;

  static QuizListRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createQuizListRecordData({
  String quiz,
  String answer,
  String quizAuthInfo,
}) =>
    serializers.toFirestore(
        QuizListRecord.serializer,
        QuizListRecord((q) => q
          ..quiz = quiz
          ..answer = answer
          ..quizAuthInfo = quizAuthInfo));
