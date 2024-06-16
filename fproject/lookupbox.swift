//
//  lookupbox.swift
//  Yearbook
//
//  Created by Tommy Hailey on 5/26/24.
//

import SwiftUI

struct lookupbox: View {
    private var listOfAcademy = academyNames
    @State var searchText = ""
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredacademys, id: \.self) { academy in
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                            .foregroundColor(.gray)
                        Text(academy.capitalized)
                        Spacer()
                    }
                    .padding()
                }
            }
            .searchable(text: $searchText)
            //.navigationTitle("")
        }
    }
    
    var filteredacademys: [String] {
        let lcAcademys = listOfAcademy.map { $0.lowercased() }
        
        return searchText.isEmpty ? [] : lcAcademys.filter {
            $0.contains(searchText.lowercased())
        }
    }
}

#Preview {
    lookupbox()
}
