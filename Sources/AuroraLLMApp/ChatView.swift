#if canImport(SwiftUI)
import SwiftUI
#endif

#if canImport(SwiftUI)
struct ChatView: View {
    @ObservedObject var viewModel: ChatViewModel

    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(viewModel.messages, id: \.self) { message in
                        Text(message)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(4)
                    }
                }
            }
            HStack {
                TextField("Enter message", text: $viewModel.inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Send") {
                    viewModel.send()
                }
                .keyboardShortcut(.defaultAction)
            }
            .padding()
        }
        .frame(minWidth: 400, minHeight: 300)
    }
}
#endif

#if canImport(SwiftUI)
struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(viewModel: ChatViewModel())
    }
}
#endif
