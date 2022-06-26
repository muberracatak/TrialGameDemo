//
//  ProgressBar.swift
//  TrialGameDemo
//
//  Created by Müberra Çatak on 26.06.2022.
//

import SwiftUI

struct ProgressBar: View {
    var progress: CGFloat
    
    var body: some View {
        ZStack(alignment: .leading){
            Rectangle()
                .frame(maxWidth: 350, maxHeight: 4)
                .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
                .cornerRadius(10)
            
            Rectangle()
                .frame(width: progress, height: 4)
                .foregroundColor(Color("AccentColor"))
                .cornerRadius(10)
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(progress: 50)
    }
}
