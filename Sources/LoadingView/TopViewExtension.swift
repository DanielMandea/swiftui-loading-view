//
//  TopViewExtension.swift
//  
//
//  Created by Daniel on 16.03.2021.
//

import Foundation
import SwiftUI

extension View {
    /// Use this method in order to show a  certain view on top of current view that is blurred out
    /// - Parameters:
    ///   - radius: The redius for the blur that stays on top oy current view
    ///   - topView: A view that can show certain animatiom
    ///   - binding: Binding value determinating if the view is visible or not
    /// - Returns: A new view that alters cuurent view by adding a blur and a new `View` on top of current one
    public func blurModifier<TopView: View>(with radius: CGFloat = 20, and topView: TopView, when binding: Binding<Bool>) -> some View {
        modifier(BlurViewModifier(destination: topView, blurRadius: radius, binding: binding))
    }
    
    /// Use this method in order to show a  certain `View` on top of current view that is blurred out
    /// - Returns:  A new animated `Content` `View` presented on top of blurred out`View`
    @inlinable public func show<Content: View>(when binding: Binding<Bool>, @ViewBuilder content: () -> Content) -> some View {
        blurModifier(and: content(), when: binding)
    }
    
    /// Use this method in order to show a  certain `DotsActivityView` on top of current view that is blurred out
    /// - Parameters:
    ///   - binding: Defines if the view should be visible or not
    ///   - color: The color of dots
    /// - Returns:  A new  animated `DotsActivityView` `View` presented on top of blurred out `View`
    public func dotsIndicator(when binding: Binding<Bool>, color: Color = .accentColor) -> some View {
        show(when: binding) {
            DotsActivityView(color: color)
        }
    }
    
    /// Use this method in order to show a  certain `CircleActivityView` on top of current view that is blurred out
    /// - Parameters:
    ///   - binding: Defines if the view should be visible or not
    ///   - lineWidth: The with of the view  that is animated
    ///   - pathColor: The color of the path that holds animated view
    ///   - lineColor: The color of the view that is animated
    /// - Returns: A new animated `CircleActivityView` `View` presented on top of blurred out `View`
    public func circleIndicator(when binding: Binding<Bool>, lineWidth: CGFloat = 30, pathColor: Color, lineColor: Color) -> some View {
        show(when: binding) {
            CircleActivityView(lineWidth: lineWidth, pathColor: pathColor, lineColor: lineColor)
        }
    }
    
    /// Use this method in order to show a  certain `Content` on top of current view that is blurred out
    /// - Returns: A new animated `Content` `View` presented on top of blurred out `View`
    @inlinable public func containerIndicator<Content: View>(when binding: Binding<Bool>, @ViewBuilder content: () -> Content) -> some View {
        show(when: binding) {
            ContainerActivityView {
                content()
            }
        }
    }
}
