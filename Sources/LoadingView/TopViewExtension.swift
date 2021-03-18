//
//  TopViewExtension.swift
//  
//
//  Created by Daniel on 16.03.2021.
//

import Foundation
import SwiftUI

extension View {
    /// Use this method in order to show a  certain view on top of current view that is blurred our
    /// - Parameters:
    ///   - radius: The redius for the blur that stays on top oy current view
    ///   - topView: A view that can show certain animatiom
    ///   - binding: Binding value determinating if the view is visible or not
    /// - Returns: A new view that alters cuurent view by adding a blur and a new `View` on top of current one
    public func showBlurView<TopView: View>(with radius: CGFloat = 20, and topView: TopView, when binding: Binding<Bool>) -> some View {
        modifier(TopViewModifier(destination: topView, blurRadius: radius, binding: binding))
    }
    
    /// Use this method in order to show a  certain `LoadingView` on top of current view that is blurred our
    /// - Parameter binding: Binding value determinating if the view is visible or not
    /// - Returns: A new view that alters cuurent view by adding a blur and  a nw`LodaingView` on top of current one
    public func showLoadingView(when binding: Binding<Bool>, color: Color = .blue) -> some View {
        showBlurView(and: LoadingView(color: color), when: binding)
    }
}
