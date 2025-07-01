//
//  View+Extensions.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/30/25.
//

import SwiftUI

extension View {

    @ViewBuilder
    public func `if`<T: View, U: View>(
        _ condition: Bool,
        then modifierT: (Self) -> T,
        else modifierU: (Self) -> U
    ) -> some View {

        if condition { modifierT(self) }
        else { modifierU(self) }
    }
}
