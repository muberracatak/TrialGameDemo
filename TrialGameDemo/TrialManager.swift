
import Foundation
import SwiftUI

class TrialManager: ObservableObject {
    private(set) var trial: [Trial.Result] = []
    @Published private(set) var length = 0
    
    @Published private(set) var index = 0
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [Answer] = []
    
    @Published private(set) var score = 0
    @Published private(set) var progress: CGFloat = 0.00
    
    @Published private(set) var answerSelected = false
    @Published private(set) var reachedEnd = false
    
    init() {
        Task.init {
            await fetchTria()
        }
    }
    
    func fetchTria() async {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=10") else { fatalError("Missing URL") }
        
//        let session = URLSession.shared.dataTask(with: url){
//            data,response,error in
//            if let error = error {
//                print("There was an error: \(error.localizedDescription)")
//            }
//            else{
//                let jsonRes = try? JSONSerialization.jsonObject(with: data!,options: [])
//                print("The response: \(jsonRes)")
//            }
//        }.resume()
        
        let urlRequest = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(Trial.self, from: data)

            DispatchQueue.main.async {
                self.index = 0
                self.score = 0
                self.progress = 0.00
                self.reachedEnd = false

                self.trial = decodedData.results
                self.length = self.trial.count
                self.setQuestion()
            }
        } catch {
            print("Error fetching tria: \(error)")
        }
    }
    
    func goToNextQuestion() {
        if index + 1 < length {
            index += 1
            setQuestion()
        } else {
            reachedEnd = true
        }
    }
    
    func setQuestion() {
        answerSelected = false
        progress = CGFloat(Double((index + 1)) / Double(length) * 350)

        if index < length {
            let currentTriaQuestion = trial[index]
            question = currentTriaQuestion.formattedQuestion
            answerChoices = currentTriaQuestion.answers
        }
    }
    
    func selectAnswer(answer: Answer) {
        answerSelected = true
        
        if answer.isCorrect {
            score += 1
        }
    }
}
