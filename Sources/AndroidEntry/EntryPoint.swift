import NativeAppGlue

nonisolated(unsafe)
public var app_state: UnsafeMutablePointer<android_app>!

@_extern(c, "main")
private func main()

@_cdecl("android_main")
internal func android_main(_ app: UnsafeMutablePointer<android_app>) {
    app_state = app
    main()
}
