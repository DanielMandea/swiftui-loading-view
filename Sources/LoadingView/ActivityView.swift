//
//  ActivityView.swift
//  
//
//  Created by Daniel on 18.03.2021.
//

import Foundation
import SwiftUI

struct ActivityView: View {
 
    @State var isLoading: Bool = false
    @Binding var progress: CGFloat
    
    var lineWidth: CGFloat
    var color: Color
 
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.blue, lineWidth: lineWidth)
                .opacity(0.3)
            Circle()
                .trim(from: 0, to: 0.25)
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .foregroundColor(.blue)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                .onAppear() {
                    self.isLoading = true
            }
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(progress: .constant(0.2), lineWidth: 10, color: Color.blue)
    }
}
