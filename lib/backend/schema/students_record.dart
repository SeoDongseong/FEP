import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'students_record.g.dart';

abstract class StudentsRecord
    implements Built<StudentsRecord, StudentsRecordBuilder> {
  static Serializer<StudentsRecord> get serializer =>
      _$studentsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'StdSchool')
  String get stdSchool;

  @nullable
  @BuiltValueField(wireName: 'StdPassword')
  String get stdPassword;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'Std_grade')
  String get stdGrade;

  @nullable
  @BuiltValueField(wireName: 'Std_Ban')
  String get stdBan;

  @nullable
  @BuiltValueField(wireName: 'AllSelectToggle')
  bool get allSelectToggle;

  @nullable
  @BuiltValueField(wireName: 'StdTeacherName')
  String get stdTeacherName;

  @nullable
  @BuiltValueField(wireName: 'StdName')
  String get stdName;

  @nullable
  @BuiltValueField(wireName: 'TotalCurrency')
  int get totalCurrency;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'StdDepositIncome')
  BuiltList<String> get stdDepositIncome;

  @nullable
  @BuiltValueField(wireName: 'StdTotalDeposit')
  int get stdTotalDeposit;

  @nullable
  @BuiltValueField(wireName: 'StdDepositOut')
  BuiltList<String> get stdDepositOut;

  @nullable
  @BuiltValueField(wireName: 'TaxList')
  BuiltList<String> get taxList;

  @nullable
  @BuiltValueField(wireName: 'StdJob')
  String get stdJob;

  @nullable
  @BuiltValueField(wireName: 'StdAuthInfo')
  String get stdAuthInfo;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(StudentsRecordBuilder builder) => builder
    ..stdSchool = ''
    ..stdPassword = ''
    ..stdGrade = ''
    ..stdBan = ''
    ..allSelectToggle = false
    ..stdTeacherName = ''
    ..stdName = ''
    ..totalCurrency = 0
    ..email = ''
    ..stdDepositIncome = ListBuilder()
    ..stdTotalDeposit = 0
    ..stdDepositOut = ListBuilder()
    ..taxList = ListBuilder()
    ..stdJob = ''
    ..stdAuthInfo = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Students');

  static Stream<StudentsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<StudentsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  StudentsRecord._();
  factory StudentsRecord([void Function(StudentsRecordBuilder) updates]) =
      _$StudentsRecord;

  static StudentsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createStudentsRecordData({
  String stdSchool,
  String stdPassword,
  DateTime createdTime,
  String stdGrade,
  String stdBan,
  bool allSelectToggle,
  String stdTeacherName,
  String stdName,
  int totalCurrency,
  String email,
  int stdTotalDeposit,
  String stdJob,
  String stdAuthInfo,
}) =>
    serializers.toFirestore(
        StudentsRecord.serializer,
        StudentsRecord((s) => s
          ..stdSchool = stdSchool
          ..stdPassword = stdPassword
          ..createdTime = createdTime
          ..stdGrade = stdGrade
          ..stdBan = stdBan
          ..allSelectToggle = allSelectToggle
          ..stdTeacherName = stdTeacherName
          ..stdName = stdName
          ..totalCurrency = totalCurrency
          ..email = email
          ..stdDepositIncome = null
          ..stdTotalDeposit = stdTotalDeposit
          ..stdDepositOut = null
          ..taxList = null
          ..stdJob = stdJob
          ..stdAuthInfo = stdAuthInfo));
