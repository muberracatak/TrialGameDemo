//
//  Extensions.swift
//  TrialGameDemo
//
//  Created by Müberra Çatak on 26.06.2022.
//

import Foundation
import SwiftUI

extension Text{
    func lilacTitle() -> some View {
        self .font(.title)
            .fontWeight(.heavy)
            .foregroundColor(Color("AccentColor"))
    }
}
