import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import '../quiz_create/quiz_create_widget.dart';
import '../quiz_detail/quiz_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class QuizWidget extends StatefulWidget {
  const QuizWidget({Key key}) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  PagingController<DocumentSnapshot, QuizRecord> _pagingController;
  Query _pagingQuery;
  List<StreamSubscription> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
          child: Text(
            '경제 퀴즈 관리',
            style: FlutterFlowTheme.of(context).title1,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).darkBG,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FloatingActionButton pressed ...');
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8,
        child: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          buttonSize: 48,
          icon: Icon(
            Icons.add_rounded,
            color: FlutterFlowTheme.of(context).white,
            size: 30,
          ),
          onPressed: () async {
            await Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeft,
                duration: Duration(milliseconds: 240),
                reverseDuration: Duration(milliseconds: 240),
                child: QuizCreateWidget(),
              ),
            );
          },
        ),
      ),
      body: SafeArea(
        child: AuthUserStreamWidget(
          child: FutureBuilder<List<ClassSettingRecord>>(
            future: queryClassSettingRecordOnce(
              queryBuilder: (classSettingRecord) => classSettingRecord.where(
                  'ClassAuthInfo',
                  isEqualTo: valueOrDefault(
                              currentUserDocument?.userAuthInfo, '') !=
                          ''
                      ? valueOrDefault(currentUserDocument?.userAuthInfo, '')
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
                  Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '진행 중 경제 퀴즈',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: PagedListView<DocumentSnapshot<Object>, QuizRecord>(
                      pagingController: () {
                        final Query<Object> Function(Query<Object>)
                            queryBuilder = (quizRecord) => quizRecord.where(
                                'QuizAuthInfo',
                                isEqualTo: valueOrDefault(
                                            currentUserDocument?.userAuthInfo,
                                            '') !=
                                        ''
                                    ? valueOrDefault(
                                        currentUserDocument?.userAuthInfo, '')
                                    : null);
                        if (_pagingController != null) {
                          final query = queryBuilder(QuizRecord.collection);
                          if (query != _pagingQuery) {
                            // The query has changed
                            _pagingQuery = query;
                            _streamSubscriptions.forEach((s) => s?.cancel());
                            _streamSubscriptions.clear();
                            _pagingController.refresh();
                          }
                          return _pagingController;
                        }

                        _pagingController =
                            PagingController(firstPageKey: null);
                        _pagingQuery = queryBuilder(QuizRecord.collection);
                        _pagingController
                            .addPageRequestListener((nextPageMarker) {
                          queryQuizRecordPage(
                            queryBuilder: (quizRecord) => quizRecord.where(
                                'QuizAuthInfo',
                                isEqualTo: valueOrDefault(
                                            currentUserDocument?.userAuthInfo,
                                            '') !=
                                        ''
                                    ? valueOrDefault(
                                        currentUserDocument?.userAuthInfo, '')
                                    : null),
                            nextPageMarker: nextPageMarker,
                            pageSize: 8,
                            isStream: true,
                          ).then((page) {
                            _pagingController.appendPage(
                              page.data,
                              page.nextPageMarker,
                            );
                            final streamSubscription =
                                page.dataStream?.listen((data) {
                              final itemIndexes = _pagingController.itemList
                                  .asMap()
                                  .map((k, v) => MapEntry(v.reference.id, k));
                              data.forEach((item) {
                                final index = itemIndexes[item.reference.id];
                                if (index != null) {
                                  _pagingController.itemList
                                      .replaceRange(index, index + 1, [item]);
                                }
                              });
                              setState(() {});
                            });
                            _streamSubscriptions.add(streamSubscription);
                          });
                        });
                        return _pagingController;
                      }(),
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      builderDelegate: PagedChildBuilderDelegate<QuizRecord>(
                        // Customize what your widget looks like when it's loading the first page.
                        firstPageProgressIndicatorBuilder: (_) => Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                          ),
                        ),

                        itemBuilder: (context, _, listViewIndex) {
                          final listViewQuizRecord =
                              _pagingController.itemList[listViewIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                            child: Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                QuizDetailWidget(
                                              quizRef:
                                                  listViewQuizRecord.reference,
                                              classCurrencyRef:
                                                  columnClassSettingRecord
                                                      .currencyUnitName,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            listViewQuizRecord.quiz,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                          Text(
                                            '정답자 ${listViewQuizRecord.quizRightAnswerStdList.toList().length.toString()}명  / 오답자 ${listViewQuizRecord.quizWrongAnswerStdList.toList().length.toString()}명 / 정답 보상 ${listViewQuizRecord.quizReward.toString()} ${columnClassSettingRecord.currencyUnitName}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    borderWidth: 1,
                                    buttonSize: 60,
                                    icon: Icon(
                                      Icons.close_outlined,
                                      color: FlutterFlowTheme.of(context).white,
                                      size: 30,
                                    ),
                                    onPressed: () async {
                                      await listViewQuizRecord.reference
                                          .delete();
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          duration: Duration(milliseconds: 240),
                                          reverseDuration:
                                              Duration(milliseconds: 240),
                                          child:
                                              NavBarPage(initialPage: 'Quiz'),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
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
      ),
    );
  }
}
