# LoadingView

This package can be used in oeder to show an activity indicator over certain view.

# How LoadingView should look like in action:

## Dots 
https://user-images.githubusercontent.com/9281785/111881372-d8401c00-89b8-11eb-9164-46b7293cd104.mov

## Circle
https://user-images.githubusercontent.com/9281785/111881424-ff96e900-89b8-11eb-90f0-ce15fcc62043.mov

# How to use it:
```swift

import SwiftUI
import LoadingView

struct ExampleView: View {
    
    @State var isLoading: Bool = false
    
    var body: some View {
        VStack {
            Toggle("Show activity indicator", isOn: $isLoading)
            
            // Dots 
            Text("This is My Personal Data")
                .dotsIndicator(when: $isLoading)
                
            // Circle
            Text("This is My Personal Data")
                .circleIndicator(when: $isLoading)
                
            // Container
            Text("This is My Personal Data")
                .containerIndicator(when: $isLoading) {
                    Text("Animated text")
                }
        }
    }
}

```
# Available through:

`Swift Package Manager`
