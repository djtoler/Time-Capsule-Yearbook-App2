import SwiftUI

struct Grids: View {
    let columns = [GridItem(.fixed(70)), GridItem(.fixed(70))]
    
    
    var body: some View {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(0..<6, id: \.self) { index in
                    Rectangle()
                            .frame(width: 70, height: 70)
                        
                    }
                }
            }
        }
    }


#Preview {
    Grids()
}
