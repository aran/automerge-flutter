use super::*;
// Section: wire functions

#[wasm_bindgen]
pub fn wire_add(port_: MessagePort, a: i32, b: i32) {
    wire_add_impl(port_, a, b)
}

#[wasm_bindgen]
pub fn wire_greet(port_: MessagePort) {
    wire_greet_impl(port_)
}

#[wasm_bindgen]
pub fn wire_new_doc(port_: MessagePort) {
    wire_new_doc_impl(port_)
}

#[wasm_bindgen]
pub fn wire_load_doc(port_: MessagePort, bytes: Box<[u8]>) {
    wire_load_doc_impl(port_, bytes)
}

#[wasm_bindgen]
pub fn wire_save_doc(port_: MessagePort, mdoc: JsValue) {
    wire_save_doc_impl(port_, mdoc)
}

#[wasm_bindgen]
pub fn wire_fork_doc(port_: MessagePort, mdoc: JsValue) {
    wire_fork_doc_impl(port_, mdoc)
}

#[wasm_bindgen]
pub fn wire_merge_doc(port_: MessagePort, mdoc1: JsValue, mdoc2: JsValue) {
    wire_merge_doc_impl(port_, mdoc1, mdoc2)
}

#[wasm_bindgen]
pub fn wire_with_random_actor(port_: MessagePort, mdoc: JsValue) {
    wire_with_random_actor_impl(port_, mdoc)
}

#[wasm_bindgen]
pub fn wire_reconcile_contact(port_: MessagePort, mdoc: JsValue, contact: JsValue) {
    wire_reconcile_contact_impl(port_, mdoc, contact)
}

#[wasm_bindgen]
pub fn wire_hydrate_contact(port_: MessagePort, mdoc: JsValue) {
    wire_hydrate_contact_impl(port_, mdoc)
}

// Section: allocate functions

// Section: related functions

#[wasm_bindgen]
pub fn drop_opaque_MutexAutoCommit(ptr: *const c_void) {
    unsafe {
        Arc::<Mutex<AutoCommit>>::decrement_strong_count(ptr as _);
    }
}

#[wasm_bindgen]
pub fn share_opaque_MutexAutoCommit(ptr: *const c_void) -> *const c_void {
    unsafe {
        Arc::<Mutex<AutoCommit>>::increment_strong_count(ptr as _);
        ptr
    }
}

// Section: impl Wire2Api

impl Wire2Api<String> for String {
    fn wire2api(self) -> String {
        self
    }
}
impl Wire2Api<Address> for JsValue {
    fn wire2api(self) -> Address {
        let self_ = self.dyn_into::<JsArray>().unwrap();
        assert_eq!(
            self_.length(),
            4,
            "Expected 4 elements, got {}",
            self_.length()
        );
        Address {
            line_one: self_.get(0).wire2api(),
            line_two: self_.get(1).wire2api(),
            city: self_.get(2).wire2api(),
            postcode: self_.get(3).wire2api(),
        }
    }
}

impl Wire2Api<Contact> for JsValue {
    fn wire2api(self) -> Contact {
        let self_ = self.dyn_into::<JsArray>().unwrap();
        assert_eq!(
            self_.length(),
            2,
            "Expected 2 elements, got {}",
            self_.length()
        );
        Contact {
            name: self_.get(0).wire2api(),
            address: self_.get(1).wire2api(),
        }
    }
}

impl Wire2Api<Option<String>> for Option<String> {
    fn wire2api(self) -> Option<String> {
        self.map(Wire2Api::wire2api)
    }
}

impl Wire2Api<Vec<u8>> for Box<[u8]> {
    fn wire2api(self) -> Vec<u8> {
        self.into_vec()
    }
}
// Section: impl Wire2Api for JsValue

impl<T> Wire2Api<Option<T>> for JsValue
where
    JsValue: Wire2Api<T>,
{
    fn wire2api(self) -> Option<T> {
        (!self.is_null() && !self.is_undefined()).then(|| self.wire2api())
    }
}
impl Wire2Api<RustOpaque<Mutex<AutoCommit>>> for JsValue {
    fn wire2api(self) -> RustOpaque<Mutex<AutoCommit>> {
        #[cfg(target_pointer_width = "64")]
        {
            compile_error!("64-bit pointers are not supported.");
        }

        unsafe { support::opaque_from_dart((self.as_f64().unwrap() as usize) as _) }
    }
}
impl Wire2Api<String> for JsValue {
    fn wire2api(self) -> String {
        self.as_string().expect("non-UTF-8 string, or not a string")
    }
}
impl Wire2Api<i32> for JsValue {
    fn wire2api(self) -> i32 {
        self.unchecked_into_f64() as _
    }
}
impl Wire2Api<u8> for JsValue {
    fn wire2api(self) -> u8 {
        self.unchecked_into_f64() as _
    }
}
impl Wire2Api<Vec<u8>> for JsValue {
    fn wire2api(self) -> Vec<u8> {
        self.unchecked_into::<js_sys::Uint8Array>().to_vec().into()
    }
}
