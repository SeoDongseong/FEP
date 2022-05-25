import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import '../splash_screen/splash_screen_widget.dart';
import '../tax_detail/tax_detail_widget.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      child: FutureBuilder<List<ClassSettingRecord>>(
        future: queryClassSettingRecordOnce(
          queryBuilder: (classSettingRecord) => classSettingRecord.where(
              'ClassAuthInfo',
              isEqualTo:
                  valueOrDefault(currentUserDocument?.userAuthInfo, '') != ''
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
          List<ClassSettingRecord> homeClassSettingRecordList = snapshot.data;
          // Return an empty Container when the document does not exist.
          if (snapshot.data.isEmpty) {
            return Container();
          }
          final homeClassSettingRecord = homeClassSettingRecordList.isNotEmpty
              ? homeClassSettingRecordList.first
              : null;
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryColor,
              automaticallyImplyLeading: false,
              title: Text(
                '금융교실 플랫폼',
                style: FlutterFlowTheme.of(context).title1,
              ),
              actions: [],
              centerTitle: true,
              elevation: 0,
            ),
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                await signOut();
                await Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SplashScreenWidget(),
                  ),
                  (r) => false,
                );
              },
              backgroundColor: FlutterFlowTheme.of(context).primaryColor,
              elevation: 8,
              child: Icon(
                Icons.logout,
                color: FlutterFlowTheme.of(context).white,
                size: 30,
              ),
            ),
            body: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
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
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '금융교실에 오신것을 환영합니다.',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ],
                  ),
                  Expanded(
                    child: StreamBuilder<List<ClassSettingRecord>>(
                      stream: queryClassSettingRecord(
                        queryBuilder: (classSettingRecord) => classSettingRecord
                            .where('School',
                                isEqualTo: valueOrDefault(
                                            currentUserDocument?.school, '') !=
                                        ''
                                    ? valueOrDefault(
                                        currentUserDocument?.school, '')
                                    : null)
                            .where('Grade',
                                isEqualTo: valueOrDefault(
                                            currentUserDocument?.grade, '') !=
                                        ''
                                    ? valueOrDefault(
                                        currentUserDocument?.grade, '')
                                    : null)
                            .where('Ban',
                                isEqualTo: valueOrDefault(
                                            currentUserDocument?.ban, '') !=
                                        ''
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
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        List<ClassSettingRecord>
                            gridViewClassSettingRecordList = snapshot.data;
                        // Return an empty Container when the document does not exist.
                        if (snapshot.data.isEmpty) {
                          return Container();
                        }
                        final gridViewClassSettingRecord =
                            gridViewClassSettingRecordList.isNotEmpty
                                ? gridViewClassSettingRecordList.first
                                : null;
                        return GridView(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1,
                          ),
                          scrollDirection: Axis.vertical,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5,
                                      color: Colors.black,
                                      offset: Offset(5, 5),
                                      spreadRadius: 1,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        duration: Duration(milliseconds: 240),
                                        reverseDuration:
                                            Duration(milliseconds: 240),
                                        child: NavBarPage(
                                            initialPage: 'myStudents'),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.playlist_add,
                                            color: FlutterFlowTheme.of(context)
                                                .white,
                                            size: 80,
                                          ),
                                          Text(
                                            '학생 관리',
                                            style: FlutterFlowTheme.of(context)
                                                .title2,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5,
                                      color: Colors.black,
                                      offset: Offset(5, 5),
                                      spreadRadius: 1,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        duration: Duration(milliseconds: 240),
                                        reverseDuration:
                                            Duration(milliseconds: 240),
                                        child: NavBarPage(
                                            initialPage: 'ClassSetting'),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.settings,
                                            color: FlutterFlowTheme.of(context)
                                                .white,
                                            size: 70,
                                          ),
                                          Text(
                                            '금융교실 설정',
                                            style: FlutterFlowTheme.of(context)
                                                .title2
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  fontSize: 20,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5,
                                      color: Colors.black,
                                      offset: Offset(5, 5),
                                      spreadRadius: 1,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        duration: Duration(milliseconds: 240),
                                        reverseDuration:
                                            Duration(milliseconds: 240),
                                        child: TaxDetailWidget(),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.monetization_on,
                                            color: FlutterFlowTheme.of(context)
                                                .white,
                                            size: 70,
                                          ),
                                          Text(
                                            '세금 관리',
                                            style: FlutterFlowTheme.of(context)
                                                .title2,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            if (gridViewClassSettingRecord
                                    .propertyTradeOption ??
                                true)
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                child: Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 5,
                                        color: Colors.black,
                                        offset: Offset(5, 5),
                                        spreadRadius: 1,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          duration: Duration(milliseconds: 240),
                                          reverseDuration:
                                              Duration(milliseconds: 240),
                                          child: NavBarPage(
                                              initialPage: 'PropertySetting'),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.settings,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .white,
                                              size: 70,
                                            ),
                                            Text(
                                              '부동산 관리',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title2
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        fontSize: 22,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                              child: StreamBuilder<List<TradeRecord>>(
                                stream: queryTradeRecord(
                                  queryBuilder: (tradeRecord) => tradeRecord
                                      .where('TradeToWho', isEqualTo: '선생님')
                                      .where('TradeFromWhoSchool',
                                          isEqualTo: valueOrDefault(
                                                      currentUserDocument
                                                          ?.school,
                                                      '') !=
                                                  ''
                                              ? valueOrDefault(
                                                  currentUserDocument?.school,
                                                  '')
                                              : null)
                                      .where('TradeFromWhoGrade',
                                          isEqualTo: valueOrDefault(currentUserDocument?.grade, '') !=
                                                  ''
                                              ? valueOrDefault(
                                                  currentUserDocument?.grade,
                                                  '')
                                              : null)
                                      .where('TradeFromWhoBan',
                                          isEqualTo: valueOrDefault(
                                                      currentUserDocument?.ban,
                                                      '') !=
                                                  ''
                                              ? valueOrDefault(
                                                  currentUserDocument?.ban, '')
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                  List<TradeRecord>
                                      tradewithStdTradeRecordList =
                                      snapshot.data;
                                  return Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 5,
                                          color: Colors.black,
                                          offset: Offset(5, 5),
                                          spreadRadius: 1,
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type:
                                                PageTransitionType.rightToLeft,
                                            duration:
                                                Duration(milliseconds: 240),
                                            reverseDuration:
                                                Duration(milliseconds: 240),
                                            child: NavBarPage(
                                                initialPage: 'TradeWithStd'),
                                          ),
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Badge(
                                                badgeContent: Text(
                                                  tradewithStdTradeRecordList
                                                      .length
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: Colors.white,
                                                      ),
                                                ),
                                                showBadge:
                                                    (tradewithStdTradeRecordList
                                                            .length) !=
                                                        0,
                                                shape: BadgeShape.circle,
                                                badgeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                elevation: 4,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 8, 8, 8),
                                                position:
                                                    BadgePosition.topEnd(),
                                                animationType:
                                                    BadgeAnimationType.scale,
                                                toAnimate: true,
                                                child: Icon(
                                                  Icons.sync_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .white,
                                                  size: 70,
                                                ),
                                              ),
                                              Text(
                                                '학생과 거래',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title2,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5,
                                      color: Colors.black,
                                      offset: Offset(5, 5),
                                      spreadRadius: 1,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        duration: Duration(milliseconds: 240),
                                        reverseDuration:
                                            Duration(milliseconds: 240),
                                        child: NavBarPage(
                                            initialPage: 'BankOSSetting'),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.monetization_on,
                                            color: FlutterFlowTheme.of(context)
                                                .white,
                                            size: 70,
                                          ),
                                          Text(
                                            '은행 시스템',
                                            style: FlutterFlowTheme.of(context)
                                                .title2,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5,
                                      color: Colors.black,
                                      offset: Offset(5, 5),
                                      spreadRadius: 1,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        duration: Duration(milliseconds: 240),
                                        reverseDuration:
                                            Duration(milliseconds: 240),
                                        child: NavBarPage(initialPage: 'Quiz'),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.help_outline,
                                            color: FlutterFlowTheme.of(context)
                                                .white,
                                            size: 70,
                                          ),
                                          Text(
                                            '경제 퀴즈',
                                            style: FlutterFlowTheme.of(context)
                                                .title2
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  fontSize: 20,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5,
                                      color: Colors.black,
                                      offset: Offset(5, 5),
                                      spreadRadius: 1,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        duration: Duration(milliseconds: 240),
                                        reverseDuration:
                                            Duration(milliseconds: 240),
                                        child: NavBarPage(
                                            initialPage: 'MyProfile'),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.person_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .white,
                                            size: 70,
                                          ),
                                          Text(
                                            '프로필 관리',
                                            style: FlutterFlowTheme.of(context)
                                                .title2,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5,
                                      color: Colors.black,
                                      offset: Offset(5, 5),
                                      spreadRadius: 1,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        duration: Duration(milliseconds: 240),
                                        reverseDuration:
                                            Duration(milliseconds: 240),
                                        child: NavBarPage(initialPage: 'Help'),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.live_help_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .white,
                                            size: 70,
                                          ),
                                          Text(
                                            '도움말',
                                            style: FlutterFlowTheme.of(context)
                                                .title2,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
