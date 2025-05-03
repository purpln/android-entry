import NativeAppGlue

nonisolated(unsafe)
public var application: UnsafeMutablePointer<android_app>!

@_silgen_name("main")
private func main()

@_cdecl("android_main")
internal func android_main(_ app: UnsafeMutablePointer<android_app>) {
    application = app
    
    main()
}
