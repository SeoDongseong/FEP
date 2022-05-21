import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'trade_record.g.dart';

abstract class TradeRecord implements Built<TradeRecord, TradeRecordBuilder> {
  static Serializer<TradeRecord> get serializer => _$tradeRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Amount')
  int get amount;

  @nullable
  @BuiltValueField(wireName: 'TimeStmp')
  DateTime get timeStmp;

  @nullable
  @BuiltValueField(wireName: 'TradeToWho')
  String get tradeToWho;

  @nullable
  @BuiltValueField(wireName: 'TradeFromWho')
  String get tradeFromWho;

  @nullable
  @BuiltValueField(wireName: 'TradeLabel')
  String get tradeLabel;

  @nullable
  @BuiltValueField(wireName: 'TradeAuthInfo')
  String get tradeAuthInfo;

  @nullable
  @BuiltValueField(wireName: 'TradeFromWhoSchool')
  String get tradeFromWhoSchool;

  @nullable
  @BuiltValueField(wireName: 'TradeFromWhoGrade')
  String get tradeFromWhoGrade;

  @nullable
  @BuiltValueField(wireName: 'TradeFromWhoBan')
  String get tradeFromWhoBan;

  @nullable
  @BuiltValueField(wireName: 'TradeComplete')
  String get tradeComplete;

  @nullable
  @BuiltValueField(wireName: 'PropertyIndexForTrade')
  int get propertyIndexForTrade;

  @nullable
  @BuiltValueField(wireName: 'IsMarketItem')
  bool get isMarketItem;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TradeRecordBuilder builder) => builder
    ..amount = 0
    ..tradeToWho = ''
    ..tradeFromWho = ''
    ..tradeLabel = ''
    ..tradeAuthInfo = ''
    ..tradeFromWhoSchool = ''
    ..tradeFromWhoGrade = ''
    ..tradeFromWhoBan = ''
    ..tradeComplete = ''
    ..propertyIndexForTrade = 0
    ..isMarketItem = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Trade');

  static Stream<TradeRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TradeRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TradeRecord._();
  factory TradeRecord([void Function(TradeRecordBuilder) updates]) =
      _$TradeRecord;

  static TradeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTradeRecordData({
  int amount,
  DateTime timeStmp,
  String tradeToWho,
  String tradeFromWho,
  String tradeLabel,
  String tradeAuthInfo,
  String tradeFromWhoSchool,
  String tradeFromWhoGrade,
  String tradeFromWhoBan,
  String tradeComplete,
  int propertyIndexForTrade,
  bool isMarketItem,
}) =>
    serializers.toFirestore(
        TradeRecord.serializer,
        TradeRecord((t) => t
          ..amount = amount
          ..timeStmp = timeStmp
          ..tradeToWho = tradeToWho
          ..tradeFromWho = tradeFromWho
          ..tradeLabel = tradeLabel
          ..tradeAuthInfo = tradeAuthInfo
          ..tradeFromWhoSchool = tradeFromWhoSchool
          ..tradeFromWhoGrade = tradeFromWhoGrade
          ..tradeFromWhoBan = tradeFromWhoBan
          ..tradeComplete = tradeComplete
          ..propertyIndexForTrade = propertyIndexForTrade
          ..isMarketItem = isMarketItem));
