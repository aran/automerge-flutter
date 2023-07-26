// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.79.0.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, unnecessary_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names, invalid_use_of_internal_member, prefer_is_empty, unnecessary_const

import "bridge_definitions.dart";
import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:uuid/uuid.dart';
import 'bridge_generated.dart';
export 'bridge_generated.dart';
import 'dart:ffi' as ffi;

class RaddPlatform extends FlutterRustBridgeBase<RaddWire> {
  RaddPlatform(ffi.DynamicLibrary dylib) : super(RaddWire(dylib));

// Section: api2wire

  @protected
  wire_MutexAutoCommit api2wire_MutexAutoCommit(MutexAutoCommit raw) {
    final ptr = inner.new_MutexAutoCommit();
    _api_fill_to_wire_MutexAutoCommit(raw, ptr);
    return ptr;
  }

  @protected
  ffi.Pointer<wire_uint_8_list> api2wire_String(String raw) {
    return api2wire_uint_8_list(utf8.encoder.convert(raw));
  }

  @protected
  ffi.Pointer<wire_Contact> api2wire_box_autoadd_contact(Contact raw) {
    final ptr = inner.new_box_autoadd_contact_0();
    _api_fill_to_wire_contact(raw, ptr.ref);
    return ptr;
  }

  @protected
  ffi.Pointer<wire_uint_8_list> api2wire_opt_String(String? raw) {
    return raw == null ? ffi.nullptr : api2wire_String(raw);
  }

  @protected
  ffi.Pointer<wire_uint_8_list> api2wire_uint_8_list(Uint8List raw) {
    final ans = inner.new_uint_8_list_0(raw.length);
    ans.ref.ptr.asTypedList(raw.length).setAll(0, raw);
    return ans;
  }
// Section: finalizer

  late final OpaqueTypeFinalizer _MutexAutoCommitFinalizer =
      OpaqueTypeFinalizer(inner._drop_opaque_MutexAutoCommitPtr);
  OpaqueTypeFinalizer get MutexAutoCommitFinalizer => _MutexAutoCommitFinalizer;
// Section: api_fill_to_wire

  void _api_fill_to_wire_MutexAutoCommit(
      MutexAutoCommit apiObj, wire_MutexAutoCommit wireObj) {
    wireObj.ptr = apiObj.shareOrMove();
  }

  void _api_fill_to_wire_address(Address apiObj, wire_Address wireObj) {
    wireObj.line_one = api2wire_String(apiObj.lineOne);
    wireObj.line_two = api2wire_opt_String(apiObj.lineTwo);
    wireObj.city = api2wire_String(apiObj.city);
    wireObj.postcode = api2wire_String(apiObj.postcode);
  }

  void _api_fill_to_wire_box_autoadd_contact(
      Contact apiObj, ffi.Pointer<wire_Contact> wireObj) {
    _api_fill_to_wire_contact(apiObj, wireObj.ref);
  }

  void _api_fill_to_wire_contact(Contact apiObj, wire_Contact wireObj) {
    wireObj.name = api2wire_String(apiObj.name);
    _api_fill_to_wire_address(apiObj.address, wireObj.address);
  }
}

// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_positional_boolean_parameters, annotate_overrides, constant_identifier_names

// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
// ignore_for_file: type=lint

/// generated by flutter_rust_bridge
class RaddWire implements FlutterRustBridgeWireBase {
  @internal
  late final dartApi = DartApiDl(init_frb_dart_api_dl);

  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  RaddWire(ffi.DynamicLibrary dynamicLibrary) : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  RaddWire.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  void store_dart_post_cobject(
    DartPostCObjectFnType ptr,
  ) {
    return _store_dart_post_cobject(
      ptr,
    );
  }

  late final _store_dart_post_cobjectPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(DartPostCObjectFnType)>>(
          'store_dart_post_cobject');
  late final _store_dart_post_cobject = _store_dart_post_cobjectPtr
      .asFunction<void Function(DartPostCObjectFnType)>();

  Object get_dart_object(
    int ptr,
  ) {
    return _get_dart_object(
      ptr,
    );
  }

  late final _get_dart_objectPtr =
      _lookup<ffi.NativeFunction<ffi.Handle Function(ffi.UintPtr)>>(
          'get_dart_object');
  late final _get_dart_object =
      _get_dart_objectPtr.asFunction<Object Function(int)>();

  void drop_dart_object(
    int ptr,
  ) {
    return _drop_dart_object(
      ptr,
    );
  }

