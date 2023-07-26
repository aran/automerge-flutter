#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
typedef struct _Dart_Handle* Dart_Handle;

typedef struct DartCObject DartCObject;

typedef int64_t DartPort;

typedef bool (*DartPostCObjectFnType)(DartPort port_id, void *message);

typedef struct wire_uint_8_list {
  uint8_t *ptr;
  int32_t len;
} wire_uint_8_list;

typedef struct wire_MutexAutoCommit {
  const void *ptr;
} wire_MutexAutoCommit;

typedef struct wire_Address {
  struct wire_uint_8_list *line_one;
  struct wire_uint_8_list *line_two;
  struct wire_uint_8_list *city;
  struct wire_uint_8_list *postcode;
} wire_Address;

typedef struct wire_Contact {
  struct wire_uint_8_list *name;
  struct wire_Address address;
} wire_Contact;

typedef struct DartCObject *WireSyncReturn;

void store_dart_post_cobject(DartPostCObjectFnType ptr);

Dart_Handle get_dart_object(uintptr_t ptr);

void drop_dart_object(uintptr_t ptr);

uintptr_t new_dart_opaque(Dart_Handle handle);

intptr_t init_frb_dart_api_dl(void *obj);

void wire_add(int64_t port_, int32_t a, int32_t b);

void wire_greet(int64_t port_);

void wire_new_doc(int64_t port_);

void wire_load_doc(int64_t port_, struct wire_uint_8_list *bytes);

void wire_save_doc(int64_t port_, struct wire_MutexAutoCommit mdoc);

void wire_fork_doc(int64_t port_, struct wire_MutexAutoCommit mdoc);

void wire_merge_doc(int64_t port_,
                    struct wire_MutexAutoCommit mdoc1,
                    struct wire_MutexAutoCommit mdoc2);

void wire_with_random_actor(int64_t port_, struct wire_MutexAutoCommit mdoc);

void wire_reconcile_contact(int64_t port_,
                            struct wire_MutexAutoCommit mdoc,
                            struct wire_Contact *contact);

void wire_hydrate_contact(int64_t port_, struct wire_MutexAutoCommit mdoc);

struct wire_MutexAutoCommit new_MutexAutoCommit(void);

struct wire_Contact *new_box_autoadd_contact_0(void);

struct wire_uint_8_list *new_uint_8_list_0(int32_t len);

void drop_opaque_MutexAutoCommit(const void *ptr);

const void *share_opaque_MutexAutoCommit(const void *ptr);

void free_WireSyncReturn(WireSyncReturn ptr);

static int64_t dummy_method_to_enforce_bundling(void) {
    int64_t dummy_var = 0;
    dummy_var ^= ((int64_t) (void*) wire_add);
    dummy_var ^= ((int64_t) (void*) wire_greet);
    dummy_var ^= ((int64_t) (void*) wire_new_doc);
    dummy_var ^= ((int64_t) (void*) wire_load_doc);
    dummy_var ^= ((int64_t) (void*) wire_save_doc);
    dummy_var ^= ((int64_t) (void*) wire_fork_doc);
    dummy_var ^= ((int64_t) (void*) wire_merge_doc);
    dummy_var ^= ((int64_t) (void*) wire_with_random_actor);
    dummy_var ^= ((int64_t) (void*) wire_reconcile_contact);
    dummy_var ^= ((int64_t) (void*) wire_hydrate_contact);
    dummy_var ^= ((int64_t) (void*) new_MutexAutoCommit);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_contact_0);
    dummy_var ^= ((int64_t) (void*) new_uint_8_list_0);
    dummy_var ^= ((int64_t) (void*) drop_opaque_MutexAutoCommit);
    dummy_var ^= ((int64_t) (void*) share_opaque_MutexAutoCommit);
    dummy_var ^= ((int64_t) (void*) free_WireSyncReturn);
    dummy_var ^= ((int64_t) (void*) store_dart_post_cobject);
    dummy_var ^= ((int64_t) (void*) get_dart_object);
    dummy_var ^= ((int64_t) (void*) drop_dart_object);
    dummy_var ^= ((int64_t) (void*) new_dart_opaque);
    return dummy_var;
}
