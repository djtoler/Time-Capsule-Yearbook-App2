////import SwiftUI
////
////struct ContentView2: View {
////    @State private var selectedLetter: String = "A"
////    private let alphabets = (65...90).map { String(UnicodeScalar($0)!) }
////    private let names = ["Alice", "Arnold", "Bob", "Barbara", "Charlie", "Cynthia", "David", "Diana", "Eve", "Edward", "Frank", "Fiona", "Grace", "George", "Hank", "Hannah", "Ivy", "Ian", "Jack", "Julia", "Kevin", "Karen", "Liam", "Linda", "Mike", "Monica", "Nathan", "Nora", "Oliver", "Olivia", "Peter", "Paula", "Quinn", "Queen", "Roger", "Rachel", "Steve", "Sara", "Tom", "Tina", "Ulysses", "Uma", "Victor", "Vanessa", "William", "Wendy", "Xavier", "Xena", "Yuri", "Yvonne", "Zach", "Zoe"]
////    var body: some View {
////        NavigationView {
////            VStack {
////                // Custom navigation bar
////                HStack {
////                    VStack(alignment: .leading) {
////                        Text("CLASS OF 2024")
////                            .font(.headline)
////                            .foregroundColor(.white)
////                        Rectangle()
////                            .frame(height: 2)
////                            .foregroundColor(.blue)
////                            .edgesIgnoringSafeArea(.horizontal)
////                    }
////                    Spacer()
////                    Image(systemName: "magnifyingglass")
////                        .foregroundColor(.white)
////                        .offset(y: 10)
////                }
////                .padding(.vertical, 8)
////                .background(Color.black)
////                
////
////
////                ScrollView {
////                    LazyVGrid(columns: [
////                        GridItem(.flexible(minimum: 70, maximum: 200), spacing: 32),
////                        GridItem(.flexible(minimum: 70, maximum: 200), spacing: 32),
////                        GridItem(.flexible(minimum: 70, maximum: 200), spacing: 32)
////                    ], spacing: 30, content: {
////                        ForEach(0..<20, id: \.self) { num in
////                            VStack(alignment: .leading, spacing: 5) {
////                                Image("defaultprofile")
////                                    .resizable()
////                                    .aspectRatio(contentMode: .fill)
////                                    .frame(width: 120, height: 130)
////                                    .clipped()
////                                    .background(Color.gray)
////                                Text("First Name").font(.system(size: 10, weight: .semibold))
////                                Text("Last Name").font(.system(size: 9, weight: .regular))
////                                Text("Position").font(.system(size: 9, weight: .regular))
////                                    .foregroundColor(.gray)
////                            }
////                            .padding()
////                            .background(Color.black) // Grid item background color
////                            .foregroundColor(.white) // Grid item text color
////                        }
////                    }).padding(.horizontal, 12)
////                }
////            }
////            .background(Color.black) // Entire background color
////            .navigationBarHidden(true) // Ensures the default navigation bar doesn't appear
////        }
////        .edgesIgnoringSafeArea(.all) // Makes the background color extend to the edges of the screen
////    }
////}
////
////// Preview
////struct ContentView2_Previews: PreviewProvider {
////    static var previews: some View {
////        ContentView2()
////    }
////}
//
//
//
//import SwiftUI
//
//struct ContentView2: View {
//    @State private var selectedLetter: String = "A"
//    private let alphabets = (65...90).map { String(UnicodeScalar($0)!) }
//    private let names = ["Alice", "Arnold", "Alex", "Bob", "Barbara", "Charlie", "Cynthia", "David", "Diana", "Eve", "Edward", "Frank", "Fiona", "Grace", "George", "Hank", "Hannah", "Ivy", "Ian", "Jack", "Julia", "Kevin", "Karen", "Liam", "Linda", "Mike", "Monica", "Nathan", "Nora", "Oliver", "Olivia", "Peter", "Paula", "Quinn", "Queen", "Roger", "Rachel", "Steve", "Sara", "Tom", "Tina", "Ulysses", "Uma", "Victor", "Vanessa", "William", "Wendy", "Xavier", "Xena", "Yuri", "Yvonne", "Zach", "Zoe"]
//
//    var body: some View {
//        NavigationView {
//            ZStack(alignment: .trailing) {
//                VStack {
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
//                            .offset(y: 1)
//                    }
//                    .padding(.top, 60)
//                    .padding(.vertical, 8)
//                    .background(Color.black)
//
//                    // Grid content
//                    ScrollView(.vertical, showsIndicators: true) {
//                        LazyVGrid(columns: [
//                            GridItem(.flexible(minimum: 70, maximum: 200), spacing: -50),
//                            GridItem(.flexible(minimum: 70, maximum: 200), spacing: -50),
//                            GridItem(.flexible(minimum: 70, maximum: 200), spacing: -50)
//                           
//                        ], spacing: 30, content: {
//                            ForEach(filteredNames, id: \.self) { name in
//                                VStack(alignment: .leading, spacing: 5) {
//                                    Image("defaultprofile")
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fill)
//                                        .frame(width: 75
//                                               , height: 130)
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
//        VStack(spacing: 1) {
//            ForEach(alphabets, id: \.self) { letter in
//                Text(letter)
//                    .font(.system(size: 12))
//                    .frame(width: 20, height: 10)
//                    .padding(.vertical, 2)
//            }
//
//        }
//        .padding(.vertical, 10)
//        .background(BlurView(style: .systemThinMaterial))
//        .cornerRadius(10)
//        .frame(maxHeight: .infinity, alignment: .center)
//        .gesture(
//            DragGesture(minimumDistance: 0)
//                .onChanged({ value in
//                    let totalHeight = CGFloat(alphabets.count * 35)
//                    let index = max(0, min(alphabets.count - 1, Int(value.location.y / totalHeight * CGFloat(alphabets.count))))
//                    selectedLetter = alphabets[index]
//                })
//        )
//    }
//    
//}
//
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
//// Preview
//struct ContentView2_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView2()
//    }
//}
