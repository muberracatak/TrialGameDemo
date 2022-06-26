//
//  ContentView.swift
//  TrialGameDemo
//
//  Created by Müberra Çatak on 26.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var trialManager = TrialManager()
    var body: some View {
        NavigationView {
            VStack(spacing:40){
                VStack(spacing:20){
                    Text("Trial Game")
                        .lilacTitle()
                    
                    Text("Are you ready to test out your trial skills ?")
                        .foregroundColor(Color("AccentColor"))
                }
                NavigationLink{
                    TrialView()
                        .environmentObject(TrialManager())
                } label: {
                    PrimaryButton(text: "Let's go")
                }
               
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
        .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
