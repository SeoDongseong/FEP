import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/delete_property_pop_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PropertyDetailWidget extends StatefulWidget {
  const PropertyDetailWidget({
    Key key,
    this.stdIncomeListRef,
    this.stdTotalCurrencyRef,
    this.propertyDetailRef,
  }) : super(key: key);

  final DocumentReference stdIncomeListRef;
  final DocumentReference stdTotalCurrencyRef;
  final DocumentReference propertyDetailRef;

  @override
  _PropertyDetailWidgetState createState() => _PropertyDetailWidgetState();
}

class _PropertyDetailWidgetState extends State<PropertyDetailWidget> {
  TextEditingController textController1;
  bool switchListTileValue;
  TextEditingController textController2;
  TextEditingController textController3;
  TextEditingController textController4;
  TextEditingController textController5;

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      child: StreamBuilder<List<ClassSettingRecord>>(
        stream: queryClassSettingRecord(
          queryBuilder: (classSettingRecord) => classSettingRecord
              .where('School',
                  isEqualTo:
                      valueOrDefault(currentUserDocument?.school, '') != ''
                          ? valueOrDefault(currentUserDocument?.school, '')
                          : null)
              .where('Grade',
                  isEqualTo:
                      valueOrDefault(currentUserDocument?.grade, '') != ''
                          ? valueOrDefault(currentUserDocument?.grade, '')
                          : null)
              .where('Ban',
                  isEqualTo: valueOrDefault(currentUserDocument?.ban, '') != ''
                      ? valueOrDefault(currentUserDocument?.ban, '')
                      : null),
          singleRecord: true,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  color: FlutterFlowTheme.of(context).primaryColor,
                ),
              ),
            );
          }
          List<ClassSettingRecord> containerClassSettingRecordList =
              snapshot.data;
          // Return an empty Container when the document does not exist.
          if (snapshot.data.isEmpty) {
            return Container();
          }
          final containerClassSettingRecord =
              containerClassSettingRecordList.isNotEmpty
                  ? containerClassSettingRecordList.first
                  : null;
          return Material(
            color: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBlack,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 7,
                    color: Color(0x5D000000),
                    offset: Offset(0, -2),
                  )
                ],
                borderRadius: BorderRadius.circular(0),
              ),
              child: StreamBuilder<PropertyRecord>(
                stream: PropertyRecord.getDocument(widget.propertyDetailRef),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                      ),
                    );
                  }
                  final columnPropertyRecord = snapshot.data;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              '${columnPropertyRecord.propertyIndex.toString()}번 자리 부동산 자세히 보기',
                              style: FlutterFlowTheme.of(context).title2,
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 60,
                              icon: Icon(
                                Icons.delete_forever_sharp,
                                color: FlutterFlowTheme.of(context).white,
                                size: 40,
                              ),
                              onPressed: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: DeletePropertyPopWidget(
                                        deletePropertyRef:
                                            columnPropertyRecord.reference,
                                      ),
                                    );
                                  },
                                );
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              '부동산에 대해 자세히 살펴봅니다.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 25),
                        child: Text(
                          '${columnPropertyRecord.propertyIndex.toString()}번 부동산 지난 거래 목록',
                          style:
                              FlutterFlowTheme.of(context).subtitle1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context).white,
                                  ),
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          final propertyTradeHistory = columnPropertyRecord
                                  .propertyLastInfo
                                  .toList()
                                  ?.toList() ??
                              [];
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(propertyTradeHistory.length,
                                (propertyTradeHistoryIndex) {
                              final propertyTradeHistoryItem =
                                  propertyTradeHistory[
                                      propertyTradeHistoryIndex];
                              return Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        propertyTradeHistoryItem,
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30,
                                        borderWidth: 1,
                                        buttonSize: 60,
                                        icon: Icon(
                                          Icons.cancel_sharp,
                                          color: Colors.black,
                                          size: 30,
                                        ),
                                        onPressed: () async {
                                          final propertyUpdateData = {
                                            'PropertyLastInfo':
                                                FieldValue.arrayRemove(
                                                    [propertyTradeHistoryItem]),
                                          };
                                          await columnPropertyRecord.reference
                                              .update(propertyUpdateData);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          );
                        },
                      ),
                      SwitchListTile(
                        value: switchListTileValue ??=
                            columnPropertyRecord.propertyOnSale,
                        onChanged: (newValue) =>
                            setState(() => switchListTileValue = newValue),
                        title: Text(
                          '이 부동산을 시장에 내놓기',
                          style: FlutterFlowTheme.of(context).title3,
                        ),
                        subtitle: Text(
                          '임대/판매 가능하게 하려면 켜주세요',
                          style: FlutterFlowTheme.of(context).subtitle2,
                        ),
                        tileColor: Color(0xFFF5F5F5),
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                              child: Text(
                                '부동산 번호',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: textController1 ??=
                                    TextEditingController(
                                  text: columnPropertyRecord.propertyIndex
                                      .toString(),
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                  hintText: '소유자를 강제로 변경하려면 입력하세요',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                              child: Text(
                                '현재 소유자',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: textController2 ??=
                                    TextEditingController(
                                  text: columnPropertyRecord.propertyOwner,
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                  hintText: '소유자를 강제로 변경하려면 입력하세요',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  prefixIcon: Icon(
                                    Icons.person_sharp,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                              child: Text(
                                '현재 임차인',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: textController3 ??=
                                    TextEditingController(
                                  text: columnPropertyRecord.propertyLoan,
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                  hintText: '소유자를 강제로 변경하려면 입력하세요',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  prefixIcon: Icon(
                                    Icons.person_sharp,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                              child: Text(
                                '판매 희망 가격',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: textController4 ??=
                                    TextEditingController(
                                  text: columnPropertyRecord.propertyPrice
                                      .toString(),
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                  hintText: '소유자를 강제로 변경하려면 입력하세요',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  prefixIcon: Icon(
                                    Icons.monetization_on,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                              child: Text(
                                '임대 희망가격',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: textController5 ??=
                                    TextEditingController(
                                  text: columnPropertyRecord.propertyLoanPrice
                                      .toString(),
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                  hintText: '소유자를 강제로 변경하려면 입력하세요',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  prefixIcon: Icon(
                                    Icons.monetization_on,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                final propertyUpdateData =
                                    createPropertyRecordData(
                                  propertyOwner: textController2?.text ?? '',
                                  propertyPrice:
                                      int.parse(textController4?.text ?? ''),
                                  propertyLoan: textController3?.text ?? '',
                                  propertyLoanPrice:
                                      int.parse(textController5?.text ?? ''),
                                  propertyOnSale: switchListTileValue,
                                  propertyAuthInfo:
                                      '${valueOrDefault(currentUserDocument?.school, '')}${valueOrDefault(currentUserDocument?.grade, '')}${valueOrDefault(currentUserDocument?.ban, '')}',
                                  propertyIndex:
                                      int.parse(textController1?.text ?? ''),
                                );
                                await columnPropertyRecord.reference
                                    .update(propertyUpdateData);
                                Navigator.pop(context);
                              },
                              text: '변경 내용 저장',
                              options: FFButtonOptions(
                                width: 130,
                                height: 50,
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 12,
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              text: '취소',
                              options: FFButtonOptions(
                                width: 130,
                                height: 50,
                                color:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
