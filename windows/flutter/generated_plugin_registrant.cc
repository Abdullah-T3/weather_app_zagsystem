//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

<<<<<<< HEAD
#include <firebase_auth/firebase_auth_plugin_c_api.h>
#include <firebase_core/firebase_core_plugin_c_api.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  FirebaseAuthPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FirebaseAuthPluginCApi"));
=======
#include <firebase_core/firebase_core_plugin_c_api.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
>>>>>>> eldeeb
  FirebaseCorePluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FirebaseCorePluginCApi"));
}
