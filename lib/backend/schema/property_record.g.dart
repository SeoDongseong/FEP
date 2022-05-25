// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PropertyRecord> _$propertyRecordSerializer =
    new _$PropertyRecordSerializer();

class _$PropertyRecordSerializer
    implements StructuredSerializer<PropertyRecord> {
  @override
  final Iterable<Type> types = const [PropertyRecord, _$PropertyRecord];
  @override
  final String wireName = 'PropertyRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, PropertyRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.propertyOwner;
    if (value != null) {
      result
        ..add('PropertyOwner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.propertyPrice;
    if (value != null) {
      result
        ..add('PropertyPrice')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.propertyAuthInfo;
    if (value != null) {
      result
        ..add('PropertyAuthInfo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.propertyLastInfo;
    if (value != null) {
      result
        ..add('PropertyLastInfo')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.propertyLoan;
    if (value != null) {
      result
        ..add('PropertyLoan')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.propertyOnSale;
    if (value != null) {
      result
        ..add('PropertyOnSale')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.propertyLoanPrice;
    if (value != null) {
      result
        ..add('PropertyLoanPrice')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.propertyIndex;
    if (value != null) {
      result
        ..add('PropertyIndex')
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
  PropertyRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PropertyRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'PropertyOwner':
          result.propertyOwner = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'PropertyPrice':
          result.propertyPrice = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'PropertyAuthInfo':
          result.propertyAuthInfo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'PropertyLastInfo':
          result.propertyLastInfo.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'PropertyLoan':
          result.propertyLoan = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'PropertyOnSale':
          result.propertyOnSale = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'PropertyLoanPrice':
          result.propertyLoanPrice = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'PropertyIndex':
          result.propertyIndex = serializers.deserialize(value,
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

class _$PropertyRecord extends PropertyRecord {
  @override
  final String propertyOwner;
  @override
  final int propertyPrice;
  @override
  final String propertyAuthInfo;
  @override
  final BuiltList<String> propertyLastInfo;
  @override
  final String propertyLoan;
  @override
  final bool propertyOnSale;
  @override
  final int propertyLoanPrice;
  @override
  final int propertyIndex;
  @override
  final DocumentReference<Object> reference;

  factory _$PropertyRecord([void Function(PropertyRecordBuilder) updates]) =>
      (new PropertyRecordBuilder()..update(updates)).build();

  _$PropertyRecord._(
      {this.propertyOwner,
      this.propertyPrice,
      this.propertyAuthInfo,
      this.propertyLastInfo,
      this.propertyLoan,
      this.propertyOnSale,
      this.propertyLoanPrice,
      this.propertyIndex,
      this.reference})
      : super._();

  @override
  PropertyRecord rebuild(void Function(PropertyRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PropertyRecordBuilder toBuilder() =>
      new PropertyRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PropertyRecord &&
        propertyOwner == other.propertyOwner &&
        propertyPrice == other.propertyPrice &&
        propertyAuthInfo == other.propertyAuthInfo &&
        propertyLastInfo == other.propertyLastInfo &&
        propertyLoan == other.propertyLoan &&
        propertyOnSale == other.propertyOnSale &&
        propertyLoanPrice == other.propertyLoanPrice &&
        propertyIndex == other.propertyIndex &&
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
                                $jc($jc(0, propertyOwner.hashCode),
                                    propertyPrice.hashCode),
                                propertyAuthInfo.hashCode),
                            propertyLastInfo.hashCode),
                        propertyLoan.hashCode),
                    propertyOnSale.hashCode),
                propertyLoanPrice.hashCode),
            propertyIndex.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PropertyRecord')
          ..add('propertyOwner', propertyOwner)
          ..add('propertyPrice', propertyPrice)
          ..add('propertyAuthInfo', propertyAuthInfo)
          ..add('propertyLastInfo', propertyLastInfo)
          ..add('propertyLoan', propertyLoan)
          ..add('propertyOnSale', propertyOnSale)
          ..add('propertyLoanPrice', propertyLoanPrice)
          ..add('propertyIndex', propertyIndex)
          ..add('reference', reference))
        .toString();
  }
}

class PropertyRecordBuilder
    implements Builder<PropertyRecord, PropertyRecordBuilder> {
  _$PropertyRecord _$v;

  String _propertyOwner;
  String get propertyOwner => _$this._propertyOwner;
  set propertyOwner(String propertyOwner) =>
      _$this._propertyOwner = propertyOwner;

  int _propertyPrice;
  int get propertyPrice => _$this._propertyPrice;
  set propertyPrice(int propertyPrice) => _$this._propertyPrice = propertyPrice;

  String _propertyAuthInfo;
  String get propertyAuthInfo => _$this._propertyAuthInfo;
  set propertyAuthInfo(String propertyAuthInfo) =>
      _$this._propertyAuthInfo = propertyAuthInfo;

  ListBuilder<String> _propertyLastInfo;
  ListBuilder<String> get propertyLastInfo =>
      _$this._propertyLastInfo ??= new ListBuilder<String>();
  set propertyLastInfo(ListBuilder<String> propertyLastInfo) =>
      _$this._propertyLastInfo = propertyLastInfo;

  String _propertyLoan;
  String get propertyLoan => _$this._propertyLoan;
  set propertyLoan(String propertyLoan) => _$this._propertyLoan = propertyLoan;

  bool _propertyOnSale;
  bool get propertyOnSale => _$this._propertyOnSale;
  set propertyOnSale(bool propertyOnSale) =>
      _$this._propertyOnSale = propertyOnSale;

  int _propertyLoanPrice;
  int get propertyLoanPrice => _$this._propertyLoanPrice;
  set propertyLoanPrice(int propertyLoanPrice) =>
      _$this._propertyLoanPrice = propertyLoanPrice;

  int _propertyIndex;
  int get propertyIndex => _$this._propertyIndex;
  set propertyIndex(int propertyIndex) => _$this._propertyIndex = propertyIndex;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  PropertyRecordBuilder() {
    PropertyRecord._initializeBuilder(this);
  }

  PropertyRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _propertyOwner = $v.propertyOwner;
      _propertyPrice = $v.propertyPrice;
      _propertyAuthInfo = $v.propertyAuthInfo;
      _propertyLastInfo = $v.propertyLastInfo?.toBuilder();
      _propertyLoan = $v.propertyLoan;
      _propertyOnSale = $v.propertyOnSale;
      _propertyLoanPrice = $v.propertyLoanPrice;
      _propertyIndex = $v.propertyIndex;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PropertyRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PropertyRecord;
  }

  @override
  void update(void Function(PropertyRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PropertyRecord build() {
    _$PropertyRecord _$result;
    try {
      _$result = _$v ??
          new _$PropertyRecord._(
              propertyOwner: propertyOwner,
              propertyPrice: propertyPrice,
              propertyAuthInfo: propertyAuthInfo,
              propertyLastInfo: _propertyLastInfo?.build(),
              propertyLoan: propertyLoan,
              propertyOnSale: propertyOnSale,
              propertyLoanPrice: propertyLoanPrice,
              propertyIndex: propertyIndex,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'propertyLastInfo';
        _propertyLastInfo?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PropertyRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
