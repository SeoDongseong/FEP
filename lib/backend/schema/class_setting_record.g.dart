// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_setting_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ClassSettingRecord> _$classSettingRecordSerializer =
    new _$ClassSettingRecordSerializer();

class _$ClassSettingRecordSerializer
    implements StructuredSerializer<ClassSettingRecord> {
  @override
  final Iterable<Type> types = const [ClassSettingRecord, _$ClassSettingRecord];
  @override
  final String wireName = 'ClassSettingRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, ClassSettingRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.interest;
    if (value != null) {
      result
        ..add('Interest')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.wagePeriod;
    if (value != null) {
      result
        ..add('WagePeriod')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.propertyTradeOption;
    if (value != null) {
      result
        ..add('PropertyTradeOption')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.taxRates;
    if (value != null) {
      result
        ..add('TaxRates')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.currencyUnitName;
    if (value != null) {
      result
        ..add('Currency_Unit_Name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bankRates;
    if (value != null) {
      result
        ..add('Bank_rates')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.loanOption;
    if (value != null) {
      result
        ..add('LoanOption')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.school;
    if (value != null) {
      result
        ..add('School')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.grade;
    if (value != null) {
      result
        ..add('Grade')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ban;
    if (value != null) {
      result
        ..add('Ban')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.teacherName;
    if (value != null) {
      result
        ..add('TeacherName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.classID;
    if (value != null) {
      result
        ..add('ClassID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.classEmailDomain;
    if (value != null) {
      result
        ..add('ClassEmailDomain')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.wage;
    if (value != null) {
      result
        ..add('Wage')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.classJobList;
    if (value != null) {
      result
        ..add('ClassJobList')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.classAuthInfo;
    if (value != null) {
      result
        ..add('ClassAuthInfo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bankOSPassword;
    if (value != null) {
      result
        ..add('BankOSPassword')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bankOSLog;
    if (value != null) {
      result
        ..add('BankOSLog')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.essentialJobList;
    if (value != null) {
      result
        ..add('EssentialJobList')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.marketOption;
    if (value != null) {
      result
        ..add('MarketOption')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.marketTrader;
    if (value != null) {
      result
        ..add('MarketTrader')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bankTransactionFee;
    if (value != null) {
      result
        ..add('BankTransactionFee')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  ClassSettingRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ClassSettingRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'Interest':
          result.interest = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'WagePeriod':
          result.wagePeriod = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'PropertyTradeOption':
          result.propertyTradeOption = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'TaxRates':
          result.taxRates = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'Currency_Unit_Name':
          result.currencyUnitName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Bank_rates':
          result.bankRates = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'LoanOption':
          result.loanOption = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'School':
          result.school = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Grade':
          result.grade = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Ban':
          result.ban = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'TeacherName':
          result.teacherName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ClassID':
          result.classID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ClassEmailDomain':
          result.classEmailDomain = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Wage':
          result.wage = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'ClassJobList':
          result.classJobList.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'ClassAuthInfo':
          result.classAuthInfo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'BankOSPassword':
          result.bankOSPassword = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'BankOSLog':
          result.bankOSLog.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'EssentialJobList':
          result.essentialJobList.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'MarketOption':
          result.marketOption = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'MarketTrader':
          result.marketTrader = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'BankTransactionFee':
          result.bankTransactionFee = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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

class _$ClassSettingRecord extends ClassSettingRecord {
  @override
  final int interest;
  @override
  final int wagePeriod;
  @override
  final bool propertyTradeOption;
  @override
  final int taxRates;
  @override
  final String currencyUnitName;
  @override
  final int bankRates;
  @override
  final bool loanOption;
  @override
  final String school;
  @override
  final String grade;
  @override
  final String ban;
  @override
  final String teacherName;
  @override
  final String classID;
  @override
  final String classEmailDomain;
  @override
  final int wage;
  @override
  final BuiltList<String> classJobList;
  @override
  final String classAuthInfo;
  @override
  final String bankOSPassword;
  @override
  final BuiltList<String> bankOSLog;
  @override
  final BuiltList<String> essentialJobList;
  @override
  final bool marketOption;
  @override
  final String marketTrader;
  @override
  final int bankTransactionFee;
  @override
  final DocumentReference<Object> reference;

  factory _$ClassSettingRecord(
          [void Function(ClassSettingRecordBuilder) updates]) =>
      (new ClassSettingRecordBuilder()..update(updates)).build();

  _$ClassSettingRecord._(
      {this.interest,
      this.wagePeriod,
      this.propertyTradeOption,
      this.taxRates,
      this.currencyUnitName,
      this.bankRates,
      this.loanOption,
      this.school,
      this.grade,
      this.ban,
      this.teacherName,
      this.classID,
      this.classEmailDomain,
      this.wage,
      this.classJobList,
      this.classAuthInfo,
      this.bankOSPassword,
      this.bankOSLog,
      this.essentialJobList,
      this.marketOption,
      this.marketTrader,
      this.bankTransactionFee,
      this.reference})
      : super._();

  @override
  ClassSettingRecord rebuild(
          void Function(ClassSettingRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClassSettingRecordBuilder toBuilder() =>
      new ClassSettingRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClassSettingRecord &&
        interest == other.interest &&
        wagePeriod == other.wagePeriod &&
        propertyTradeOption == other.propertyTradeOption &&
        taxRates == other.taxRates &&
        currencyUnitName == other.currencyUnitName &&
        bankRates == other.bankRates &&
        loanOption == other.loanOption &&
        school == other.school &&
        grade == other.grade &&
        ban == other.ban &&
        teacherName == other.teacherName &&
        classID == other.classID &&
        classEmailDomain == other.classEmailDomain &&
        wage == other.wage &&
        classJobList == other.classJobList &&
        classAuthInfo == other.classAuthInfo &&
        bankOSPassword == other.bankOSPassword &&
        bankOSLog == other.bankOSLog &&
        essentialJobList == other.essentialJobList &&
        marketOption == other.marketOption &&
        marketTrader == other.marketTrader &&
        bankTransactionFee == other.bankTransactionFee &&
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
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc(0, interest.hashCode), wagePeriod.hashCode), propertyTradeOption.hashCode), taxRates.hashCode),
                                                                                currencyUnitName.hashCode),
                                                                            bankRates.hashCode),
                                                                        loanOption.hashCode),
                                                                    school.hashCode),
                                                                grade.hashCode),
                                                            ban.hashCode),
                                                        teacherName.hashCode),
                                                    classID.hashCode),
                                                classEmailDomain.hashCode),
                                            wage.hashCode),
                                        classJobList.hashCode),
                                    classAuthInfo.hashCode),
                                bankOSPassword.hashCode),
                            bankOSLog.hashCode),
                        essentialJobList.hashCode),
                    marketOption.hashCode),
                marketTrader.hashCode),
            bankTransactionFee.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ClassSettingRecord')
          ..add('interest', interest)
          ..add('wagePeriod', wagePeriod)
          ..add('propertyTradeOption', propertyTradeOption)
          ..add('taxRates', taxRates)
          ..add('currencyUnitName', currencyUnitName)
          ..add('bankRates', bankRates)
          ..add('loanOption', loanOption)
          ..add('school', school)
          ..add('grade', grade)
          ..add('ban', ban)
          ..add('teacherName', teacherName)
          ..add('classID', classID)
          ..add('classEmailDomain', classEmailDomain)
          ..add('wage', wage)
          ..add('classJobList', classJobList)
          ..add('classAuthInfo', classAuthInfo)
          ..add('bankOSPassword', bankOSPassword)
          ..add('bankOSLog', bankOSLog)
          ..add('essentialJobList', essentialJobList)
          ..add('marketOption', marketOption)
          ..add('marketTrader', marketTrader)
          ..add('bankTransactionFee', bankTransactionFee)
          ..add('reference', reference))
        .toString();
  }
}

class ClassSettingRecordBuilder
    implements Builder<ClassSettingRecord, ClassSettingRecordBuilder> {
  _$ClassSettingRecord _$v;

  int _interest;
  int get interest => _$this._interest;
  set interest(int interest) => _$this._interest = interest;

  int _wagePeriod;
  int get wagePeriod => _$this._wagePeriod;
  set wagePeriod(int wagePeriod) => _$this._wagePeriod = wagePeriod;

  bool _propertyTradeOption;
  bool get propertyTradeOption => _$this._propertyTradeOption;
  set propertyTradeOption(bool propertyTradeOption) =>
      _$this._propertyTradeOption = propertyTradeOption;

  int _taxRates;
  int get taxRates => _$this._taxRates;
  set taxRates(int taxRates) => _$this._taxRates = taxRates;

  String _currencyUnitName;
  String get currencyUnitName => _$this._currencyUnitName;
  set currencyUnitName(String currencyUnitName) =>
      _$this._currencyUnitName = currencyUnitName;

  int _bankRates;
  int get bankRates => _$this._bankRates;
  set bankRates(int bankRates) => _$this._bankRates = bankRates;

  bool _loanOption;
  bool get loanOption => _$this._loanOption;
  set loanOption(bool loanOption) => _$this._loanOption = loanOption;

  String _school;
  String get school => _$this._school;
  set school(String school) => _$this._school = school;

  String _grade;
  String get grade => _$this._grade;
  set grade(String grade) => _$this._grade = grade;

  String _ban;
  String get ban => _$this._ban;
  set ban(String ban) => _$this._ban = ban;

  String _teacherName;
  String get teacherName => _$this._teacherName;
  set teacherName(String teacherName) => _$this._teacherName = teacherName;

  String _classID;
  String get classID => _$this._classID;
  set classID(String classID) => _$this._classID = classID;

  String _classEmailDomain;
  String get classEmailDomain => _$this._classEmailDomain;
  set classEmailDomain(String classEmailDomain) =>
      _$this._classEmailDomain = classEmailDomain;

  int _wage;
  int get wage => _$this._wage;
  set wage(int wage) => _$this._wage = wage;

  ListBuilder<String> _classJobList;
  ListBuilder<String> get classJobList =>
      _$this._classJobList ??= new ListBuilder<String>();
  set classJobList(ListBuilder<String> classJobList) =>
      _$this._classJobList = classJobList;

  String _classAuthInfo;
  String get classAuthInfo => _$this._classAuthInfo;
  set classAuthInfo(String classAuthInfo) =>
      _$this._classAuthInfo = classAuthInfo;

  String _bankOSPassword;
  String get bankOSPassword => _$this._bankOSPassword;
  set bankOSPassword(String bankOSPassword) =>
      _$this._bankOSPassword = bankOSPassword;

  ListBuilder<String> _bankOSLog;
  ListBuilder<String> get bankOSLog =>
      _$this._bankOSLog ??= new ListBuilder<String>();
  set bankOSLog(ListBuilder<String> bankOSLog) => _$this._bankOSLog = bankOSLog;

  ListBuilder<String> _essentialJobList;
  ListBuilder<String> get essentialJobList =>
      _$this._essentialJobList ??= new ListBuilder<String>();
  set essentialJobList(ListBuilder<String> essentialJobList) =>
      _$this._essentialJobList = essentialJobList;

  bool _marketOption;
  bool get marketOption => _$this._marketOption;
  set marketOption(bool marketOption) => _$this._marketOption = marketOption;

  String _marketTrader;
  String get marketTrader => _$this._marketTrader;
  set marketTrader(String marketTrader) => _$this._marketTrader = marketTrader;

  int _bankTransactionFee;
  int get bankTransactionFee => _$this._bankTransactionFee;
  set bankTransactionFee(int bankTransactionFee) =>
      _$this._bankTransactionFee = bankTransactionFee;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ClassSettingRecordBuilder() {
    ClassSettingRecord._initializeBuilder(this);
  }

  ClassSettingRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _interest = $v.interest;
      _wagePeriod = $v.wagePeriod;
      _propertyTradeOption = $v.propertyTradeOption;
      _taxRates = $v.taxRates;
      _currencyUnitName = $v.currencyUnitName;
      _bankRates = $v.bankRates;
      _loanOption = $v.loanOption;
      _school = $v.school;
      _grade = $v.grade;
      _ban = $v.ban;
      _teacherName = $v.teacherName;
      _classID = $v.classID;
      _classEmailDomain = $v.classEmailDomain;
      _wage = $v.wage;
      _classJobList = $v.classJobList?.toBuilder();
      _classAuthInfo = $v.classAuthInfo;
      _bankOSPassword = $v.bankOSPassword;
      _bankOSLog = $v.bankOSLog?.toBuilder();
      _essentialJobList = $v.essentialJobList?.toBuilder();
      _marketOption = $v.marketOption;
      _marketTrader = $v.marketTrader;
      _bankTransactionFee = $v.bankTransactionFee;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClassSettingRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClassSettingRecord;
  }

  @override
  void update(void Function(ClassSettingRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ClassSettingRecord build() {
    _$ClassSettingRecord _$result;
    try {
      _$result = _$v ??
          new _$ClassSettingRecord._(
              interest: interest,
              wagePeriod: wagePeriod,
              propertyTradeOption: propertyTradeOption,
              taxRates: taxRates,
              currencyUnitName: currencyUnitName,
              bankRates: bankRates,
              loanOption: loanOption,
              school: school,
              grade: grade,
              ban: ban,
              teacherName: teacherName,
              classID: classID,
              classEmailDomain: classEmailDomain,
              wage: wage,
              classJobList: _classJobList?.build(),
              classAuthInfo: classAuthInfo,
              bankOSPassword: bankOSPassword,
              bankOSLog: _bankOSLog?.build(),
              essentialJobList: _essentialJobList?.build(),
              marketOption: marketOption,
              marketTrader: marketTrader,
              bankTransactionFee: bankTransactionFee,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'classJobList';
        _classJobList?.build();

        _$failedField = 'bankOSLog';
        _bankOSLog?.build();
        _$failedField = 'essentialJobList';
        _essentialJobList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ClassSettingRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
