import SwiftUI

struct bottom_page: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("LINKS")
                .font(.subheadline)
                .fontWeight(.semibold)
                //.font(.caption)
          
                Text("Portfolio")
                .font(.footnote)
                .fontWeight(.semibold)
                    .frame(width: 352, height: 34)
                    .overlay(RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(.black))
                                )
                
                Text("Github")
                .font(.footnote)
                .fontWeight(.semibold)
                    .frame(width:352, height: 34)
                    .overlay(RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(.black))
                                )
                
                Text("SHARE A MEMORY")
                             
        }
    }
}
#Preview {
    bottom_page()
}
