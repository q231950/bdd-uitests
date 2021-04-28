//
//  ThenBuilder.swift
//  
//
//  Created by Martin Kim Dung-Pham on 22.03.20.
//

import Foundation


@resultBuilder public struct ThenBuilder<C> {
    public static func buildBlock(_ assertion: Assertion<C>) -> Assertion<C> {
        assertion
    }
}
