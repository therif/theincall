#import "TheincallPlugin.h"
#if __has_include(<theincall/theincall-Swift.h>)
#import <theincall/theincall-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "theincall-Swift.h"
#endif

@implementation TheincallPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTheincallPlugin registerWithRegistrar:registrar];
}
@end
