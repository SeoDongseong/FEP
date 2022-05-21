import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'market_record.g.dart';

abstract class MarketRecord
    implements Built<MarketRecord, MarketRecordBuilder> {
  static Serializer<MarketRecord> get serializer => _$marketRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'ItemAuthInfo')
  String get itemAuthInfo;

  @nullable
  @BuiltValueField(wireName: 'ItemName')
  String get itemName;

  @nullable
  @BuiltValueField(wireName: 'ItemStock')
  int get itemStock;

  @nullable
  @BuiltValueField(wireName: 'ItemPrice')
  int get itemPrice;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(MarketRecordBuilder builder) => builder
    ..itemAuthInfo = ''
    ..itemName = ''
    ..itemStock = 0
    ..itemPrice = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Market');

  static Stream<MarketRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<MarketRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  MarketRecord._();
  factory MarketRecord([void Function(MarketRecordBuilder) updates]) =
      _$MarketRecord;

  static MarketRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createMarketRecordData({
  String itemAuthInfo,
  String itemName,
  int itemStock,
  int itemPrice,
}) =>
    serializers.toFirestore(
        MarketRecord.serializer,
        MarketRecord((m) => m
          ..itemAuthInfo = itemAuthInfo
          ..itemName = itemName
          ..itemStock = itemStock
          ..itemPrice = itemPrice));
