//
//  scroll2.swift
//  fproject
//
//  Created by Dwayne Toler on 5/13/24.
//

import Foundation

//import SwiftUI
//
//struct AlphabetScrollView2: View {
//    @State private var selectedLetter: String = "A"
//    private let alphabets = (65...90).map { String(UnicodeScalar($0)!) }
//    private let names = ["Alice", "Bob", "Charlie", "David", "Eve", "Frank", "Grace", "Hank", "Ivy"]
//
//    var body: some View {
//        VStack {
//            GeometryReader { outerGeometry in
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack(spacing: 20) {
//                        ForEach(alphabets, id: \.self) { letter in
//                            GeometryReader { innerGeometry in
//                                let scale = self.getScale(outerGeometry: outerGeometry, innerGeometry: innerGeometry)
//                                Text(letter)
//                                    .font(.system(size: 24))
//                                    .scaleEffect(scale)
//                                    .frame(width: 40, height: 100)
//                                    .onChange(of: scale) { newScale in
//                                        // Update selectedLetter when the scale is at its maximum
//                                        if newScale == 1.5 {
//                                            self.selectedLetter = letter
//                                        }
//                                    }
//                            }
//                            .frame(width: 40, height: 100)
//                        }
//                    }
//                    .padding()
//                }
//            }
//            .frame(height: 100)
//
//            // Names List
//            List {
//                if filteredNames.isEmpty {
//                    Text("No names available")
//                } else {
//                    ForEach(filteredNames, id: \.self) { name in
//                        Text(name)
//                    }
//                }
//            }
//        }
//    }
//
//    // Function to calculate the scale based on the letter's distance from the center
//    private func getScale(outerGeometry: GeometryProxy, innerGeometry: GeometryProxy) -> CGFloat {
//        let outerCenterX = outerGeometry.frame(in: .global).midX
//        let innerCenterX = innerGeometry.frame(in: .global).midX
//        let distance = abs(outerCenterX - innerCenterX)
//        // Adjust scaling effect as necessary
//        let scale = max(0.5, 1.5 - (distance / 200))
//        return scale
//    }
//
//    // Function to filter names based on the selected letter
//    var filteredNames: [String] {
//        names.filter { $0.hasPrefix(selectedLetter) }
//    }
//}
//
//struct AlphabetScrollView2_Previews: PreviewProvider {
//    static var previews: some View {
//        AlphabetScrollView2()
//    }
//}


//import SwiftUI
//
//struct AlphabetScrollView2: View {
//    @State private var selectedLetter: String = "A"
//    @State private var scrollOffset: CGFloat = 0
//    private let alphabets = (65...90).map { String(UnicodeScalar($0)!) }
//    private let names = ["Alice", "Arnold", "Bob", "Barbara", "Charlie", "Cynthia", "David", "Diana", "Eve", "Edward", "Frank", "Fiona", "Grace", "George", "Hank", "Hannah", "Ivy", "Ian", "Jack", "Julia", "Kevin", "Karen", "Liam", "Linda", "Mike", "Monica", "Nathan", "Nora", "Oliver", "Olivia", "Peter", "Paula", "Quinn", "Queen", "Roger", "Rachel", "Steve", "Sara", "Tom", "Tina", "Ulysses", "Uma", "Victor", "Vanessa", "William", "Wendy", "Xavier", "Xena", "Yuri", "Yvonne", "Zach", "Zoe"]
//
//    var body: some View {
//        VStack {
//            GeometryReader { outerGeometry in
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack(spacing: 20) {
//                        ForEach(alphabets, id: \.self) { letter in
//                            GeometryReader { geometry in
//                                createLetterView(letter: letter, geometry: geometry)
//                            }
//                            .frame(width: 50, height: 100) // Adjusted frame width
//                            .id(letter)
//                        }
//                    }
//                    .padding(40) // Increased padding
//                    .background(GeometryReader {
//                        Color.clear.preference(key: ViewOffsetKey.self, value: -$0.frame(in: .global).minX)
//                    })
//                }
//                .onPreferenceChange(ViewOffsetKey.self) { offset in
//                    updateSelectedLetter(from: offset, width: outerGeometry.size.width)
//                }
//                .frame(height: 100)
//            }
//
//            List(filteredNames, id: \.self) { name in
//                Text(name)
//            }
//        }
//    }
//
//    private func updateSelectedLetter(from offset: CGFloat, width: CGFloat) {
//        let index = Int(round((offset + width / 2) / 60)) // Assuming each letter view is 60 pts wide
//        self.selectedLetter = alphabets[max(0, min(alphabets.count - 1, index))]
//    }
//
//    private func createLetterView(letter: String, geometry: GeometryProxy) -> some View {
//        let scale: CGFloat = calculateScale(geometry: geometry)
//        return Text(letter)
//            .font(.system(size: 24))
//            .scaleEffect(scale)
//    }
//
//    private func calculateScale(geometry: GeometryProxy) -> CGFloat {
//        let frame = geometry.frame(in: .global)
//        let midX = frame.midX
//        let width = frame.width
//        let center = UIScreen.main.bounds.width / 2 // Use UIScreen to find the exact center
//        let distance = abs(midX - center)
//        let maxScale: CGFloat = 1.5
//        let minScale: CGFloat = 0.5
//        let scale = max(minScale, maxScale - (distance / width))
//        return scale
//    }
//
//    var filteredNames: [String] {
//        names.filter { $0.hasPrefix(selectedLetter) }
//    }
//}
//
//struct ViewOffsetKey: PreferenceKey {
//    static var defaultValue: CGFloat = 0
//    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
//        value += nextValue()
//    }
//}
//
//struct AlphabetScrollView2_Previews: PreviewProvider {
//    static var previews: some View {
//        AlphabetScrollView2()
//    }
//}

import SwiftUI

struct AlphabetScrollView2: View {
    @State private var selectedLetter: String = "A"
    private let alphabets = (65...90).map { String(UnicodeScalar($0)!) }
    private let names = ["Alice", "Arnold", "Bob", "Barbara", "Charlie", "Cynthia", "David", "Diana", "Eve", "Edward", "Frank", "Fiona", "Grace", "George", "Hank", "Hannah", "Ivy", "Ian", "Jack", "Julia", "Kevin", "Karen", "Liam", "Linda", "Mike", "Monica", "Nathan", "Nora", "Oliver", "Olivia", "Peter", "Paula", "Quinn", "Queen", "Roger", "Rachel", "Steve", "Sara", "Tom", "Tina", "Ulysses", "Uma", "Victor", "Vanessa", "William", "Wendy", "Xavier", "Xena", "Yuri", "Yvonne", "Zach", "Zoe"]

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                List(filteredNames, id: \.self) { name in
                    Text(name)
                }
                .frame(width: geometry.size.width * 0.85) // Main content area

                VStack {
                    let totalHeight = geometry.size.height
                    let letterHeight = totalHeight / CGFloat(alphabets.count)
                    
                    VStack(spacing: 0) {
                        ForEach(alphabets, id: \.self) { letter in
                            Text(letter)
                                .font(.system(size: 12))
                                .frame(width: 40, height: letterHeight)
                                .background(self.selectedLetter == letter ? Color.blue : Color.clear)
                                .cornerRadius(6)
                        }
                    }
                    .frame(width: geometry.size.width * 0.15, height: totalHeight)
                    .contentShape(Rectangle())
                    .gesture(
                        DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged { value in
                            let index = Int((value.location.y / letterHeight).rounded())
                            if index >= 0 && index < alphabets.count {
                                selectedLetter = alphabets[index]
                            }
                        }
                    )
                }
            }
        }
    }

    var filteredNames: [String] {
        names.filter { $0.hasPrefix(selectedLetter) }
    }
}

struct AlphabetScrollView2_Previews: PreviewProvider {
    static var previews: some View {
        AlphabetScrollView2()
    }
}
