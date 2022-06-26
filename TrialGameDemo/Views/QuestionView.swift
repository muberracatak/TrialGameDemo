//
//  QuestionView.swift
//  TrialGameDemo
//
//  Created by Müberra Çatak on 26.06.2022.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var trialManager: TrialManager
    var body: some View {
        VStack(spacing:40){
            HStack{
                Text("Trial Game")
                    .lilacTitle()
                
                Spacer()
                Text("\(trialManager.index + 1) out of \(trialManager.length)")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
            }
            ProgressBar(progress: trialManager.progress)
            
            VStack(alignment: .leading, spacing:20){
                Text(trialManager.question)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)
                ForEach(trialManager.answerChoices, id: \.id){ answer in
                                    AnswerRow(answer: answer)
                                        .environmentObject(trialManager)
                                }
            }
                
            
            Button{
                trialManager.goToNextQuestion()
            }
        label:{
            PrimaryButton(text: "Next", background: trialManager.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
                    }.disabled(!trialManager.answerSelected)
            
            
                Spacer()
        }.padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
            .navigationBarHidden(true)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(TrialManager())
    }
}
