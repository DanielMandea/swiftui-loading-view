//
//  ContainerActivityView.swift
//  
//
//  Created by Daniel Mandea on 11.12.2021.
//

import Foundation
import SwiftUI

public struct ContainerActivityView<Content>: View where Content: View {
    
    // MARK: - Private
    
    public var content: Content
    
    // MARK: - @State
 
    @State private var isLoading: Bool = false
    
    // MARK: - Init
    
    @inlinable public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    // MARK: - Body
 
    public var body: some View {
        content
            .rotationEffect(Angle(degrees: isLoading ? 360: 0))
             .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
             .onAppear {
                 if !self.isLoading { self.isLoading.toggle() }
             }
    }
}

struct ContinerActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerActivityView() {
            Text("Hello World")
        }
    }
}
