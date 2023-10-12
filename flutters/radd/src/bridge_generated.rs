#![allow(
    non_camel_case_types,
    unused,
    clippy::redundant_closure,
    clippy::useless_conversion,
    clippy::unit_arg,
    clippy::double_parens,
    non_snake_case,
    clippy::too_many_arguments
)]
// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.82.3.

use crate::api::*;
use core::panic::UnwindSafe;
use flutter_rust_bridge::rust2dart::IntoIntoDart;
use flutter_rust_bridge::*;
use std::ffi::c_void;
use std::sync::Arc;

// Section: imports

// Section: wire functions

fn wire_add_impl(
    port_: MessagePort,
    a: impl Wire2Api<i32> + UnwindSafe,
    b: impl Wire2Api<i32> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, i32, _>(
        WrapInfo {
            debug_name: "add",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_a = a.wire2api();
            let api_b = b.wire2api();
            move |task_callback| Result::<_, ()>::Ok(add(api_a, api_b))
        },
    )
}
fn wire_greet_impl(port_: MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, String, _>(
        WrapInfo {
            debug_name: "greet",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || move |task_callback| Result::<_, ()>::Ok(greet()),
    )
}
fn wire_new_doc_impl(port_: MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, RustOpaque<Mutex<AutoCommit>>, _>(
        WrapInfo {
            debug_name: "new_doc",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || move |task_callback| Result::<_, ()>::Ok(new_doc()),
    )
}
fn wire_load_doc_impl(port_: MessagePort, bytes: impl Wire2Api<Vec<u8>> + UnwindSafe) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, RustOpaque<Mutex<AutoCommit>>, _>(
        WrapInfo {
            debug_name: "load_doc",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_bytes = bytes.wire2api();
            move |task_callback| Result::<_, ()>::Ok(load_doc(api_bytes))
        },
    )
}
fn wire_save_doc_impl(
    port_: MessagePort,
    mdoc: impl Wire2Api<RustOpaque<Mutex<AutoCommit>>> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, Vec<u8>, _>(
        WrapInfo {
            debug_name: "save_doc",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_mdoc = mdoc.wire2api();
            move |task_callback| Result::<_, ()>::Ok(save_doc(api_mdoc))
        },
    )
}
fn wire_fork_doc_impl(
    port_: MessagePort,
    mdoc: impl Wire2Api<RustOpaque<Mutex<AutoCommit>>> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, RustOpaque<Mutex<AutoCommit>>, _>(
        WrapInfo {
            debug_name: "fork_doc",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_mdoc = mdoc.wire2api();
            move |task_callback| Result::<_, ()>::Ok(fork_doc(api_mdoc))
        },
    )
}
fn wire_merge_doc_impl(
    port_: MessagePort,
    mdoc1: impl Wire2Api<RustOpaque<Mutex<AutoCommit>>> + UnwindSafe,
    mdoc2: impl Wire2Api<RustOpaque<Mutex<AutoCommit>>> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, RustOpaque<Mutex<AutoCommit>>, _>(
        WrapInfo {
            debug_name: "merge_doc",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_mdoc1 = mdoc1.wire2api();
            let api_mdoc2 = mdoc2.wire2api();
            move |task_callback| Result::<_, ()>::Ok(merge_doc(api_mdoc1, api_mdoc2))
        },
    )
}
fn wire_with_random_actor_impl(
    port_: MessagePort,
    mdoc: impl Wire2Api<RustOpaque<Mutex<AutoCommit>>> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, RustOpaque<Mutex<AutoCommit>>, _>(
        WrapInfo {
            debug_name: "with_random_actor",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_mdoc = mdoc.wire2api();
            move |task_callback| Result::<_, ()>::Ok(with_random_actor(api_mdoc))
        },
    )
}
fn wire_reconcile_contact_impl(
    port_: MessagePort,
    mdoc: impl Wire2Api<RustOpaque<Mutex<AutoCommit>>> + UnwindSafe,
    contact: impl Wire2Api<Contact> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, RustOpaque<Mutex<AutoCommit>>, _>(
        WrapInfo {
            debug_name: "reconcile_contact",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_mdoc = mdoc.wire2api();
            let api_contact = contact.wire2api();
            move |task_callback| Result::<_, ()>::Ok(reconcile_contact(api_mdoc, api_contact))
        },
    )
}
fn wire_hydrate_contact_impl(
    port_: MessagePort,
    mdoc: impl Wire2Api<RustOpaque<Mutex<AutoCommit>>> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, Contact, _>(
        WrapInfo {
            debug_name: "hydrate_contact",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_mdoc = mdoc.wire2api();
            move |task_callback| Result::<_, ()>::Ok(hydrate_contact(api_mdoc))
        },
    )
}
// Section: wrapper structs

// Section: static checks

// Section: allocate functions

// Section: related functions

// Section: impl Wire2Api

pub trait Wire2Api<T> {
    fn wire2api(self) -> T;
}

impl<T, S> Wire2Api<Option<T>> for *mut S
where
    *mut S: Wire2Api<T>,
{
    fn wire2api(self) -> Option<T> {
        (!self.is_null()).then(|| self.wire2api())
    }
}

impl Wire2Api<i32> for i32 {
    fn wire2api(self) -> i32 {
        self
    }
}

impl Wire2Api<u8> for u8 {
    fn wire2api(self) -> u8 {
        self
    }
}

// Section: impl IntoDart

impl support::IntoDart for Address {
    fn into_dart(self) -> support::DartAbi {
        vec![
            self.line_one.into_into_dart().into_dart(),
            self.line_two.into_dart(),
            self.city.into_into_dart().into_dart(),
            self.postcode.into_into_dart().into_dart(),
        ]
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for Address {}
impl rust2dart::IntoIntoDart<Address> for Address {
    fn into_into_dart(self) -> Self {
        self
    }
}

impl support::IntoDart for Contact {
    fn into_dart(self) -> support::DartAbi {
        vec![
            self.name.into_into_dart().into_dart(),
            self.address.into_into_dart().into_dart(),
        ]
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for Contact {}
impl rust2dart::IntoIntoDart<Contact> for Contact {
    fn into_into_dart(self) -> Self {
        self
    }
}

// Section: executor

support::lazy_static! {
    pub static ref FLUTTER_RUST_BRIDGE_HANDLER: support::DefaultHandler = Default::default();
}

/// cbindgen:ignore
#[cfg(target_family = "wasm")]
#[path = "bridge_generated.web.rs"]
mod web;
#[cfg(target_family = "wasm")]
pub use web::*;

#[cfg(not(target_family = "wasm"))]
#[path = "bridge_generated.io.rs"]
mod io;
#[cfg(not(target_family = "wasm"))]
pub use io::*;
