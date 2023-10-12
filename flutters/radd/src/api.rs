pub use std::sync::Mutex;
pub use autosurgeon::{Reconcile, Hydrate, hydrate, reconcile};
pub use automerge::{AutoCommit};
pub use flutter_rust_bridge::{frb, RustOpaque};

// docs: (map of)
// map, list, text. lists and texts are "sequences". maps are string -> value
// composite types have stable per-document obj ids.
// <obj_id, prop> ... flat map any value!
// string, float, i64, u64, bool, counter, timestamp



// AutoCommit::new() -> doc

// reconcile (AutoCommit doc, Reconcile struct)

// hydrate(&doc) -> Hydrate struct

// autocommit_doc.fork -> doc
// autocommit_doc.merge(&mut doc2)
// autocommit_doc.with_actor


// autocommit_doc.put_object(obj_id, prop, type) -> id of new object
// autocommit_doc.insert_object(obj_id of sequence, int (prop), type) -> id of new object
// autocommit_doc.put(obj_id, prop, scalar) -> nil or error
// autocommit_doc.insert(obj_id, index, scalar)
// autocommit_doc.increment(obj_id, prop, by)
// autocommit_doc.delete(obj_id, prop) -> nil or error
// autocommit_doc.splice(obj_id, pos, del, new_vals)
// autocommit_doc.splice_text(obj_id, pos, del, newtext &str)
// autocommit_doc.mark(obj_id, mark, expansion policy) -> nil or error
// autocommit_doc.remove_mark(obj_id, key (name?), start, end, expand)

// get_cursor(obj_id, pos, version?) -> cursor
// get_cursor_position(obj_id, cursor, version?) -> pos

// ....parents(obj_id) -> iterator of <obj_id, prop> to get to root
// ... parents_at
// ....keys(obj_id) -> map keys or list element ids
// ....map_range
// ....list_range
// ....values
// ....length
// ....object_type -> obj_type
// ....marks(obj_id) -> [mark]
// ....text(obj_id) -> string
// ....get(obj_id, prop) -> value
//

// doc.get_all(obj_id, prop) -> conflicts at this pair!
// doc.make_patches(patch_log) ->

// ???
// autocommit_doc.pending_ops -> usize
// transaction / doc.base_heads -> vec<changehash>
// get_missing_deps
// get_change_by_hash

// Mark::new(name, scalar value, start, end)
// ChangeHash -> Sha256 hash of a change
// Change


// automerge::ActorID
// automerge::ActorID::random()


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
