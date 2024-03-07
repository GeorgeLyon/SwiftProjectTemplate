import SwiftUI
import SwiftProjectTemplate

struct ContentView: View {
  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
      Text(SwiftProjectTemplateContent.hello)
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
