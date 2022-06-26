//
//  TrialView.swift
//  TrialGameDemo
//
//  Created by Müberra Çatak on 26.06.2022.
//

import SwiftUI

struct TrialView: View {
    @EnvironmentObject var trialManager: TrialManager

    var body: some View {
        if trialManager.reachedEnd{
            VStack(spacing:20){
                Text("Trial game")
                    .lilacTitle()
                
                Text("Congratulations, you completed the game 🥳")
                
                Text("You scored \(trialManager.score) out of \(trialManager.length)")
                
                Button{
                    Task.init{
                        await trialManager.fetchTria()
                    }
                } label: {
                    PrimaryButton(text: "Play again")
                }
            
            }.foregroundColor(Color("AccentColor"))
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity )
                .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        }else{
       QuestionView()
            .environmentObject(trialManager)
    }
    }
}

struct TrialView_Previews: PreviewProvider {
    static var previews: some View {
        TrialView()
            .environmentObject(TrialManager())
    }
}
