//
//  Answer.swift
//  TrialGameDemo
//
//  Created by Müberra Çatak on 26.06.2022.
//

import Foundation

struct Answer: Identifiable{
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}
