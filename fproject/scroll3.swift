
//  scroll3.swift
//  fproject
//
//  Created by Dwayne Toler on 5/14/24.


import Foundation
import SwiftUI

struct AlphabetScrollView3: View {
    @State private var selectedLetter: String = "A"
    private let alphabets = (65...90).map { String(UnicodeScalar($0)!) }
    private let names = ["Alice", "Arnold", "Bob", "Barbara", "Charlie", "Cynthia", "David", "Diana", "Eve", "Edward", "Frank", "Fiona", "Grace", "George", "Hank", "Hannah", "Ivy", "Ian", "Jack", "Julia", "Kevin", "Karen", "Liam", "Linda", "Mike", "Monica", "Nathan", "Nora", "Oliver", "Olivia", "Peter", "Paula", "Quinn", "Queen", "Roger", "Rachel", "Steve", "Sara", "Tom", "Tina", "Ulysses", "Uma", "Victor", "Vanessa", "William", "Wendy", "Xavier", "Xena", "Yuri", "Yvonne", "Zach", "Zoe"]

    var body: some View {
        HStack {
            List(filteredNames, id: \.self) { name in
                Text(name)
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 4) {
                    ForEach(alphabets, id: \.self) { letter in
                        Text(letter)
                            .font(.system(size: 12))
                            .frame(width: 24, height: 24)
                            .padding(4)
                            .background(letter == selectedLetter ? Color.gray.opacity(0.5) : Color.clear)
                            .cornerRadius(12)
                            .onTapGesture {
                                self.selectedLetter = letter
                            }
                    }
                }
            }
            .frame(width: 40)
        }
    }

    var filteredNames: [String] {
        names.filter { $0.hasPrefix(selectedLetter) }
    }
}

struct AlphabetScrollView3_Previews: PreviewProvider {
    static var previews: some View {
        AlphabetScrollView3()
    }
}


//import SwiftUI
//
//struct AlphabetScrollView3: View {
//    @State private var selectedLetter: String = "A"
//    private let alphabets = (65...90).map { String(UnicodeScalar($0)!) }
//    private let names = ["Alice", "Arnold", "Bob", "Barbara", "Charlie", "Cynthia", "David", "Diana", "Eve", "Edward", "Frank", "Fiona", "Grace", "George", "Hank", "Hannah", "Ivy", "Ian", "Jack", "Julia", "Kevin", "Karen", "Liam", "Linda", "Mike", "Monica", "Nathan", "Nora", "Oliver", "Olivia", "Peter", "Paula", "Quinn", "Queen", "Roger", "Rachel", "Steve", "Sara", "Tom", "Tina", "Ulysses", "Uma", "Victor", "Vanessa", "William", "Wendy", "Xavier", "Xena", "Yuri", "Yvonne", "Zach", "Zoe"]
//    
//    var body: some View {
//        HStack {
//            ScrollViewReader { value in
//                List {
//                    ForEach(names.sorted(), id: \.self) { name in
//                        Text(name)
//                            .id(String(name.prefix(1)))
//                            .onAppear {
//                                selectedLetter = String(name.prefix(1))
//                            }
//                    }
//                }
//                
//                ScrollView(.vertical, showsIndicators: false) {
//                    VStack(spacing: 4) {
//                        ForEach(alphabets, id: \.self) { letter in
//                            Text(letter)
//                                .font(.system(size: 12))
//                                .frame(width: 24, height: 24)
//                                .padding(4)
//                                .background(letter == selectedLetter ? Color.blue : Color.clear)
//                                .cornerRadius(12)
//                                .onTapGesture {
//                                    withAnimation {
//                                        value.scrollTo(letter, anchor: .top)
//                                        selectedLetter = letter
//                                    }
//                                }
//                        }
//                    }
//                }
//                .frame(width: 40)
//            }
//        }
//    }
//}
//
//struct AlphabetScrollView3_Previews: PreviewProvider {
//    static var previews: some View {
//        AlphabetScrollView3()
//    }
//}
