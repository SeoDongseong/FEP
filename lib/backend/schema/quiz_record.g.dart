// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<QuizRecord> _$quizRecordSerializer = new _$QuizRecordSerializer();

class _$QuizRecordSerializer implements StructuredSerializer<QuizRecord> {
  @override
  final Iterable<Type> types = const [QuizRecord, _$QuizRecord];
  @override
  final String wireName = 'QuizRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, QuizRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.quizAuthInfo;
    if (value != null) {
      result
        ..add('QuizAuthInfo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.quiz;
    if (value != null) {
      result
        ..add('Quiz')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.quizAnswer;
    if (value != null) {
      result
        ..add('QuizAnswer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.quizReward;
    if (value != null) {
      result
        ..add('QuizReward')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.quizRightAnswerStdList;
    if (value != null) {
      result
        ..add('QuizRightAnswerStdList')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.quizWrongAnswerStdList;
    if (value != null) {
      result
        ..add('QuizWrongAnswerStdList')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.quizTimeStamp;
    if (value != null) {
      result
        ..add('QuizTimeStamp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  QuizRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new QuizRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'QuizAuthInfo':
          result.quizAuthInfo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Quiz':
          result.quiz = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'QuizAnswer':
          result.quizAnswer = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'QuizReward':
          result.quizReward = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'QuizRightAnswerStdList':
          result.quizRightAnswerStdList.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'QuizWrongAnswerStdList':
          result.quizWrongAnswerStdList.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'QuizTimeStamp':
          result.quizTimeStamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
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

class _$QuizRecord extends QuizRecord {
  @override
  final String quizAuthInfo;
  @override
  final String quiz;
  @override
  final String quizAnswer;
  @override
  final int quizReward;
  @override
  final BuiltList<String> quizRightAnswerStdList;
  @override
  final BuiltList<String> quizWrongAnswerStdList;
  @override
  final DateTime quizTimeStamp;
  @override
  final DocumentReference<Object> reference;

  factory _$QuizRecord([void Function(QuizRecordBuilder) updates]) =>
      (new QuizRecordBuilder()..update(updates)).build();

  _$QuizRecord._(
      {this.quizAuthInfo,
      this.quiz,
      this.quizAnswer,
      this.quizReward,
      this.quizRightAnswerStdList,
      this.quizWrongAnswerStdList,
      this.quizTimeStamp,
      this.reference})
      : super._();

  @override
  QuizRecord rebuild(void Function(QuizRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QuizRecordBuilder toBuilder() => new QuizRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QuizRecord &&
        quizAuthInfo == other.quizAuthInfo &&
        quiz == other.quiz &&
        quizAnswer == other.quizAnswer &&
        quizReward == other.quizReward &&
        quizRightAnswerStdList == other.quizRightAnswerStdList &&
        quizWrongAnswerStdList == other.quizWrongAnswerStdList &&
        quizTimeStamp == other.quizTimeStamp &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, quizAuthInfo.hashCode), quiz.hashCode),
                            quizAnswer.hashCode),
                        quizReward.hashCode),
                    quizRightAnswerStdList.hashCode),
                quizWrongAnswerStdList.hashCode),
            quizTimeStamp.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('QuizRecord')
          ..add('quizAuthInfo', quizAuthInfo)
          ..add('quiz', quiz)
          ..add('quizAnswer', quizAnswer)
          ..add('quizReward', quizReward)
          ..add('quizRightAnswerStdList', quizRightAnswerStdList)
          ..add('quizWrongAnswerStdList', quizWrongAnswerStdList)
          ..add('quizTimeStamp', quizTimeStamp)
          ..add('reference', reference))
        .toString();
  }
}

class QuizRecordBuilder implements Builder<QuizRecord, QuizRecordBuilder> {
  _$QuizRecord _$v;

  String _quizAuthInfo;
  String get quizAuthInfo => _$this._quizAuthInfo;
  set quizAuthInfo(String quizAuthInfo) => _$this._quizAuthInfo = quizAuthInfo;

  String _quiz;
  String get quiz => _$this._quiz;
  set quiz(String quiz) => _$this._quiz = quiz;

  String _quizAnswer;
  String get quizAnswer => _$this._quizAnswer;
  set quizAnswer(String quizAnswer) => _$this._quizAnswer = quizAnswer;

  int _quizReward;
  int get quizReward => _$this._quizReward;
  set quizReward(int quizReward) => _$this._quizReward = quizReward;

  ListBuilder<String> _quizRightAnswerStdList;
  ListBuilder<String> get quizRightAnswerStdList =>
      _$this._quizRightAnswerStdList ??= new ListBuilder<String>();
  set quizRightAnswerStdList(ListBuilder<String> quizRightAnswerStdList) =>
      _$this._quizRightAnswerStdList = quizRightAnswerStdList;

  ListBuilder<String> _quizWrongAnswerStdList;
  ListBuilder<String> get quizWrongAnswerStdList =>
      _$this._quizWrongAnswerStdList ??= new ListBuilder<String>();
  set quizWrongAnswerStdList(ListBuilder<String> quizWrongAnswerStdList) =>
      _$this._quizWrongAnswerStdList = quizWrongAnswerStdList;

  DateTime _quizTimeStamp;
  DateTime get quizTimeStamp => _$this._quizTimeStamp;
  set quizTimeStamp(DateTime quizTimeStamp) =>
      _$this._quizTimeStamp = quizTimeStamp;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  QuizRecordBuilder() {
    QuizRecord._initializeBuilder(this);
  }

  QuizRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _quizAuthInfo = $v.quizAuthInfo;
      _quiz = $v.quiz;
      _quizAnswer = $v.quizAnswer;
      _quizReward = $v.quizReward;
      _quizRightAnswerStdList = $v.quizRightAnswerStdList?.toBuilder();
      _quizWrongAnswerStdList = $v.quizWrongAnswerStdList?.toBuilder();
      _quizTimeStamp = $v.quizTimeStamp;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(QuizRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$QuizRecord;
  }

  @override
  void update(void Function(QuizRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$QuizRecord build() {
    _$QuizRecord _$result;
    try {
      _$result = _$v ??
          new _$QuizRecord._(
              quizAuthInfo: quizAuthInfo,
              quiz: quiz,
              quizAnswer: quizAnswer,
              quizReward: quizReward,
              quizRightAnswerStdList: _quizRightAnswerStdList?.build(),
              quizWrongAnswerStdList: _quizWrongAnswerStdList?.build(),
              quizTimeStamp: quizTimeStamp,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'quizRightAnswerStdList';
        _quizRightAnswerStdList?.build();
        _$failedField = 'quizWrongAnswerStdList';
        _quizWrongAnswerStdList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'QuizRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
