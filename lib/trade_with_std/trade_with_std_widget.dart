import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TradeWithStdWidget extends StatefulWidget {
  const TradeWithStdWidget({Key key}) : super(key: key);

  @override
  _TradeWithStdWidgetState createState() => _TradeWithStdWidgetState();
}

class _TradeWithStdWidgetState extends State<TradeWithStdWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      child: StreamBuilder<List<TradeRecord>>(
        stream: queryTradeRecord(
          queryBuilder: (tradeRecord) => tradeRecord
              .where('TradeToWho', isEqualTo: '선생님')
              .where('TradeFromWhoSchool',
                  isEqualTo:
                      valueOrDefault(currentUserDocument?.school, '') != ''
                          ? valueOrDefault(currentUserDocument?.school, '')
                          : null)
              .where('TradeFromWhoGrade',
                  isEqualTo:
                      valueOrDefault(currentUserDocument?.grade, '') != ''
                          ? valueOrDefault(currentUserDocument?.grade, '')
                          : null)
              .where('TradeFromWhoBan',
                  isEqualTo: valueOrDefault(currentUserDocument?.ban, '') != ''
                      ? valueOrDefault(currentUserDocument?.ban, '')
                      : null)
              .where('TradeComplete', isEqualTo: '결재대기중'),
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
          List<TradeRecord> tradeWithStdTradeRecordList = snapshot.data;
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryColor,
              automaticallyImplyLeading: false,
              title: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                child: Text(
                  '학생이 요청한 거래',
                  style: FlutterFlowTheme.of(context).title1,
                ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 0,
            ),
            backgroundColor: FlutterFlowTheme.of(context).darkBG,
            body: SafeArea(
              child: StreamBuilder<List<ClassSettingRecord>>(
                stream: queryClassSettingRecord(
                  queryBuilder: (classSettingRecord) =>
                      classSettingRecord.where('ClassAuthInfo',
                          isEqualTo: valueOrDefault(
                                      currentUserDocument?.userAuthInfo, '') !=
                                  ''
                              ? valueOrDefault(
                                  currentUserDocument?.userAuthInfo, '')
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
                  List<ClassSettingRecord> columnClassSettingRecordList =
                      snapshot.data;
                  // Return an empty Container when the document does not exist.
                  if (snapshot.data.isEmpty) {
                    return Container();
                  }
                  final columnClassSettingRecord =
                      columnClassSettingRecordList.isNotEmpty
                          ? columnClassSettingRecordList.first
                          : null;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 53,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).darkBG,
                              image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: Image.asset(
                                  'assets/images/waves@2x.png',
                                ).image,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  '학생이 요청한 거래 처리 페이지입니다.',
                                  style: FlutterFlowTheme.of(context).bodyText2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          child: Builder(
                            builder: (context) {
                              final tradeWithStdGridView =
                                  tradeWithStdTradeRecordList?.toList() ?? [];
                              return GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 1,
                                ),
                                scrollDirection: Axis.vertical,
                                itemCount: tradeWithStdGridView.length,
                                itemBuilder:
                                    (context, tradeWithStdGridViewIndex) {
                                  final tradeWithStdGridViewItem =
                                      tradeWithStdGridView[
                                          tradeWithStdGridViewIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 5, 5, 5),
                                    child: InkWell(
                                      onTap: () async {
                                        final tradeUpdateData =
                                            createTradeRecordData(
                                          tradeComplete: '거래완료대기',
                                        );
                                        await tradeWithStdGridViewItem.reference
                                            .update(tradeUpdateData);
                                      },
                                      child: Container(
                                        width: 120,
                                        height: 120,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 10, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30,
                                                    borderWidth: 1,
                                                    buttonSize: 30,
                                                    icon: Icon(
                                                      Icons.clear_outlined,
                                                      color: Colors.black,
                                                      size: 20,
                                                    ),
                                                    onPressed: () async {
                                                      await tradeWithStdGridViewItem
                                                          .reference
                                                          .delete();
                                                    },
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        tradeWithStdGridViewItem
                                                            .tradeLabel,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle1
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    'from ${tradeWithStdGridViewItem.tradeFromWho}',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        '${formatNumber(
                                                          tradeWithStdGridViewItem
                                                              .amount,
                                                          formatType: FormatType
                                                              .decimal,
                                                          decimalType:
                                                              DecimalType
                                                                  .automatic,
                                                        )} ${columnClassSettingRecord.currencyUnitName}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .title3
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
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
