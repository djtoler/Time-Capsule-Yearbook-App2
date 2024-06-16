import SwiftUI
import WebKit

struct ContentView3: View {
    @State private var showWebView = false

    var body: some View {
        VStack {
            Button(action: {
                showWebView = true
            }) {
                Text("Go to Google")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $showWebView) {
                WebView(url: URL(string: "https://www.github.com")!)
            }
        }
    }
}

//struct WebView: UIViewRepresentable {
//    let url: URL
//
//    func makeUIView(context: Context) -> WKWebView {
//        WKWebView()
//    }
//
//    func updateUIView(_ uiView: WKWebView, context: Context) {
//        let request = URLRequest(url: url)
//        uiView.load(request)
//    }
//}

struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}






//import SwiftUI
//import WebKit
//
//struct ContentView3: View {
//    @State private var showWebView = false
//    @State private var urlToOpen: URL?
//    
//    // Assuming `user` is available within this context with a property `link01` that contains the URL.
//    @State var user: User // Your User model must be defined somewhere in your code with a 'link01' property.
//
//    var body: some View {
//        VStack {
//            HStack {
//                Image(systemName: "link")
//                Button(action: {
//                    if let urlString = user.link01 {
//                        processURLString(urlString)
//                    } else {
//                        print("URL is not provided")
//                    }
//                }) {
//                    Text("Portfolio")
//                        .font(.custom("Helvetica", size: 12))
//                        .fontWeight(.semibold)
//                }
//            }
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .frame(width: 352, height: 34)
//            .multilineTextAlignment(.center)
//            .background(Color.white)
//            .foregroundColor(.black)
//            .cornerRadius(4)
//            .sheet(isPresented: $showWebView) {
//                if let urlToOpen = urlToOpen {
//                    WebView(url: urlToOpen)
//                }
//            }
//        }
//    }
//
//    private func processURLString(_ urlString: String) {
//        var correctedURLString = urlString
//        if !correctedURLString.starts(with: "http://") && !correctedURLString.starts(with: "https://") {
//            correctedURLString = "https://" + correctedURLString
//        }
//        if !correctedURLString.contains("www.") {
//            correctedURLString = correctedURLString.replacingOccurrences(of: "https://", with: "https://www.")
//        }
//        if let url = URL(string: correctedURLString) {
//            urlToOpen = url
//            showWebView = true
//        } else {
//            print("Invalid URL: \(correctedURLString)")
//        }
//    }
//}
//
//struct WebView: UIViewRepresentable {
//    let url: URL
//
//    func makeUIView(context: Context) -> WKWebView {
//        WKWebView()
//    }
//
//    func updateUIView(_ uiView: WKWebView, context: Context) {
//        let request = URLRequest(url: url)
//        uiView.load(request)
//    }
//}
//
//struct ContentView3_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView3(user: User(link01: "https://www.google.com")) // Example usage, replace `User` with your actual model
//    }
//}
