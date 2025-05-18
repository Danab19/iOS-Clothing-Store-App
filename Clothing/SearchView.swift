import SwiftUI

struct SearchView: View {
    @Binding var search: String 
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.leading)
                
                TextField("Search For Clothing", text: $search)
                    .padding()
            }
            .background(Color("Secondary"))
            .cornerRadius(12)
            
            Image(systemName: "magnifyingglass")
                .padding()
                .foregroundColor(.white)
                .background(Color("Main"))
                .cornerRadius(12)
        }
        .padding(.horizontal)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(search: .constant(""))
    }
}
