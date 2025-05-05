#include <android_native_app_glue.h>
#include <android/looper.h>
#include <unistd.h>

ALooper* _mainLooper;

extern void _dispatch_main_queue_callback_4CF(void* msg);
extern int _dispatch_get_main_queue_port_4CF(void);

int callback(int fd, int events, void* data) {
    _dispatch_main_queue_callback_4CF(NULL);
    
    usleep(1000);
    
    return 1;
}

void android_app_configure(struct android_app* android_app) {
    if (_mainLooper != NULL) {
        ALooper_release(_mainLooper);
    }
    _mainLooper = ALooper_forThread();
    ALooper_acquire(_mainLooper);
    
    int port = _dispatch_get_main_queue_port_4CF();
    ALooper_addFd(_mainLooper, port, 0, ALOOPER_EVENT_INPUT, callback, NULL);
}
