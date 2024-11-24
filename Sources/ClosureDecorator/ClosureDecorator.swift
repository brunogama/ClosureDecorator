//
//  ClosureDecorator.swift
//  ClosureDecorator
//
//  Created by Bruno on 23/11/24.
//

public enum ClosureDecorator {
    public static func decorate<each T, R>(
        _ closure: @escaping (repeat each T) -> R,
        with decorator: @escaping (@escaping (repeat each T) -> R, repeat each T) -> R
    ) -> (repeat each T) -> R {
        { (args: repeat each T) in
            decorator(closure, repeat each args)
        }
    }
}
