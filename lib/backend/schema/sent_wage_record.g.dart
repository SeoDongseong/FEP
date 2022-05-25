// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sent_wage_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SentWageRecord> _$sentWageRecordSerializer =
    new _$SentWageRecordSerializer();

class _$SentWageRecordSerializer
    implements StructuredSerializer<SentWageRecord> {
  @override
  final Iterable<Type> types = const [SentWageRecord, _$SentWageRecord];
  @override
  final String wireName = 'SentWageRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, SentWageRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.wageAuthInfo;
    if (value != null) {
      result
        ..add('WageAuthInfo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.wageAmount;
    if (value != null) {
      result
        ..add('WageAmount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.wageLabel;
    if (value != null) {
      result
        ..add('WageLabel')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.wageReceivedStd;
    if (value != null) {
      result
        ..add('WageReceivedStd')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  SentWageRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SentWageRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'WageAuthInfo':
          result.wageAuthInfo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'WageAmount':
          result.wageAmount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'WageLabel':
          result.wageLabel = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'WageReceivedStd':
          result.wageReceivedStd.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
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

class _$SentWageRecord extends SentWageRecord {
  @override
  final String wageAuthInfo;
  @override
  final int wageAmount;
  @override
  final String wageLabel;
  @override
  final BuiltList<String> wageReceivedStd;
  @override
  final DocumentReference<Object> reference;

  factory _$SentWageRecord([void Function(SentWageRecordBuilder) updates]) =>
      (new SentWageRecordBuilder()..update(updates)).build();

  _$SentWageRecord._(
      {this.wageAuthInfo,
      this.wageAmount,
      this.wageLabel,
      this.wageReceivedStd,
      this.reference})
      : super._();

  @override
  SentWageRecord rebuild(void Function(SentWageRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SentWageRecordBuilder toBuilder() =>
      new SentWageRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SentWageRecord &&
        wageAuthInfo == other.wageAuthInfo &&
        wageAmount == other.wageAmount &&
        wageLabel == other.wageLabel &&
        wageReceivedStd == other.wageReceivedStd &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, wageAuthInfo.hashCode), wageAmount.hashCode),
                wageLabel.hashCode),
            wageReceivedStd.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SentWageRecord')
          ..add('wageAuthInfo', wageAuthInfo)
          ..add('wageAmount', wageAmount)
          ..add('wageLabel', wageLabel)
          ..add('wageReceivedStd', wageReceivedStd)
          ..add('reference', reference))
        .toString();
  }
}

class SentWageRecordBuilder
    implements Builder<SentWageRecord, SentWageRecordBuilder> {
  _$SentWageRecord _$v;

  String _wageAuthInfo;
  String get wageAuthInfo => _$this._wageAuthInfo;
  set wageAuthInfo(String wageAuthInfo) => _$this._wageAuthInfo = wageAuthInfo;

  int _wageAmount;
  int get wageAmount => _$this._wageAmount;
  set wageAmount(int wageAmount) => _$this._wageAmount = wageAmount;

  String _wageLabel;
  String get wageLabel => _$this._wageLabel;
  set wageLabel(String wageLabel) => _$this._wageLabel = wageLabel;

  ListBuilder<String> _wageReceivedStd;
  ListBuilder<String> get wageReceivedStd =>
      _$this._wageReceivedStd ??= new ListBuilder<String>();
  set wageReceivedStd(ListBuilder<String> wageReceivedStd) =>
      _$this._wageReceivedStd = wageReceivedStd;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  SentWageRecordBuilder() {
    SentWageRecord._initializeBuilder(this);
  }

  SentWageRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _wageAuthInfo = $v.wageAuthInfo;
      _wageAmount = $v.wageAmount;
      _wageLabel = $v.wageLabel;
      _wageReceivedStd = $v.wageReceivedStd?.toBuilder();
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SentWageRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SentWageRecord;
  }

  @override
  void update(void Function(SentWageRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SentWageRecord build() {
    _$SentWageRecord _$result;
    try {
      _$result = _$v ??
          new _$SentWageRecord._(
              wageAuthInfo: wageAuthInfo,
              wageAmount: wageAmount,
              wageLabel: wageLabel,
              wageReceivedStd: _wageReceivedStd?.build(),
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'wageReceivedStd';
        _wageReceivedStd?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SentWageRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
