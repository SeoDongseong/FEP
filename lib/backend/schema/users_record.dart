import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Password')
  String get password;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  String get school;

  @nullable
  String get grade;

  @nullable
  String get ban;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'TotalTax')
  int get totalTax;

  @nullable
  @BuiltValueField(wireName: 'EducationOffice')
  String get educationOffice;

  @nullable
  @BuiltValueField(wireName: 'TaxIncomeInfo')
  BuiltList<String> get taxIncomeInfo;

  @nullable
  @BuiltValueField(wireName: 'TaxSpendingInfo')
  BuiltList<String> get taxSpendingInfo;

  @nullable
  @BuiltValueField(wireName: 'UserAuthInfo')
  String get userAuthInfo;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..password = ''
    ..school = ''
    ..grade = ''
    ..ban = ''
    ..displayName = ''
    ..email = ''
    ..photoUrl = ''
    ..phoneNumber = ''
    ..uid = ''
    ..totalTax = 0
    ..educationOffice = ''
    ..taxIncomeInfo = ListBuilder()
    ..taxSpendingInfo = ListBuilder()
    ..userAuthInfo = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUsersRecordData({
  String password,
  DateTime createdTime,
  String school,
  String grade,
  String ban,
  String displayName,
  String email,
  String photoUrl,
  String phoneNumber,
  String uid,
  int totalTax,
  String educationOffice,
  String userAuthInfo,
}) =>
    serializers.toFirestore(
        UsersRecord.serializer,
        UsersRecord((u) => u
          ..password = password
          ..createdTime = createdTime
          ..school = school
          ..grade = grade
          ..ban = ban
          ..displayName = displayName
          ..email = email
          ..photoUrl = photoUrl
          ..phoneNumber = phoneNumber
          ..uid = uid
          ..totalTax = totalTax
          ..educationOffice = educationOffice
          ..taxIncomeInfo = null
          ..taxSpendingInfo = null
          ..userAuthInfo = userAuthInfo));
