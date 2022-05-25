import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'property_record.g.dart';

abstract class PropertyRecord
    implements Built<PropertyRecord, PropertyRecordBuilder> {
  static Serializer<PropertyRecord> get serializer =>
      _$propertyRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'PropertyOwner')
  String get propertyOwner;

  @nullable
  @BuiltValueField(wireName: 'PropertyPrice')
  int get propertyPrice;

  @nullable
  @BuiltValueField(wireName: 'PropertyAuthInfo')
  String get propertyAuthInfo;

  @nullable
  @BuiltValueField(wireName: 'PropertyLastInfo')
  BuiltList<String> get propertyLastInfo;

  @nullable
  @BuiltValueField(wireName: 'PropertyLoan')
  String get propertyLoan;

  @nullable
  @BuiltValueField(wireName: 'PropertyOnSale')
  bool get propertyOnSale;

  @nullable
  @BuiltValueField(wireName: 'PropertyLoanPrice')
  int get propertyLoanPrice;

  @nullable
  @BuiltValueField(wireName: 'PropertyIndex')
  int get propertyIndex;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PropertyRecordBuilder builder) => builder
    ..propertyOwner = ''
    ..propertyPrice = 0
    ..propertyAuthInfo = ''
    ..propertyLastInfo = ListBuilder()
    ..propertyLoan = ''
    ..propertyOnSale = false
    ..propertyLoanPrice = 0
    ..propertyIndex = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Property');

  static Stream<PropertyRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PropertyRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PropertyRecord._();
  factory PropertyRecord([void Function(PropertyRecordBuilder) updates]) =
      _$PropertyRecord;

  static PropertyRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPropertyRecordData({
  String propertyOwner,
  int propertyPrice,
  String propertyAuthInfo,
  String propertyLoan,
  bool propertyOnSale,
  int propertyLoanPrice,
  int propertyIndex,
}) =>
    serializers.toFirestore(
        PropertyRecord.serializer,
        PropertyRecord((p) => p
          ..propertyOwner = propertyOwner
          ..propertyPrice = propertyPrice
          ..propertyAuthInfo = propertyAuthInfo
          ..propertyLastInfo = null
          ..propertyLoan = propertyLoan
          ..propertyOnSale = propertyOnSale
          ..propertyLoanPrice = propertyLoanPrice
          ..propertyIndex = propertyIndex));
