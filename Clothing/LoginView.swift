import SwiftUI

struct LoginView: View {
    @AppStorage("userName") var userName: String = ""
    @AppStorage("userEmail") var userEmail: String = ""
    @State private var nameInput: String = ""
    @State private var emailInput: String = ""
    @State private var isLoginSuccessful: Bool = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Spacer()
                Image(systemName: "key.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.black)
                
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 15) {
                    Text("Name:")
                        .font(.headline)
                    TextField("Enter your name", text: $nameInput)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("Email:")
                        .font(.headline)
                    TextField("Enter your email", text: $emailInput)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.emailAddress)
                }
                .padding(.horizontal, 30)

                Button(action: {
                    userName = nameInput
                    userEmail = emailInput
                    isLoginSuccessful = true
                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(10)
                        .padding(.horizontal, 30)
                }
                .disabled(nameInput.isEmpty || emailInput.isEmpty)

                Spacer()
                
                if isLoginSuccessful {
                    NavigationLink(
                        destination: ProfileView(),
                        label: {
                            Text("Go to Profile")
                                .foregroundColor(.black)
                                .font(.headline)
                        }
                    )
                }
            }
            .navigationTitle("Login")
            .navigationBarHidden(true)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
