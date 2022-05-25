import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'class_setting_record.g.dart';

abstract class ClassSettingRecord
    implements Built<ClassSettingRecord, ClassSettingRecordBuilder> {
  static Serializer<ClassSettingRecord> get serializer =>
      _$classSettingRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Interest')
  int get interest;

  @nullable
  @BuiltValueField(wireName: 'WagePeriod')
  int get wagePeriod;

  @nullable
  @BuiltValueField(wireName: 'PropertyTradeOption')
  bool get propertyTradeOption;

  @nullable
  @BuiltValueField(wireName: 'TaxRates')
  int get taxRates;

  @nullable
  @BuiltValueField(wireName: 'Currency_Unit_Name')
  String get currencyUnitName;

  @nullable
  @BuiltValueField(wireName: 'Bank_rates')
  int get bankRates;

  @nullable
  @BuiltValueField(wireName: 'LoanOption')
  bool get loanOption;

  @nullable
  @BuiltValueField(wireName: 'School')
  String get school;

  @nullable
  @BuiltValueField(wireName: 'Grade')
  String get grade;

  @nullable
  @BuiltValueField(wireName: 'Ban')
  String get ban;

  @nullable
  @BuiltValueField(wireName: 'TeacherName')
  String get teacherName;

  @nullable
  @BuiltValueField(wireName: 'ClassID')
  String get classID;

  @nullable
  @BuiltValueField(wireName: 'ClassEmailDomain')
  String get classEmailDomain;

  @nullable
  @BuiltValueField(wireName: 'Wage')
  int get wage;

  @nullable
  @BuiltValueField(wireName: 'ClassJobList')
  BuiltList<String> get classJobList;

  @nullable
  @BuiltValueField(wireName: 'ClassAuthInfo')
  String get classAuthInfo;

  @nullable
  @BuiltValueField(wireName: 'BankOSPassword')
  String get bankOSPassword;

  @nullable
  @BuiltValueField(wireName: 'BankOSLog')
  BuiltList<String> get bankOSLog;

  @nullable
  @BuiltValueField(wireName: 'EssentialJobList')
  BuiltList<String> get essentialJobList;

  @nullable
  @BuiltValueField(wireName: 'MarketOption')
  bool get marketOption;

  @nullable
  @BuiltValueField(wireName: 'MarketTrader')
  String get marketTrader;

  @nullable
  @BuiltValueField(wireName: 'BankTransactionFee')
  int get bankTransactionFee;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ClassSettingRecordBuilder builder) => builder
    ..interest = 0
    ..wagePeriod = 0
    ..propertyTradeOption = false
    ..taxRates = 0
    ..currencyUnitName = ''
    ..bankRates = 0
    ..loanOption = false
    ..school = ''
    ..grade = ''
    ..ban = ''
    ..teacherName = ''
    ..classID = ''
    ..classEmailDomain = ''
    ..wage = 0
    ..classJobList = ListBuilder()
    ..classAuthInfo = ''
    ..bankOSPassword = ''
    ..bankOSLog = ListBuilder()
    ..essentialJobList = ListBuilder()
    ..marketOption = false
    ..marketTrader = ''
    ..bankTransactionFee = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ClassSetting');

  static Stream<ClassSettingRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ClassSettingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  ClassSettingRecord._();
  factory ClassSettingRecord(
          [void Function(ClassSettingRecordBuilder) updates]) =
      _$ClassSettingRecord;

  static ClassSettingRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createClassSettingRecordData({
  int interest,
  int wagePeriod,
  bool propertyTradeOption,
  int taxRates,
  String currencyUnitName,
  int bankRates,
  bool loanOption,
  String school,
  String grade,
  String ban,
  String teacherName,
  String classID,
  String classEmailDomain,
  int wage,
  String classAuthInfo,
  String bankOSPassword,
  bool marketOption,
  String marketTrader,
  int bankTransactionFee,
}) =>
    serializers.toFirestore(
        ClassSettingRecord.serializer,
        ClassSettingRecord((c) => c
          ..interest = interest
          ..wagePeriod = wagePeriod
          ..propertyTradeOption = propertyTradeOption
          ..taxRates = taxRates
          ..currencyUnitName = currencyUnitName
          ..bankRates = bankRates
          ..loanOption = loanOption
          ..school = school
          ..grade = grade
          ..ban = ban
          ..teacherName = teacherName
          ..classID = classID
          ..classEmailDomain = classEmailDomain
          ..wage = wage
          ..classJobList = null
          ..classAuthInfo = classAuthInfo
          ..bankOSPassword = bankOSPassword
          ..bankOSLog = null
          ..essentialJobList = null
          ..marketOption = marketOption
          ..marketTrader = marketTrader
          ..bankTransactionFee = bankTransactionFee));
