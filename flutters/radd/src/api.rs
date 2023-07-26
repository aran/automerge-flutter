pub use std::sync::Mutex;
pub use autosurgeon::{Reconcile, Hydrate, hydrate, reconcile};
pub use automerge::{AutoCommit};
pub use flutter_rust_bridge::{frb, RustOpaque};

pub fn add(a: i32, b: i32) -> i32 {
    a + b
}

pub fn greet() -> String {
    "Hello from Rust!".into()
}

pub fn new_doc() -> RustOpaque<Mutex<AutoCommit>> {
    RustOpaque::new(Mutex::new(AutoCommit::new()))
}

pub fn load_doc(bytes: Vec<u8>) -> RustOpaque<Mutex<AutoCommit>> {
    RustOpaque::new(Mutex::new(AutoCommit::load(&bytes).unwrap()))
}

pub fn save_doc(mdoc: RustOpaque<Mutex<AutoCommit>>) -> Vec<u8> {
    // acquire mutex
    let mut doc = mdoc.lock().unwrap();
    // save doc
    doc.save()
}

pub fn fork_doc(mdoc: RustOpaque<Mutex<AutoCommit>>) -> RustOpaque<Mutex<AutoCommit>> {
    let mut doc = mdoc.lock().unwrap();
    let doc2 = doc.fork();
    RustOpaque::new(Mutex::new(doc2))
}

pub fn merge_doc(mdoc1: RustOpaque<Mutex<AutoCommit>>, mdoc2: RustOpaque<Mutex<AutoCommit>>) -> RustOpaque<Mutex<AutoCommit>> {
    let mut doc1 = mdoc1.lock().unwrap();
    let mut doc2 = mdoc2.lock().unwrap();
    let _changes = doc1.merge(&mut doc2).unwrap();
    RustOpaque::new(Mutex::new(doc1.clone()))
}

pub fn with_random_actor(mdoc: RustOpaque<Mutex<AutoCommit>>) -> RustOpaque<Mutex<AutoCommit>> {
    let doc = mdoc.lock().unwrap();
    let with_actor = doc.clone().with_actor(automerge::ActorId::random());
    RustOpaque::new(Mutex::new(with_actor))
}

pub fn reconcile_contact(mdoc: RustOpaque<Mutex<AutoCommit>>, contact: Contact) -> RustOpaque<Mutex<AutoCommit>>{
    let doc = mdoc.lock().unwrap();
    let mut doc2 = doc.clone();
    reconcile(&mut doc2, &contact).unwrap();
    RustOpaque::new(Mutex::new(doc2))
}

pub fn hydrate_contact(mdoc: RustOpaque<Mutex<AutoCommit>>) -> Contact {
    let doc = mdoc.lock().unwrap();
    let doc2 = doc.clone();
    hydrate(&doc2).unwrap()
}


#[derive(Debug, Clone, Reconcile, Hydrate, PartialEq)]
pub struct Contact {
    pub name: String,
    pub address: Address,
}

#[derive(Debug, Clone, Reconcile, Hydrate, PartialEq)]
pub struct Address {
   pub line_one: String,
   pub line_two: Option<String>,
   pub city: String,
   pub postcode: String,
}
