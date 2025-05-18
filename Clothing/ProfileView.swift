import SwiftUI

struct ProfileView: View {
    @AppStorage("userName") var userName: String = "John Doe"
    @AppStorage("userEmail") var userEmail: String = "johndoe@email.com"
    @State private var phoneNumber: String = "(123) 456-7890"
    @State private var address: String = "123 Street, City, Country"
    @State private var isEditing: Bool = false

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                VStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .foregroundColor(.gray)

                    Text(userName)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 10)
                    Text(userEmail)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .center)

                VStack(alignment: .leading, spacing: 15) {
                    if isEditing {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Phone:")
                                .font(.headline)
                            TextField("Enter phone number", text: $phoneNumber)
                                .textFieldStyle(RoundedBorderTextFieldStyle())

                            Text("Address:")
                                .font(.headline)
                            TextField("Enter address", text: $address)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    } else {
                        Text("Phone: \(phoneNumber)")
                            .font(.body)
                        Text("Address: \(address)")
                            .font(.body)
                    }

                    Text("Order History")
                        .font(.headline)

                    ForEach(1..<4) { index in
                        HStack {
                            Text("Order #\(index)")
                            Spacer()
                            Text("$99.99")
                        }
                        .padding(.vertical, 5)
                        Divider()
                    }
                }
                .padding(.horizontal)

                Button(action: {
                    withAnimation {
                        isEditing.toggle()
                    }
                }) {
                    Text(isEditing ? "Save" : "Edit Details")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(5)
                        .shadow(radius: 5)
                }

                Button(action: {
                    userName = ""
                    userEmail = ""
                    phoneNumber = ""
                    address = ""
                }) {
                    Text("Sign Out")
                        .font(.headline)
                        .foregroundColor(.red)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .padding(.top, 10)
            }
            .padding(.top, 20)
        }
        .background(Color("SecondaryBackground"))
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .navigationBarTitle("Profile", displayMode: .inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