  late final _drop_dart_objectPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.UintPtr)>>(
          'drop_dart_object');
  late final _drop_dart_object =
      _drop_dart_objectPtr.asFunction<void Function(int)>();

  int new_dart_opaque(
    Object handle,
  ) {
    return _new_dart_opaque(
      handle,
    );
  }

  late final _new_dart_opaquePtr =
      _lookup<ffi.NativeFunction<ffi.UintPtr Function(ffi.Handle)>>(
          'new_dart_opaque');
  late final _new_dart_opaque =
      _new_dart_opaquePtr.asFunction<int Function(Object)>();

  int init_frb_dart_api_dl(
    ffi.Pointer<ffi.Void> obj,
  ) {
    return _init_frb_dart_api_dl(
      obj,
    );
  }

  late final _init_frb_dart_api_dlPtr =
      _lookup<ffi.NativeFunction<ffi.IntPtr Function(ffi.Pointer<ffi.Void>)>>(
          'init_frb_dart_api_dl');
  late final _init_frb_dart_api_dl = _init_frb_dart_api_dlPtr
      .asFunction<int Function(ffi.Pointer<ffi.Void>)>();

  void wire_add(
    int port_,
    int a,
    int b,
  ) {
    return _wire_add(
      port_,
      a,
      b,
    );
  }

  late final _wire_addPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64, ffi.Int32, ffi.Int32)>>('wire_add');
  late final _wire_add =
      _wire_addPtr.asFunction<void Function(int, int, int)>();

  void wire_greet(
    int port_,
  ) {
    return _wire_greet(
      port_,
    );
  }

  late final _wire_greetPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>('wire_greet');
  late final _wire_greet = _wire_greetPtr.asFunction<void Function(int)>();

  void wire_new_doc(
    int port_,
  ) {
    return _wire_new_doc(
      port_,
    );
  }

  late final _wire_new_docPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>('wire_new_doc');
  late final _wire_new_doc = _wire_new_docPtr.asFunction<void Function(int)>();

  void wire_load_doc(
    int port_,
    ffi.Pointer<wire_uint_8_list> bytes,
  ) {
    return _wire_load_doc(
      port_,
      bytes,
    );
  }

  late final _wire_load_docPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Int64, ffi.Pointer<wire_uint_8_list>)>>('wire_load_doc');
  late final _wire_load_doc = _wire_load_docPtr
      .asFunction<void Function(int, ffi.Pointer<wire_uint_8_list>)>();

  void wire_save_doc(
    int port_,
    wire_MutexAutoCommit mdoc,
  ) {
    return _wire_save_doc(
      port_,
      mdoc,
    );
  }

  late final _wire_save_docPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64, wire_MutexAutoCommit)>>('wire_save_doc');
  late final _wire_save_doc =
      _wire_save_docPtr.asFunction<void Function(int, wire_MutexAutoCommit)>();

  void wire_fork_doc(
    int port_,
    wire_MutexAutoCommit mdoc,
  ) {
    return _wire_fork_doc(
      port_,
      mdoc,
    );
  }

  late final _wire_fork_docPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64, wire_MutexAutoCommit)>>('wire_fork_doc');
  late final _wire_fork_doc =
      _wire_fork_docPtr.asFunction<void Function(int, wire_MutexAutoCommit)>();

  void wire_merge_doc(
    int port_,
    wire_MutexAutoCommit mdoc1,
    wire_MutexAutoCommit mdoc2,
  ) {
    return _wire_merge_doc(
      port_,
      mdoc1,
      mdoc2,
    );
  }

  late final _wire_merge_docPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64, wire_MutexAutoCommit,
              wire_MutexAutoCommit)>>('wire_merge_doc');
  late final _wire_merge_doc = _wire_merge_docPtr.asFunction<
      void Function(int, wire_MutexAutoCommit, wire_MutexAutoCommit)>();

  void wire_with_random_actor(
    int port_,
    wire_MutexAutoCommit mdoc,
  ) {
    return _wire_with_random_actor(
      port_,
      mdoc,
    );
  }

  late final _wire_with_random_actorPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Int64, wire_MutexAutoCommit)>>('wire_with_random_actor');
  late final _wire_with_random_actor = _wire_with_random_actorPtr
      .asFunction<void Function(int, wire_MutexAutoCommit)>();

  void wire_reconcile_contact(
    int port_,
    wire_MutexAutoCommit mdoc,
    ffi.Pointer<wire_Contact> contact,
  ) {
    return _wire_reconcile_contact(
      port_,
      mdoc,
      contact,
    );
  }

  late final _wire_reconcile_contactPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64, wire_MutexAutoCommit,
              ffi.Pointer<wire_Contact>)>>('wire_reconcile_contact');
  late final _wire_reconcile_contact = _wire_reconcile_contactPtr.asFunction<
      void Function(int, wire_MutexAutoCommit, ffi.Pointer<wire_Contact>)>();

  void wire_hydrate_contact(
    int port_,
    wire_MutexAutoCommit mdoc,
  ) {
    return _wire_hydrate_contact(
      port_,
      mdoc,
    );
  }

  late final _wire_hydrate_contactPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Int64, wire_MutexAutoCommit)>>('wire_hydrate_contact');
  late final _wire_hydrate_contact = _wire_hydrate_contactPtr
      .asFunction<void Function(int, wire_MutexAutoCommit)>();

  wire_MutexAutoCommit new_MutexAutoCommit() {
    return _new_MutexAutoCommit();
  }

  late final _new_MutexAutoCommitPtr =
      _lookup<ffi.NativeFunction<wire_MutexAutoCommit Function()>>(
          'new_MutexAutoCommit');
  late final _new_MutexAutoCommit =
      _new_MutexAutoCommitPtr.asFunction<wire_MutexAutoCommit Function()>();

  ffi.Pointer<wire_Contact> new_box_autoadd_contact_0() {
    return _new_box_autoadd_contact_0();
  }

  late final _new_box_autoadd_contact_0Ptr =
      _lookup<ffi.NativeFunction<ffi.Pointer<wire_Contact> Function()>>(
          'new_box_autoadd_contact_0');
  late final _new_box_autoadd_contact_0 = _new_box_autoadd_contact_0Ptr
      .asFunction<ffi.Pointer<wire_Contact> Function()>();

  ffi.Pointer<wire_uint_8_list> new_uint_8_list_0(
    int len,
  ) {
    return _new_uint_8_list_0(
      len,
    );
  }

  late final _new_uint_8_list_0Ptr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<wire_uint_8_list> Function(
              ffi.Int32)>>('new_uint_8_list_0');
  late final _new_uint_8_list_0 = _new_uint_8_list_0Ptr
      .asFunction<ffi.Pointer<wire_uint_8_list> Function(int)>();

  void drop_opaque_MutexAutoCommit(
    ffi.Pointer<ffi.Void> ptr,
  ) {
    return _drop_opaque_MutexAutoCommit(
      ptr,
    );
  }

  late final _drop_opaque_MutexAutoCommitPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
          'drop_opaque_MutexAutoCommit');
  late final _drop_opaque_MutexAutoCommit = _drop_opaque_MutexAutoCommitPtr
      .asFunction<void Function(ffi.Pointer<ffi.Void>)>();

  ffi.Pointer<ffi.Void> share_opaque_MutexAutoCommit(
    ffi.Pointer<ffi.Void> ptr,
  ) {
    return _share_opaque_MutexAutoCommit(
      ptr,
    );
  }

  late final _share_opaque_MutexAutoCommitPtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<ffi.Void> Function(
              ffi.Pointer<ffi.Void>)>>('share_opaque_MutexAutoCommit');
  late final _share_opaque_MutexAutoCommit = _share_opaque_MutexAutoCommitPtr
      .asFunction<ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Void>)>();

  void free_WireSyncReturn(
    WireSyncReturn ptr,
  ) {
    return _free_WireSyncReturn(
      ptr,
    );
  }

  late final _free_WireSyncReturnPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(WireSyncReturn)>>(
          'free_WireSyncReturn');
  late final _free_WireSyncReturn =
      _free_WireSyncReturnPtr.asFunction<void Function(WireSyncReturn)>();
}

final class _Dart_Handle extends ffi.Opaque {}

final class wire_uint_8_list extends ffi.Struct {
  external ffi.Pointer<ffi.Uint8> ptr;

  @ffi.Int32()
  external int len;
}

final class wire_MutexAutoCommit extends ffi.Struct {
  external ffi.Pointer<ffi.Void> ptr;
}

final class wire_Address extends ffi.Struct {
  external ffi.Pointer<wire_uint_8_list> line_one;

  external ffi.Pointer<wire_uint_8_list> line_two;

  external ffi.Pointer<wire_uint_8_list> city;

  external ffi.Pointer<wire_uint_8_list> postcode;
}

final class wire_Contact extends ffi.Struct {
  external ffi.Pointer<wire_uint_8_list> name;

  external wire_Address address;
}

typedef DartPostCObjectFnType = ffi.Pointer<
    ffi.NativeFunction<
        ffi.Bool Function(DartPort port_id, ffi.Pointer<ffi.Void> message)>>;
typedef DartPort = ffi.Int64;