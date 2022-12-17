//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <theincall/theincall_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) theincall_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "TheincallPlugin");
  theincall_plugin_register_with_registrar(theincall_registrar);
}
