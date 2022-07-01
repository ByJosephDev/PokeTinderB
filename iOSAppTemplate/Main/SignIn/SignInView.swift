//
//  SignInView.swift
//  iOSAppTemplate
//
//  Created by Joseph Puma on 19/06/2022.
//

import SwiftUI

struct SignInView: View {
    
    @EnvironmentObject var appState: AppState
    
    @StateObject var authViewModel = AuthViewModel()
    
    @State private var email:String = ""
    @State private var password:String = ""
    @State var alertError = false
    
    var body: some View {
        
        NavigationView{
            
            ScrollView{
                VStack(spacing: 15){
                    Text("Hello PokeUser!!")
                        .font(.system(size: 25, weight: .bold))
                    Text("Welcome back we've missed you")
                        .font(.system(size: 25))
                        .frame(maxWidth:200)
                    
                    VStack(spacing: 25){
                        TextField("Enter your email", text: $email)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(.pink, lineWidth: 1))
                            .keyboardType(.emailAddress)
                        
                        SecureField("Enter your password", text: $password)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(.pink, lineWidth: 1))
                    
                        Button{
                            authViewModel.login(email: email, password: password)
                        } label: {
                            Text("Sign In")
                                .padding()
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .bold))
                        }.frame(maxWidth: .infinity)
                            .background(.pink)
                            .cornerRadius(20)
                        
                        NavigationLink(destination: SignUpView()) {
                            Text("Not a member? Register now")
                        }
                        
                    }.padding()
                        .alert(isPresented: $alertError) {
                            Alert(
                                title: Text("Error"),
                                message: Text(authViewModel.errorMessage),
                                dismissButton: .default(Text("Ok"))
                            )
                        }
                        .onReceive(authViewModel.$showError) { newValue in
                            alertError = newValue
                        }
                }
            }
            
        }.accentColor(.pink)
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
