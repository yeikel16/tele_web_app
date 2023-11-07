import 'dart:js';

/// If [func] is not null, wrap it in allowInterop, otherwise, return null
F? allowInteropOrNull<F extends Function>(F? func) =>
    func != null ? allowInterop(func) : null;
