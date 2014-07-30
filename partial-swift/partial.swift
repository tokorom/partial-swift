//
//  partial.swift
//
//  Created by ToKoRo on 2014-07-30.
//

func partial<A, B, R>(function: (A, B) -> R, a: @auto_closure () -> A) -> (B) -> R {
    return { function(a(), $0) }
}

func partial<A, B, C, R>(function: (A, B, C) -> R, a: @auto_closure () -> A) -> (B, C) -> R {
    return { function(a(), $0, $1) }
}

func partial<A, B, C, R>(function: (A, B, C) -> R, a: @auto_closure () -> A, b: @auto_closure () -> B) -> (C) -> R {
    return { function(a(), b(), $0) }
}

func partial<A, B, C, D, R>(function: (A, B, C, D) -> R, a: @auto_closure () -> A) -> (B, C, D) -> R {
    return { function(a(), $0, $1, $2) }
}

func partial<A, B, C, D, R>(function: (A, B, C, D) -> R, a: @auto_closure () -> A, b: @auto_closure () -> B) -> (C, D) -> R {
    return { function(a(), b(), $0, $1) }
}

func partial<A, B, C, D, R>(function: (A, B, C, D) -> R, a: @auto_closure () -> A, b: @auto_closure () -> B, c: @auto_closure () -> C) -> (D) -> R {
    return { function(a(), b(), c(), $0) }
}
