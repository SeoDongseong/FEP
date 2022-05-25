// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, UsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.password;
    if (value != null) {
      result
        ..add('Password')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.school;
    if (value != null) {
      result
        ..add('school')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.grade;
    if (value != null) {
      result
        ..add('grade')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ban;
    if (value != null) {
      result
        ..add('ban')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.totalTax;
    if (value != null) {
      result
        ..add('TotalTax')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.educationOffice;
    if (value != null) {
      result
        ..add('EducationOffice')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.taxIncomeInfo;
    if (value != null) {
      result
        ..add('TaxIncomeInfo')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.taxSpendingInfo;
    if (value != null) {
      result
        ..add('TaxSpendingInfo')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.userAuthInfo;
    if (value != null) {
      result
        ..add('UserAuthInfo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  UsersRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'Password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'school':
          result.school = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'grade':
          result.grade = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ban':
          result.ban = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'TotalTax':
          result.totalTax = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'EducationOffice':
          result.educationOffice = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'TaxIncomeInfo':
          result.taxIncomeInfo.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'TaxSpendingInfo':
          result.taxSpendingInfo.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'UserAuthInfo':
          result.userAuthInfo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$UsersRecord extends UsersRecord {
  @override
  final String password;
  @override
  final DateTime createdTime;
  @override
  final String school;
  @override
  final String grade;
  @override
  final String ban;
  @override
  final String displayName;
  @override
  final String email;
  @override
  final String photoUrl;
  @override
  final String phoneNumber;
  @override
  final String uid;
  @override
  final int totalTax;
  @override
  final String educationOffice;
  @override
  final BuiltList<String> taxIncomeInfo;
  @override
  final BuiltList<String> taxSpendingInfo;
  @override
  final String userAuthInfo;
  @override
  final DocumentReference<Object> reference;

  factory _$UsersRecord([void Function(UsersRecordBuilder) updates]) =>
      (new UsersRecordBuilder()..update(updates)).build();

  _$UsersRecord._(
      {this.password,
      this.createdTime,
      this.school,
      this.grade,
      this.ban,
      this.displayName,
      this.email,
      this.photoUrl,
      this.phoneNumber,
      this.uid,
      this.totalTax,
      this.educationOffice,
      this.taxIncomeInfo,
      this.taxSpendingInfo,
      this.userAuthInfo,
      this.reference})
      : super._();

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        password == other.password &&
        createdTime == other.createdTime &&
        school == other.school &&
        grade == other.grade &&
        ban == other.ban &&
        displayName == other.displayName &&
        email == other.email &&
        photoUrl == other.photoUrl &&
        phoneNumber == other.phoneNumber &&
        uid == other.uid &&
        totalTax == other.totalTax &&
        educationOffice == other.educationOffice &&
        taxIncomeInfo == other.taxIncomeInfo &&
        taxSpendingInfo == other.taxSpendingInfo &&
        userAuthInfo == other.userAuthInfo &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    0,
                                                                    password
                                                                        .hashCode),
                                                                createdTime
                                                                    .hashCode),
                                                            school.hashCode),
                                                        grade.hashCode),
                                                    ban.hashCode),
                                                displayName.hashCode),
                                            email.hashCode),
                                        photoUrl.hashCode),
                                    phoneNumber.hashCode),
                                uid.hashCode),
                            totalTax.hashCode),
                        educationOffice.hashCode),
                    taxIncomeInfo.hashCode),
                taxSpendingInfo.hashCode),
            userAuthInfo.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UsersRecord')
          ..add('password', password)
          ..add('createdTime', createdTime)
          ..add('school', school)
          ..add('grade', grade)
          ..add('ban', ban)
          ..add('displayName', displayName)
          ..add('email', email)
          ..add('photoUrl', photoUrl)
          ..add('phoneNumber', phoneNumber)
          ..add('uid', uid)
          ..add('totalTax', totalTax)
          ..add('educationOffice', educationOffice)
          ..add('taxIncomeInfo', taxIncomeInfo)
          ..add('taxSpendingInfo', taxSpendingInfo)
          ..add('userAuthInfo', userAuthInfo)
          ..add('reference', reference))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord _$v;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  DateTime _createdTime;
  DateTime get createdTime => _$this._createdTime;
  set createdTime(DateTime createdTime) => _$this._createdTime = createdTime;

  String _school;
  String get school => _$this._school;
  set school(String school) => _$this._school = school;

  String _grade;
  String get grade => _$this._grade;
  set grade(String grade) => _$this._grade = grade;

  String _ban;
  String get ban => _$this._ban;
  set ban(String ban) => _$this._ban = ban;

  String _displayName;
  String get displayName => _$this._displayName;
  set displayName(String displayName) => _$this._displayName = displayName;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _photoUrl;
  String get photoUrl => _$this._photoUrl;
  set photoUrl(String photoUrl) => _$this._photoUrl = photoUrl;

  String _phoneNumber;
  String get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String phoneNumber) => _$this._phoneNumber = phoneNumber;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  int _totalTax;
  int get totalTax => _$this._totalTax;
  set totalTax(int totalTax) => _$this._totalTax = totalTax;

  String _educationOffice;
  String get educationOffice => _$this._educationOffice;
  set educationOffice(String educationOffice) =>
      _$this._educationOffice = educationOffice;

  ListBuilder<String> _taxIncomeInfo;
  ListBuilder<String> get taxIncomeInfo =>
      _$this._taxIncomeInfo ??= new ListBuilder<String>();
  set taxIncomeInfo(ListBuilder<String> taxIncomeInfo) =>
      _$this._taxIncomeInfo = taxIncomeInfo;

  ListBuilder<String> _taxSpendingInfo;
  ListBuilder<String> get taxSpendingInfo =>
      _$this._taxSpendingInfo ??= new ListBuilder<String>();
  set taxSpendingInfo(ListBuilder<String> taxSpendingInfo) =>
      _$this._taxSpendingInfo = taxSpendingInfo;

  String _userAuthInfo;
  String get userAuthInfo => _$this._userAuthInfo;
  set userAuthInfo(String userAuthInfo) => _$this._userAuthInfo = userAuthInfo;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _password = $v.password;
      _createdTime = $v.createdTime;
      _school = $v.school;
      _grade = $v.grade;
      _ban = $v.ban;
      _displayName = $v.displayName;
      _email = $v.email;
      _photoUrl = $v.photoUrl;
      _phoneNumber = $v.phoneNumber;
      _uid = $v.uid;
      _totalTax = $v.totalTax;
      _educationOffice = $v.educationOffice;
      _taxIncomeInfo = $v.taxIncomeInfo?.toBuilder();
      _taxSpendingInfo = $v.taxSpendingInfo?.toBuilder();
      _userAuthInfo = $v.userAuthInfo;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UsersRecord build() {
    _$UsersRecord _$result;
    try {
      _$result = _$v ??
          new _$UsersRecord._(
              password: password,
              createdTime: createdTime,
              school: school,
              grade: grade,
              ban: ban,
              displayName: displayName,
              email: email,
              photoUrl: photoUrl,
              phoneNumber: phoneNumber,
              uid: uid,
              totalTax: totalTax,
              educationOffice: educationOffice,
              taxIncomeInfo: _taxIncomeInfo?.build(),
              taxSpendingInfo: _taxSpendingInfo?.build(),
              userAuthInfo: userAuthInfo,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'taxIncomeInfo';
        _taxIncomeInfo?.build();
        _$failedField = 'taxSpendingInfo';
        _taxSpendingInfo?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UsersRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
