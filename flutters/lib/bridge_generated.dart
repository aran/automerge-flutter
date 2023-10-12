// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.82.3.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, unnecessary_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names, invalid_use_of_internal_member, prefer_is_empty, unnecessary_const

import "bridge_definitions.dart";
import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:uuid/uuid.dart';
import 'bridge_generated.io.dart'
    if (dart.library.html) 'bridge_generated.web.dart';

class RaddImpl implements Radd {
  final RaddPlatform _platform;
  factory RaddImpl(ExternalLibrary dylib) => RaddImpl.raw(RaddPlatform(dylib));

  /// Only valid on web/WASM platforms.
  factory RaddImpl.wasm(FutureOr<WasmModule> module) =>
      RaddImpl(module as ExternalLibrary);
  RaddImpl.raw(this._platform);
  Future<int> add({required int a, required int b, dynamic hint}) {
    var arg0 = api2wire_i32(a);
    var arg1 = api2wire_i32(b);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_add(port_, arg0, arg1),
      parseSuccessData: _wire2api_i32,
      parseErrorData: null,
      constMeta: kAddConstMeta,
      argValues: [a, b],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kAddConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "add",
        argNames: ["a", "b"],
      );

  Future<String> greet({dynamic hint}) {
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_greet(port_),
      parseSuccessData: _wire2api_String,
      parseErrorData: null,
      constMeta: kGreetConstMeta,
      argValues: [],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kGreetConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "greet",
        argNames: [],
      );

  Future<MutexAutoCommit> newDoc({dynamic hint}) {
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_new_doc(port_),
      parseSuccessData: _wire2api_MutexAutoCommit,
      parseErrorData: null,
      constMeta: kNewDocConstMeta,
      argValues: [],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kNewDocConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "new_doc",
        argNames: [],
      );

  Future<MutexAutoCommit> loadDoc({required Uint8List bytes, dynamic hint}) {
    var arg0 = _platform.api2wire_uint_8_list(bytes);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_load_doc(port_, arg0),
      parseSuccessData: _wire2api_MutexAutoCommit,
      parseErrorData: null,
      constMeta: kLoadDocConstMeta,
      argValues: [bytes],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kLoadDocConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "load_doc",
        argNames: ["bytes"],
      );

  Future<Uint8List> saveDoc({required MutexAutoCommit mdoc, dynamic hint}) {
    var arg0 = _platform.api2wire_MutexAutoCommit(mdoc);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_save_doc(port_, arg0),
      parseSuccessData: _wire2api_uint_8_list,
      parseErrorData: null,
      constMeta: kSaveDocConstMeta,
      argValues: [mdoc],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kSaveDocConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "save_doc",
        argNames: ["mdoc"],
      );

  Future<MutexAutoCommit> forkDoc(
      {required MutexAutoCommit mdoc, dynamic hint}) {
    var arg0 = _platform.api2wire_MutexAutoCommit(mdoc);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_fork_doc(port_, arg0),
      parseSuccessData: _wire2api_MutexAutoCommit,
      parseErrorData: null,
      constMeta: kForkDocConstMeta,
      argValues: [mdoc],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kForkDocConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "fork_doc",
        argNames: ["mdoc"],
      );

  Future<MutexAutoCommit> mergeDoc(
      {required MutexAutoCommit mdoc1,
      required MutexAutoCommit mdoc2,
      dynamic hint}) {
    var arg0 = _platform.api2wire_MutexAutoCommit(mdoc1);
    var arg1 = _platform.api2wire_MutexAutoCommit(mdoc2);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_merge_doc(port_, arg0, arg1),
      parseSuccessData: _wire2api_MutexAutoCommit,
      parseErrorData: null,
      constMeta: kMergeDocConstMeta,
      argValues: [mdoc1, mdoc2],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kMergeDocConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "merge_doc",
        argNames: ["mdoc1", "mdoc2"],
      );

  Future<MutexAutoCommit> withRandomActor(
      {required MutexAutoCommit mdoc, dynamic hint}) {
    var arg0 = _platform.api2wire_MutexAutoCommit(mdoc);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_with_random_actor(port_, arg0),
      parseSuccessData: _wire2api_MutexAutoCommit,
      parseErrorData: null,
      constMeta: kWithRandomActorConstMeta,
      argValues: [mdoc],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kWithRandomActorConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "with_random_actor",
        argNames: ["mdoc"],
      );

  Future<MutexAutoCommit> reconcileContact(
      {required MutexAutoCommit mdoc, required Contact contact, dynamic hint}) {
    var arg0 = _platform.api2wire_MutexAutoCommit(mdoc);
    var arg1 = _platform.api2wire_box_autoadd_contact(contact);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_reconcile_contact(port_, arg0, arg1),
      parseSuccessData: _wire2api_MutexAutoCommit,
      parseErrorData: null,
      constMeta: kReconcileContactConstMeta,
      argValues: [mdoc, contact],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kReconcileContactConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "reconcile_contact",
        argNames: ["mdoc", "contact"],
      );

  Future<Contact> hydrateContact(
      {required MutexAutoCommit mdoc, dynamic hint}) {
    var arg0 = _platform.api2wire_MutexAutoCommit(mdoc);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_hydrate_contact(port_, arg0),
      parseSuccessData: _wire2api_contact,
      parseErrorData: null,
      constMeta: kHydrateContactConstMeta,
      argValues: [mdoc],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kHydrateContactConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "hydrate_contact",
        argNames: ["mdoc"],
      );

  DropFnType get dropOpaqueMutexAutoCommit =>
      _platform.inner.drop_opaque_MutexAutoCommit;
  ShareFnType get shareOpaqueMutexAutoCommit =>
      _platform.inner.share_opaque_MutexAutoCommit;
  OpaqueTypeFinalizer get MutexAutoCommitFinalizer =>
      _platform.MutexAutoCommitFinalizer;

  void dispose() {
    _platform.dispose();
  }
// Section: wire2api

  MutexAutoCommit _wire2api_MutexAutoCommit(dynamic raw) {
    return MutexAutoCommit.fromRaw(raw[0], raw[1], this);
  }

  String _wire2api_String(dynamic raw) {
    return raw as String;
  }

  Address _wire2api_address(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 4)
      throw Exception('unexpected arr length: expect 4 but see ${arr.length}');
    return Address(
      lineOne: _wire2api_String(arr[0]),
      lineTwo: _wire2api_opt_String(arr[1]),
      city: _wire2api_String(arr[2]),
      postcode: _wire2api_String(arr[3]),
    );
  }

  Contact _wire2api_contact(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 2)
      throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return Contact(
      name: _wire2api_String(arr[0]),
      address: _wire2api_address(arr[1]),
    );
  }

  int _wire2api_i32(dynamic raw) {
    return raw as int;
  }

  String? _wire2api_opt_String(dynamic raw) {
    return raw == null ? null : _wire2api_String(raw);
  }

  int _wire2api_u8(dynamic raw) {
    return raw as int;
  }

  Uint8List _wire2api_uint_8_list(dynamic raw) {
    return raw as Uint8List;
  }
}

// Section: api2wire

@protected
int api2wire_i32(int raw) {
  return raw;
}

@protected
int api2wire_u8(int raw) {
  return raw;
}

// Section: finalizer
