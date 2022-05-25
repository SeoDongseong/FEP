import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'sent_wage_record.g.dart';

abstract class SentWageRecord
    implements Built<SentWageRecord, SentWageRecordBuilder> {
  static Serializer<SentWageRecord> get serializer =>
      _$sentWageRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'WageAuthInfo')
  String get wageAuthInfo;

  @nullable
  @BuiltValueField(wireName: 'WageAmount')
  int get wageAmount;

  @nullable
  @BuiltValueField(wireName: 'WageLabel')
  String get wageLabel;

  @nullable
  @BuiltValueField(wireName: 'WageReceivedStd')
  BuiltList<String> get wageReceivedStd;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SentWageRecordBuilder builder) => builder
    ..wageAuthInfo = ''
    ..wageAmount = 0
    ..wageLabel = ''
    ..wageReceivedStd = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SentWage');

  static Stream<SentWageRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<SentWageRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SentWageRecord._();
  factory SentWageRecord([void Function(SentWageRecordBuilder) updates]) =
      _$SentWageRecord;

  static SentWageRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSentWageRecordData({
  String wageAuthInfo,
  int wageAmount,
  String wageLabel,
}) =>
    serializers.toFirestore(
        SentWageRecord.serializer,
        SentWageRecord((s) => s
          ..wageAuthInfo = wageAuthInfo
          ..wageAmount = wageAmount
          ..wageLabel = wageLabel
          ..wageReceivedStd = null));
