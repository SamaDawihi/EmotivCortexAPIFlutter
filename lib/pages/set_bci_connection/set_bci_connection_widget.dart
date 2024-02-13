import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'set_bci_connection_model.dart';
export 'set_bci_connection_model.dart';

class SetBciConnectionWidget extends StatefulWidget {
  const SetBciConnectionWidget({super.key});

  @override
  State<SetBciConnectionWidget> createState() => _SetBciConnectionWidgetState();
}

class _SetBciConnectionWidgetState extends State<SetBciConnectionWidget> {
  late SetBciConnectionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SetBciConnectionModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.getCortexInfoCopyCopy = await actions.aGetCortexInfo();
      if (functions.getEmotivIsInstalled(_model.getCortexInfoCopyCopy!)) {
        setState(() {
          _model.emotivInstalled = true;
        });
        _model.getUserLoginCopy = await actions.aGetUserLogin();
        if (functions.getIsUserLogedIn(_model.getUserLoginCopy!)) {
          setState(() {
            _model.logedInEmotiv = true;
          });
          _model.hasAccessRightCopyCopy = await actions.cHasAccessRight(
            FFAppState().clientId,
            FFAppState().clientSecret,
          );
          if (functions.getHasAccessRight(_model.hasAccessRightCopyCopy!)) {
            setState(() {
              _model.hasAccessRight = true;
            });
            _model.queryHeadsetsCopyCopy = await actions.dQueryHeadset();
            setState(() {
              _model.availableHeadsets = functions
                  .getAvailableHeadsetId(_model.queryHeadsetsCopyCopy!)
                  .toList()
                  .cast<String>();
            });
            if (_model.availableHeadsets.isNotEmpty) {
              setState(() {
                _model.deviceIsConnected = true;
              });
              return;
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'No Device Available',
                    style: TextStyle(
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                  ),
                  duration: const Duration(milliseconds: 4000),
                  backgroundColor: FlutterFlowTheme.of(context).error,
                ),
              );
              setState(() {
                _model.deviceIsConnected = false;
                _model.availableHeadsets = [];
                _model.queryHeadsetError = _model.queryHeadsetsCopyCopy;
              });
              return;
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Access Right Isnt Granted, Click Request Access',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: const Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).error,
              ),
            );
            setState(() {
              _model.hasAccessRight = false;
              _model.deviceIsConnected = false;
              _model.availableHeadsets = [];
              _model.hasAccessError = _model.hasAccessRightCopyCopy;
            });
            return;
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'User Is Not Logged in',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: const Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).error,
            ),
          );
          setState(() {
            _model.logedInEmotiv = false;
            _model.hasAccessRight = false;
            _model.deviceIsConnected = false;
            _model.availableHeadsets = [];
          });
          return;
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Emotive Launcher Is not installed',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
        setState(() {
          _model.emotivInstalled = false;
          _model.logedInEmotiv = false;
          _model.hasAccessRight = false;
          _model.deviceIsConnected = false;
          _model.availableHeadsets = [];
          _model.getCortexInfoError = _model.getCortexInfoCopyCopy;
        });
        return;
      }
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: true,
          actions: const [],
          centerTitle: true,
          elevation: 4.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          ' Connection Details  ',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .displayMedium
                              .override(
                                fontFamily: 'Outfit',
                                color: const Color(0xFF4036A7),
                                fontSize: 40.0,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: TextFormField(
                                  controller: _model.textController1,
                                  focusNode: _model.textFieldFocusNode1,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Client ID\n',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    hintText: '[clientId]',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  validator: _model.textController1Validator
                                      .asValidator(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: TextFormField(
                                  controller: _model.textController2,
                                  focusNode: _model.textFieldFocusNode2,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Client Secret',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    hintText: '[clientSecret]',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  validator: _model.textController2Validator
                                      .asValidator(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (!((FFAppState().clientId ==
                                _model.textController1.text) &&
                            (FFAppState().clientSecret ==
                                _model.textController2.text)))
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 16.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                setState(() {
                                  FFAppState().clientId =
                                      _model.textController1.text;
                                  FFAppState().clientSecret =
                                      _model.textController2.text;
                                });
                              },
                              text: 'Update',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 50.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    170.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Connection Status ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: const Color(0xFF4036A7),
                                        fontSize: 40.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 50.0, 16.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            var shouldSetState = false;
                            _model.getCortexInfoCopy =
                                await actions.aGetCortexInfo();
                            shouldSetState = true;
                            if (functions.getEmotivIsInstalled(
                                _model.getCortexInfoCopy!)) {
                              setState(() {
                                _model.emotivInstalled = true;
                              });
                              _model.getUserLogin =
                                  await actions.aGetUserLogin();
                              shouldSetState = true;
                              if (functions
                                  .getIsUserLogedIn(_model.getUserLogin!)) {
                                setState(() {
                                  _model.logedInEmotiv = true;
                                });
                                _model.hasAccessRightCopy =
                                    await actions.cHasAccessRight(
                                  FFAppState().clientId,
                                  FFAppState().clientSecret,
                                );
                                shouldSetState = true;
                                if (functions.getHasAccessRight(
                                    _model.hasAccessRightCopy!)) {
                                  setState(() {
                                    _model.hasAccessRight = true;
                                  });
                                  _model.queryHeadsetsCopy =
                                      await actions.dQueryHeadset();
                                  shouldSetState = true;
                                  setState(() {
                                    _model.availableHeadsets = functions
                                        .getAvailableHeadsetId(
                                            _model.queryHeadsetsCopy!)
                                        .toList()
                                        .cast<String>();
                                  });
                                  if (_model.availableHeadsets.isNotEmpty) {
                                    setState(() {
                                      _model.deviceIsConnected = true;
                                    });
                                    if (shouldSetState) setState(() {});
                                    return;
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'No Device Available',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                    setState(() {
                                      _model.deviceIsConnected = false;
                                      _model.availableHeadsets = [];
                                      _model.queryHeadsetError =
                                          _model.queryHeadsetsCopy;
                                    });
                                    if (shouldSetState) setState(() {});
                                    return;
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Access Right Isnt Granted, Click Request Access',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).error,
                                    ),
                                  );
                                  setState(() {
                                    _model.hasAccessRight = false;
                                    _model.deviceIsConnected = false;
                                    _model.availableHeadsets = [];
                                    _model.hasAccessError =
                                        _model.hasAccessRightCopy;
                                  });
                                  if (shouldSetState) setState(() {});
                                  return;
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'User Is Not Logged in',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: const Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).error,
                                  ),
                                );
                                setState(() {
                                  _model.logedInEmotiv = false;
                                  _model.hasAccessRight = false;
                                  _model.deviceIsConnected = false;
                                  _model.availableHeadsets = [];
                                });
                                if (shouldSetState) setState(() {});
                                return;
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Emotive Launcher Is not installed',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).error,
                                ),
                              );
                              setState(() {
                                _model.emotivInstalled = false;
                                _model.logedInEmotiv = false;
                                _model.hasAccessRight = false;
                                _model.deviceIsConnected = false;
                                _model.availableHeadsets = [];
                                _model.getCortexInfoError =
                                    _model.getCortexInfoCopy;
                              });
                              if (shouldSetState) setState(() {});
                              return;
                            }

                            if (shouldSetState) setState(() {});
                          },
                          text: 'Recheck',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: 20.0,
                                height: 20.0,
                                decoration: BoxDecoration(
                                  color: _model.emotivInstalled
                                      ? FlutterFlowTheme.of(context).success
                                      : FlutterFlowTheme.of(context).error,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Text(
                              'Installed Emotiv Launcher',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ].divide(const SizedBox(width: 5.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: 20.0,
                                height: 20.0,
                                decoration: BoxDecoration(
                                  color: _model.logedInEmotiv
                                      ? FlutterFlowTheme.of(context).success
                                      : FlutterFlowTheme.of(context).error,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Text(
                              'Logged In Emotiv Launcher',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ].divide(const SizedBox(width: 5.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: 20.0,
                                height: 20.0,
                                decoration: BoxDecoration(
                                  color: _model.hasAccessRight
                                      ? FlutterFlowTheme.of(context).success
                                      : FlutterFlowTheme.of(context).error,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Text(
                              'Have Access Right',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ].divide(const SizedBox(width: 5.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: 20.0,
                                height: 20.0,
                                decoration: BoxDecoration(
                                  color: _model.deviceIsConnected
                                      ? FlutterFlowTheme.of(context).success
                                      : FlutterFlowTheme.of(context).error,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Text(
                              'Device Connected',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ].divide(const SizedBox(width: 5.0)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () async {
                              _model.getCortexInfo =
                                  await actions.aGetCortexInfo();
                              setState(() {
                                _model.getCortexInfoError =
                                    _model.getCortexInfo;
                              });

                              setState(() {});
                            },
                            text: 'Get Cortex Info',
                            options: FFButtonOptions(
                              width: 120.0,
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(width: 10.0)),
                    ),
                  ),
                  if (_model.getCortexInfoError != null &&
                      _model.getCortexInfoError != '')
                    Text(
                      _model.getCortexInfoError!,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).error,
                          ),
                    ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            _model.accessRequest = await actions.bRequestAccess(
                              _model.textController1.text,
                              _model.textController2.text,
                            );
                            setState(() {
                              _model.aacessError = _model.accessRequest;
                            });

                            setState(() {});
                          },
                          text: 'Request Access',
                          options: FFButtonOptions(
                            width: 120.0,
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(width: 10.0)),
                  ),
                  if (_model.aacessError != null && _model.aacessError != '')
                    Text(
                      _model.aacessError!,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).error,
                          ),
                    ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            _model.doesHasAccess =
                                await actions.cHasAccessRight(
                              FFAppState().clientId,
                              FFAppState().clientSecret,
                            );
                            setState(() {
                              _model.hasAccessError = _model.doesHasAccess;
                            });

                            setState(() {});
                          },
                          text: 'Has Access Right?',
                          options: FFButtonOptions(
                            width: 120.0,
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(width: 10.0)),
                  ),
                  if (_model.hasAccessError != null &&
                      _model.hasAccessError != '')
                    Text(
                      _model.hasAccessError!,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).error,
                          ),
                    ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            _model.queredHeadsets =
                                await actions.dQueryHeadset();
                            setState(() {
                              _model.queryHeadsetError = _model.queredHeadsets;
                              _model.availableHeadsets = functions
                                  .getAvailableHeadsetId(_model.queredHeadsets!)
                                  .toList()
                                  .cast<String>();
                            });

                            setState(() {});
                          },
                          text: 'Query headset',
                          options: FFButtonOptions(
                            width: 120.0,
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(width: 10.0)),
                  ),
                  if (_model.queryHeadsetError != null &&
                      _model.queryHeadsetError != '')
                    Text(
                      _model.queryHeadsetError!,
                      textAlign: TextAlign.justify,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).error,
                          ),
                    ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 20.0),
                          child: Text(
                            'Available Headsets',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: const Color(0xFF4036A7),
                                  fontSize: 40.0,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Builder(
                    builder: (context) {
                      final availableHeadset =
                          _model.availableHeadsets.toList();
                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: availableHeadset.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 5.0),
                        itemBuilder: (context, availableHeadsetIndex) {
                          final availableHeadsetItem =
                              availableHeadset[availableHeadsetIndex];
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                availableHeadsetItem,
                                style:
                                    FlutterFlowTheme.of(context).headlineLarge,
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  setState(() {
                                    FFAppState().defaultHeadset =
                                        availableHeadsetItem;
                                  });
                                },
                                text: availableHeadsetItem ==
                                        FFAppState().defaultHeadset
                                    ? 'Default'
                                    : 'Set Default',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: availableHeadsetItem ==
                                          FFAppState().defaultHeadset
                                      ? FlutterFlowTheme.of(context).success
                                      : FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                      ),
                                  elevation: 3.0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ].divide(const SizedBox(height: 8.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
