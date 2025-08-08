import Foundation

protocol AIAgent {
    var department: DepartmentType { get }
    var personality: AgentPersonality { get }
    
    func generateResponse(to scenario: Scenario, companyState: Company) -> AgentResponse
    func provideQuarterlyReport(for company: Company) -> String
    func reactToDecision(_ decision: DecisionOption, impact: DecisionImpact) -> String
}

struct AgentPersonality {
    let traits: [String]
    let communicationStyle: CommunicationStyle
    let riskTolerance: RiskTolerance
    
    init(traits: [String], communicationStyle: CommunicationStyle, riskTolerance: RiskTolerance) {
        self.traits = traits
        self.communicationStyle = communicationStyle
        self.riskTolerance = riskTolerance
    }
}

enum CommunicationStyle: String, CaseIterable {
    case analytical = "Analytical"
    case enthusiastic = "Enthusiastic" 
    case cautious = "Cautious"
    case direct = "Direct"
    case diplomatic = "Diplomatic"
}

enum RiskTolerance: String, CaseIterable {
    case conservative = "Conservative"
    case moderate = "Moderate"
    case aggressive = "Aggressive"
}

struct AgentResponse {
    let message: String
    let recommendedOption: Int?
    let reasoning: String
    let mood: AgentMood
    
    init(message: String, recommendedOption: Int?, reasoning: String, mood: AgentMood) {
        self.message = message
        self.recommendedOption = recommendedOption
        self.reasoning = reasoning
        self.mood = mood
    }
}

enum AgentMood: String, CaseIterable {
    case happy = "😊"
    case neutral = "😐"
    case concerned = "😟"
    case frustrated = "😤"
    case excited = "🤩"
    case worried = "😰"
}