# LoadingView

This package can be used in oeder to show an activity indicator over certain view.

# How it will look like:
https://user-images.githubusercontent.com/9281785/111881372-d8401c00-89b8-11eb-9164-46b7293cd104.mov

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
            Text("This is My Personal Data")
                .showLoadingView(when: $isLoading)
        }
    }
}

```
# Available through:

`Swift Package Manager`
