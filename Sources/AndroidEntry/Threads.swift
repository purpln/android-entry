import NativeAppGlue
import Android

nonisolated(unsafe)
private var _mainLooper: OpaquePointer? = nil

@_cdecl("android_app_configure")
internal func configure(_ app: UnsafeMutablePointer<android_app>) {
    if _mainLooper != nil {
        ALooper_release(_mainLooper)
    }
    _mainLooper = ALooper_forThread()
    ALooper_acquire(_mainLooper)
    
    let callback: ALooper_callbackFunc = { fd, event, data in
        _dispatch_main_queue_callback_4CF(nil)
        
        usleep(1000)
        
        return 1
    }
    
    let port = _dispatch_get_main_queue_port_4CF()
    ALooper_addFd(_mainLooper, port, 0, CInt(ALOOPER_EVENT_INPUT), callback, nil)
}

@_silgen_name("_dispatch_main_queue_callback_4CF")
private func _dispatch_main_queue_callback_4CF(_ msg: UnsafeMutableRawPointer?)

@_silgen_name("_dispatch_get_main_queue_port_4CF")
private func _dispatch_get_main_queue_port_4CF() -> Int32
