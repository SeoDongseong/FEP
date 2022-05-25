import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tax_record.g.dart';

abstract class TaxRecord implements Built<TaxRecord, TaxRecordBuilder> {
  static Serializer<TaxRecord> get serializer => _$taxRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Amount')
  int get amount;

  @nullable
  @BuiltValueField(wireName: 'TimeStamp')
  DateTime get timeStamp;

  @nullable
  @BuiltValueField(wireName: 'TaxToWho')
  String get taxToWho;

  @nullable
  @BuiltValueField(wireName: 'TaxAuthInfo')
  String get taxAuthInfo;

  @nullable
  @BuiltValueField(wireName: 'TaxComplete')
  bool get taxComplete;

  @nullable
  @BuiltValueField(wireName: 'TaxMemo')
  String get taxMemo;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TaxRecordBuilder builder) => builder
    ..amount = 0
    ..taxToWho = ''
    ..taxAuthInfo = ''
    ..taxComplete = false
    ..taxMemo = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Tax');

  static Stream<TaxRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TaxRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TaxRecord._();
  factory TaxRecord([void Function(TaxRecordBuilder) updates]) = _$TaxRecord;

  static TaxRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTaxRecordData({
  int amount,
  DateTime timeStamp,
  String taxToWho,
  String taxAuthInfo,
  bool taxComplete,
  String taxMemo,
}) =>
    serializers.toFirestore(
        TaxRecord.serializer,
        TaxRecord((t) => t
          ..amount = amount
          ..timeStamp = timeStamp
          ..taxToWho = taxToWho
          ..taxAuthInfo = taxAuthInfo
          ..taxComplete = taxComplete
          ..taxMemo = taxMemo));
