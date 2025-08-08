import Foundation
import Collections

@Observable
public class GameController {
    public var company: Company
    public var currentScenario: Scenario?
    public var scenarioHistory: Deque<Scenario>
    public var isGameActive: Bool
    public var gameOverReason: String?
    
    private let scenarioManager: ScenarioManager
    private let scoreManager: ScoreManager
    
    public init() {
        self.company = Company()
        self.scenarioHistory = Deque<Scenario>()
        self.isGameActive = false
        self.scenarioManager = ScenarioManager()
        self.scoreManager = ScoreManager()
    }
    
    public func startNewGame() {
        company = Company()
        scenarioHistory.removeAll()
        currentScenario = nil
        isGameActive = true
        gameOverReason = nil
        
        generateNextScenario()
    }
    
    public func makeDecision(_ optionIndex: Int) {
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
    
    public func getCurrentScore() -> Int {
        return scoreManager.calculateScore(for: company)
    }
    
    public func getPerformanceMetrics() -> [String: Double] {
        return [
            "Budget": company.budget,
            "Reputation": company.reputation,
            "Overall Performance": company.overallPerformance,
            "Quarter": Double(company.quarter)
        ]
    }
}