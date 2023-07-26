use super::*;
// Section: wire functions

#[no_mangle]
pub extern "C" fn wire_add(port_: i64, a: i32, b: i32) {
    wire_add_impl(port_, a, b)
}

#[no_mangle]
pub extern "C" fn wire_greet(port_: i64) {
    wire_greet_impl(port_)
}

#[no_mangle]
pub extern "C" fn wire_new_doc(port_: i64) {
    wire_new_doc_impl(port_)
}

#[no_mangle]
pub extern "C" fn wire_load_doc(port_: i64, bytes: *mut wire_uint_8_list) {
    wire_load_doc_impl(port_, bytes)
}

#[no_mangle]
pub extern "C" fn wire_save_doc(port_: i64, mdoc: wire_MutexAutoCommit) {
    wire_save_doc_impl(port_, mdoc)
}

#[no_mangle]
pub extern "C" fn wire_fork_doc(port_: i64, mdoc: wire_MutexAutoCommit) {
    wire_fork_doc_impl(port_, mdoc)
}

#[no_mangle]
pub extern "C" fn wire_merge_doc(
    port_: i64,
    mdoc1: wire_MutexAutoCommit,
    mdoc2: wire_MutexAutoCommit,
) {
    wire_merge_doc_impl(port_, mdoc1, mdoc2)
}

#[no_mangle]
pub extern "C" fn wire_with_random_actor(port_: i64, mdoc: wire_MutexAutoCommit) {
    wire_with_random_actor_impl(port_, mdoc)
}

#[no_mangle]
pub extern "C" fn wire_reconcile_contact(
    port_: i64,
    mdoc: wire_MutexAutoCommit,
    contact: *mut wire_Contact,
) {
    wire_reconcile_contact_impl(port_, mdoc, contact)
}

#[no_mangle]
pub extern "C" fn wire_hydrate_contact(port_: i64, mdoc: wire_MutexAutoCommit) {
    wire_hydrate_contact_impl(port_, mdoc)
}

// Section: allocate functions

#[no_mangle]
pub extern "C" fn new_MutexAutoCommit() -> wire_MutexAutoCommit {
    wire_MutexAutoCommit::new_with_null_ptr()
}

#[no_mangle]
pub extern "C" fn new_box_autoadd_contact_0() -> *mut wire_Contact {
    support::new_leak_box_ptr(wire_Contact::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_uint_8_list_0(len: i32) -> *mut wire_uint_8_list {
    let ans = wire_uint_8_list {
        ptr: support::new_leak_vec_ptr(Default::default(), len),
        len,
    };
    support::new_leak_box_ptr(ans)
}

// Section: related functions

#[no_mangle]
pub extern "C" fn drop_opaque_MutexAutoCommit(ptr: *const c_void) {
    unsafe {
        Arc::<Mutex<AutoCommit>>::decrement_strong_count(ptr as _);
    }
}

#[no_mangle]
pub extern "C" fn share_opaque_MutexAutoCommit(ptr: *const c_void) -> *const c_void {
    unsafe {
        Arc::<Mutex<AutoCommit>>::increment_strong_count(ptr as _);
        ptr
    }
}

// Section: impl Wire2Api

impl Wire2Api<RustOpaque<Mutex<AutoCommit>>> for wire_MutexAutoCommit {
    fn wire2api(self) -> RustOpaque<Mutex<AutoCommit>> {
        unsafe { support::opaque_from_dart(self.ptr as _) }
    }
}
impl Wire2Api<String> for *mut wire_uint_8_list {
    fn wire2api(self) -> String {
        let vec: Vec<u8> = self.wire2api();
        String::from_utf8_lossy(&vec).into_owned()
    }
}
impl Wire2Api<Address> for wire_Address {
    fn wire2api(self) -> Address {
        Address {
            line_one: self.line_one.wire2api(),
            line_two: self.line_two.wire2api(),
            city: self.city.wire2api(),
            postcode: self.postcode.wire2api(),
        }
    }
}
impl Wire2Api<Contact> for *mut wire_Contact {
    fn wire2api(self) -> Contact {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<Contact>::wire2api(*wrap).into()
    }
}
impl Wire2Api<Contact> for wire_Contact {
    fn wire2api(self) -> Contact {
        Contact {
            name: self.name.wire2api(),
            address: self.address.wire2api(),
        }
    }
}

impl Wire2Api<Vec<u8>> for *mut wire_uint_8_list {
    fn wire2api(self) -> Vec<u8> {
        unsafe {
            let wrap = support::box_from_leak_ptr(self);
            support::vec_from_leak_ptr(wrap.ptr, wrap.len)
        }
    }
}
// Section: wire structs

#[repr(C)]
#[derive(Clone)]
pub struct wire_MutexAutoCommit {
    ptr: *const core::ffi::c_void,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_Address {
    line_one: *mut wire_uint_8_list,
    line_two: *mut wire_uint_8_list,
    city: *mut wire_uint_8_list,
    postcode: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_Contact {
    name: *mut wire_uint_8_list,
    address: wire_Address,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_uint_8_list {
    ptr: *mut u8,
    len: i32,
}

// Section: impl NewWithNullPtr

pub trait NewWithNullPtr {
    fn new_with_null_ptr() -> Self;
}

impl<T> NewWithNullPtr for *mut T {
    fn new_with_null_ptr() -> Self {
        std::ptr::null_mut()
    }
}

impl NewWithNullPtr for wire_MutexAutoCommit {
    fn new_with_null_ptr() -> Self {
        Self {
            ptr: core::ptr::null(),
        }
    }
}

impl NewWithNullPtr for wire_Address {
    fn new_with_null_ptr() -> Self {
        Self {
            line_one: core::ptr::null_mut(),
            line_two: core::ptr::null_mut(),
            city: core::ptr::null_mut(),
            postcode: core::ptr::null_mut(),
        }
    }
}

impl Default for wire_Address {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

impl NewWithNullPtr for wire_Contact {
    fn new_with_null_ptr() -> Self {
        Self {
            name: core::ptr::null_mut(),
            address: Default::default(),
        }
    }
}

impl Default for wire_Contact {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

// Section: sync execution mode utility

#[no_mangle]
pub extern "C" fn free_WireSyncReturn(ptr: support::WireSyncReturn) {
    unsafe {
        let _ = support::box_from_leak_ptr(ptr);
    };
}
