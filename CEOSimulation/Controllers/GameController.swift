import Foundation

@Observable
class GameController {
    var company: Company
    var currentScenario: Scenario?
    var scenarioHistory: [Scenario]
    var isGameActive: Bool
    var gameOverReason: String?
    var showingExitConfirmation: Bool = false
    
    private let scenarioManager: ScenarioManager
    private let scoreManager: ScoreManager
    
    init() {
        self.company = Company()
        self.scenarioHistory = []
        self.isGameActive = false
        self.scenarioManager = ScenarioManager()
        self.scoreManager = ScoreManager()
    }
    
    func startNewGame() {
        company = Company()
        scenarioHistory.removeAll()
        currentScenario = nil
        isGameActive = true
        gameOverReason = nil
        
        generateNextScenario()
    }
    
    func makeDecision(_ optionIndex: Int) {
        guard let scenario = currentScenario,
              optionIndex < scenario.options.count else { return }
        
        let option = scenario.options[optionIndex]
        applyDecision(option)
        
        scenarioHistory.append(scenario)
        currentScenario = nil
        
        checkGameOver()
        
        if isGameActive {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.generateNextScenario()
            }
        }
    }
    
    private func applyDecision(_ option: DecisionOption) {
        company.budget += option.impact.budgetChange
        company.reputation = max(0, min(100, company.reputation + option.impact.reputationChange))
        
        if let specificDept = option.impact.departmentSpecific {
            if let department = company.departments.first(where: { $0.type == specificDept }) {
                department.applyDecisionImpact(option.impact)
            }
        } else {
            for department in company.departments {
                department.applyDecisionImpact(option.impact)
            }
        }
        
        company.updateMetrics()
        scoreManager.recordDecision(option, for: company)
    }
    
    private func generateNextScenario() {
        guard isGameActive else { return }
        
        if scenarioHistory.count > 0 && scenarioHistory.count % 4 == 0 {
            company.advanceQuarter()
        }
        
        currentScenario = scenarioManager.generateScenario(for: company)
    }
    
    private func checkGameOver() {
        if company.budget < 0 {
            endGame(reason: "Company ran out of money!")
        } else if company.reputation < 10 {
            endGame(reason: "Company reputation fell too low!")
        } else if company.overallPerformance < 10 {
            endGame(reason: "Company performance declined beyond recovery!")
        } else if company.quarter > 12 {
            endGame(reason: "Congratulations! You successfully managed the company for 3 years!")
        }
    }
    
    private func endGame(reason: String) {
        isGameActive = false
        gameOverReason = reason
        currentScenario = nil
    }
    
    func getCurrentScore() -> Int {
        return scoreManager.calculateScore(for: company)
    }
    
    func getPerformanceMetrics() -> [String: Double] {
        return [
            "Budget": company.budget,
            "Reputation": company.reputation,
            "Overall Performance": company.overallPerformance,
            "Quarter": Double(company.quarter)
        ]
    }
    
    func requestExitGame() {
        showingExitConfirmation = true
    }
    
    func confirmExitGame() {
        exitToWelcomeScreen()
        showingExitConfirmation = false
    }
    
    func cancelExitGame() {
        showingExitConfirmation = false
    }
    
    func exitToWelcomeScreen() {
        // Reset all game state
        company = Company()
        scenarioHistory.removeAll()
        currentScenario = nil
        isGameActive = false
        gameOverReason = nil
        showingExitConfirmation = false
    }
    
    func pauseGame() {
        // Pause functionality - stops scenario generation
        currentScenario = nil
    }
    
    func getGameSummary() -> GameSummary {
        return GameSummary(
            quartersSurvived: company.quarter,
            scenariosCompleted: scenarioHistory.count,
            currentScore: getCurrentScore(),
            finalBudget: company.budget,
            finalReputation: company.reputation,
            finalPerformance: company.overallPerformance,
            strongestDepartment: company.departments.max(by: { $0.performance < $1.performance })?.type ?? .sales,
            gameEndReason: gameOverReason ?? "Player exited game"
        )
    }
}