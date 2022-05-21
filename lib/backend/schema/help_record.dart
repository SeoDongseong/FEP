import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'help_record.g.dart';

abstract class HelpRecord implements Built<HelpRecord, HelpRecordBuilder> {
  static Serializer<HelpRecord> get serializer => _$helpRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Good')
  int get good;

  @nullable
  @BuiltValueField(wireName: 'BoardText')
  String get boardText;

  @nullable
  @BuiltValueField(wireName: 'WrittenBy')
  String get writtenBy;

  @nullable
  @BuiltValueField(wireName: 'ThisIsGood')
  BuiltList<String> get thisIsGood;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(HelpRecordBuilder builder) => builder
    ..good = 0
    ..boardText = ''
    ..writtenBy = ''
    ..thisIsGood = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Help');

  static Stream<HelpRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<HelpRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  HelpRecord._();
  factory HelpRecord([void Function(HelpRecordBuilder) updates]) = _$HelpRecord;

  static HelpRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createHelpRecordData({
  int good,
  String boardText,
  String writtenBy,
}) =>
    serializers.toFirestore(
        HelpRecord.serializer,
        HelpRecord((h) => h
          ..good = good
          ..boardText = boardText
          ..writtenBy = writtenBy
          ..thisIsGood = null));
