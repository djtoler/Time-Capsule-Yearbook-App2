//import SwiftUI
//
//struct ContentView3: View {
//    @State private var selectedLetter: String = "A"
//    private let alphabets = (65...90).map { String(UnicodeScalar($0)!) }
//    private let names = ["Alice", "Arnold", "Alex", "Bob", "Barbara", "Charlie", "Cynthia", "David", "Diana", "Eve", "Edward", "Frank", "Fiona", "Grace", "George", "Hank", "Hannah", "Ivy", "Ian", "Jack", "Julia", "Kevin", "Karen", "Liam", "Linda", "Mike", "Monica", "Nathan", "Nora", "Oliver", "Olivia", "Peter", "Paula", "Quinn", "Queen", "Roger", "Rachel", "Steve", "Sara", "Tom", "Tina", "Ulysses", "Uma", "Victor", "Vanessa", "William", "Wendy", "Xavier", "Xena", "Yuri", "Yvonne", "Zach", "Zoe"]
//
//    var body: some View {
//        NavigationView {
//            ZStack(alignment: .trailing) {
//                // Main content
//                VStack {
//         
//                    HStack {
//                        VStack(alignment: .leading) {
//                            Text("CLASS OF 2024")
//                                .font(.headline)
//                                .foregroundColor(.white)
//                            Rectangle()
//                                .frame(height: 2)
//                                .foregroundColor(.blue)
//                                .edgesIgnoringSafeArea(.horizontal)
//                        }
//                        Spacer()
//                        Image(systemName: "magnifyingglass")
//                            .foregroundColor(.white)
//                            .offset(y: 10)
//                    }
//                    .padding(.top, 60)  // Increased padding to lower the navigation bar
//                    
//                    .padding(.vertical, 8)
//                    .background(Color.black)
//
//                    // Grid content
//                    ScrollView(.vertical, showsIndicators: true) {
//                        LazyVGrid(columns: [
//                            GridItem(.flexible(minimum: 70, maximum: 150), spacing: 32),
//                            GridItem(.flexible(minimum: 70, maximum: 150), spacing: 32),
//                            GridItem(.flexible(minimum: 70, maximum: 150), spacing: 32)
//                        ], spacing: 20, content: {  // Adjusted spacing to ensure fit
//                            ForEach(filteredNames, id: \.self) { name in
//                                VStack(alignment: .leading, spacing: 5) {
//                                    Image("defaultprofile")
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fill)
//                                        .frame(width: 120, height: 130)
//                                        .clipped()
//                                        .background(Color.gray)
//                                    Text(name)
//                                        .font(.system(size: 10, weight: .semibold))
//                                    Text("Last Name")
//                                        .font(.system(size: 9, weight: .regular))
//                                    Text("Position")
//                                        .font(.system(size: 9, weight: .regular))
//                                        .foregroundColor(.gray)
//                                }
//                                .padding()
//                                .background(Color.black)
//                                .foregroundColor(.white)
//                            }
//                        }).padding(.horizontal, 12)
//                    }
//                }
//                .background(Color.black)
//                .navigationBarHidden(true)
//
//                // Alphabetical Scroll
//                AlphabetScrollBar(alphabets: alphabets, selectedLetter: $selectedLetter)
//            }
//            .edgesIgnoringSafeArea(.all)
//        }
//    }
//
//    var filteredNames: [String] {
//        names.filter { $0.hasPrefix(selectedLetter) }
//    }
//}
//
//struct AlphabetScrollBar: View {
//    let alphabets: [String]
//    @Binding var selectedLetter: String
//
//    var body: some View {
//        VStack(spacing: 2) {
//            ForEach(alphabets, id: \.self) { letter in
//                Text(letter)
//                    .font(.system(size: 12))
//                    .frame(width: 20, height: 20)
//                    .padding(.vertical, 1)
//            }
//        }
//        .padding(.vertical, 10)
//        .background(BlurView(style: .systemThinMaterial))
//        .cornerRadius(10)
//        .frame(maxHeight: .infinity, alignment: .center)
//    }
//}
//
//struct BlurView: UIViewRepresentable {
//    var style: UIBlurEffect.Style
//    
//    func makeUIView(context: Context) -> UIVisualEffectView {
//        return UIVisualEffectView(effect: UIBlurEffect(style: style))
//    }
//    
//    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
//        uiView.effect = UIBlurEffect(style: style)
//    }
//}
//
//struct ContentView3_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView3()
//    }
//}
//
