#pragma once

#include <android_native_app_glue.h>
#include <sys/cdefs.h>

/*
 * Attributes to support Swift concurrency.
 */

#if __has_attribute(__swift_attr__)
#define __swift_unavailable_from_async(_msg) __attribute__((__swift_attr__("@_unavailableFromAsync(message: \"" _msg "\")")))
#define __swift_nonisolated                  __attribute__((__swift_attr__("nonisolated")))
#define __swift_nonisolated_unsafe           __attribute__((__swift_attr__("nonisolated(unsafe)")))
#else
#define __swift_unavailable_from_async(_msg)
#define __swift_nonisolated
#define __swift_nonisolated_unsafe
#endif

extern __swift_nonisolated_unsafe struct android_app* application;
