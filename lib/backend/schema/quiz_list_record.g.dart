// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_list_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<QuizListRecord> _$quizListRecordSerializer =
    new _$QuizListRecordSerializer();

class _$QuizListRecordSerializer
    implements StructuredSerializer<QuizListRecord> {
  @override
  final Iterable<Type> types = const [QuizListRecord, _$QuizListRecord];
  @override
  final String wireName = 'QuizListRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, QuizListRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.quiz;
    if (value != null) {
      result
        ..add('Quiz')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.answer;
    if (value != null) {
      result
        ..add('Answer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.quizAuthInfo;
    if (value != null) {
      result
        ..add('QuizAuthInfo')
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
  QuizListRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new QuizListRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'Quiz':
          result.quiz = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Answer':
          result.answer = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'QuizAuthInfo':
          result.quizAuthInfo = serializers.deserialize(value,
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

class _$QuizListRecord extends QuizListRecord {
  @override
  final String quiz;
  @override
  final String answer;
  @override
  final String quizAuthInfo;
  @override
  final DocumentReference<Object> reference;

  factory _$QuizListRecord([void Function(QuizListRecordBuilder) updates]) =>
      (new QuizListRecordBuilder()..update(updates)).build();

  _$QuizListRecord._(
      {this.quiz, this.answer, this.quizAuthInfo, this.reference})
      : super._();

  @override
  QuizListRecord rebuild(void Function(QuizListRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QuizListRecordBuilder toBuilder() =>
      new QuizListRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QuizListRecord &&
        quiz == other.quiz &&
        answer == other.answer &&
        quizAuthInfo == other.quizAuthInfo &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, quiz.hashCode), answer.hashCode), quizAuthInfo.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('QuizListRecord')
          ..add('quiz', quiz)
          ..add('answer', answer)
          ..add('quizAuthInfo', quizAuthInfo)
          ..add('reference', reference))
        .toString();
  }
}

class QuizListRecordBuilder
    implements Builder<QuizListRecord, QuizListRecordBuilder> {
  _$QuizListRecord _$v;

  String _quiz;
  String get quiz => _$this._quiz;
  set quiz(String quiz) => _$this._quiz = quiz;

  String _answer;
  String get answer => _$this._answer;
  set answer(String answer) => _$this._answer = answer;

  String _quizAuthInfo;
  String get quizAuthInfo => _$this._quizAuthInfo;
  set quizAuthInfo(String quizAuthInfo) => _$this._quizAuthInfo = quizAuthInfo;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  QuizListRecordBuilder() {
    QuizListRecord._initializeBuilder(this);
  }

  QuizListRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _quiz = $v.quiz;
      _answer = $v.answer;
      _quizAuthInfo = $v.quizAuthInfo;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(QuizListRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$QuizListRecord;
  }

  @override
  void update(void Function(QuizListRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$QuizListRecord build() {
    final _$result = _$v ??
        new _$QuizListRecord._(
            quiz: quiz,
            answer: answer,
            quizAuthInfo: quizAuthInfo,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
