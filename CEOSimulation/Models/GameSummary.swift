import Foundation

struct GameSummary {
    let quartersSurvived: Int
    let scenariosCompleted: Int
    let currentScore: Int
    let finalBudget: Double
    let finalReputation: Double
    let finalPerformance: Double
    let strongestDepartment: DepartmentType
    let gameEndReason: String
    
    var isSuccessfulRun: Bool {
        return quartersSurvived >= 8 && finalBudget > 25000 && finalReputation > 30
    }
    
    var performanceGrade: String {
        let score = currentScore
        if score >= 800 { return "A+" }
        else if score >= 700 { return "A" }
        else if score >= 600 { return "B+" }
        else if score >= 500 { return "B" }
        else if score >= 400 { return "C+" }
        else if score >= 300 { return "C" }
        else if score >= 200 { return "D" }
        else { return "F" }
    }
    
    var summaryMessage: String {
        if isSuccessfulRun {
            return "Congratulations! You successfully led the company through challenging times and demonstrated strong leadership skills."
        } else if quartersSurvived >= 4 {
            return "Good effort! You managed to keep the company running for several quarters. With more experience, you'll achieve even better results."
        } else {
            return "Every great CEO learns from experience. Use the insights from this run to make better strategic decisions next time!"
        }
    }
}