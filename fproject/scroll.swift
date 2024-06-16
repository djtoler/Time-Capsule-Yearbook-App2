//
//  scroll.swift
//  fproject
//
//  Created by Dwayne Toler on 5/13/24.
//

import Foundation
import SwiftUI

import SwiftUI

struct AlphabetScrollView: View {
    @State private var selectedLetter: String = "A"
    private let alphabets = (65...90).map { String(UnicodeScalar($0)!) }
    private let names = ["Alice", "Bob", "Charlie", "David", "Eve", "Frank", "Grace", "Hank", "Ivy"]

    var body: some View {
        VStack {
            // Horizontal Scroll View of Alphabets
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(alphabets, id: \.self) { letter in
                        Text(letter)
                            .font(.system(size: self.selectedLetter == letter ? 48 : 24))
                            .scaleEffect(self.selectedLetter == letter ? 1.5 : 1.0)
                            .animation(.spring(), value: selectedLetter)
                            .onTapGesture {
                                self.selectedLetter = letter
                            }
                    }
                }
                .padding()
            }
            .frame(height: 100) // Apply frame to the instance

            // Names List
            List(filteredNames, id: \.self) { name in
                Text(name)
            }
        }
    }

    var filteredNames: [String] {
        names.filter { $0.hasPrefix(selectedLetter) }
    }
}

struct AlphabetScrollView_Previews: PreviewProvider {
    static var previews: some View {
        AlphabetScrollView()
    }
}

