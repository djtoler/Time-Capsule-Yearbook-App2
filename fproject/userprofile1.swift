import SwiftUI

struct igprofile: View {
    var body: some View {
        ScrollView {
            VStack {
                
                //nav bar
                HStack {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                    
                   // Spacer()
                    VStack {
                        Text("BREA PRYOR")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text("UI/UX DESIGNER")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        HStack {
                            VStack {
                                Spacer()
                                //(spacing: 30)
                        
                            
                            Text("MEMORIES")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                        }
                        
                        
                        
                        
                        Image(systemName: "checkmark. seal. fill")
                            .foregroundColor(.blue)
                        
                        Spacer()
                            
                    }
                      
                    }
                    
                    
                //profile image
                    HStack {
                        Spacer()
                        Image("dfp")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 88, height: 88)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        
                    }
                    
                }
            }
            .padding()
          
        }
    }
}

#Preview {
    igprofile()
}

