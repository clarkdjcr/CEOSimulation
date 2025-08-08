import Foundation

public class ScoreManager {
    private var decisionHistory: [ScoredDecision] = []
    private var performanceMetrics: PerformanceMetrics = PerformanceMetrics()
    
    public init() {}
    
    public func recordDecision(_ decision: DecisionOption, for company: Company) {
        let scoredDecision = ScoredDecision(
            decision: decision,
            quarterMade: company.quarter,
            companyStateBefore: CompanySnapshot(from: company),
            timestamp: Date()
        )
        
        decisionHistory.append(scoredDecision)
        updatePerformanceMetrics(company)
    }
    
    public func calculateScore(for company: Company) -> Int {
        let baseScore = calculateBaseScore(company)
        let longevityBonus = calculateLongevityBonus(company)
        let consistencyBonus = calculateConsistencyBonus()
        let efficiencyBonus = calculateEfficiencyBonus()
        
        return max(0, baseScore + longevityBonus + consistencyBonus + efficiencyBonus)
    }
    
    private func calculateBaseScore(_ company: Company) -> Int {
        let budgetScore = min(100, max(0, Int(company.budget / 1000)))
        let reputationScore = Int(company.reputation * 2)
        let performanceScore = Int(company.overallPerformance * 1.5)
        let departmentScore = company.departments.map { Int($0.performance + $0.morale) / 2 }.reduce(0, +)
        
        return budgetScore + reputationScore + performanceScore + departmentScore
    }
    
    private func calculateLongevityBonus(_ company: Company) -> Int {
        return company.quarter * 10
    }
    
    private func calculateConsistencyBonus() -> Int {
        guard decisionHistory.count >= 4 else { return 0 }
        
        let recentDecisions = Array(decisionHistory.suffix(4))
        let balancedDecisions = recentDecisions.filter { decision in
            abs(decision.decision.impact.performanceChange) <= 10 &&
            abs(decision.decision.impact.reputationChange) <= 5
        }.count
        
        return balancedDecisions * 5
    }
    
    private func calculateEfficiencyBonus() -> Int {
        let lowCostHighImpactDecisions = decisionHistory.filter { decision in
            decision.decision.cost <= 10000 &&
            (decision.decision.impact.performanceChange > 5 || decision.decision.impact.reputationChange > 3)
        }.count
        
        return lowCostHighImpactDecisions * 15
    }
    
    private func updatePerformanceMetrics(_ company: Company) {
        performanceMetrics.totalBudgetSpent += decisionHistory.last?.decision.cost ?? 0
        performanceMetrics.averagePerformance = company.departments.map(\.performance).reduce(0, +) / Double(company.departments.count)
        performanceMetrics.averageMorale = company.departments.map(\.morale).reduce(0, +) / Double(company.departments.count)
        performanceMetrics.currentReputation = company.reputation
    }
    
    public func getPerformanceAnalysis(for company: Company) -> PerformanceAnalysis {
        return PerformanceAnalysis(
            totalScore: calculateScore(for: company),
            quartersSurvived: company.quarter,
            decisionsMade: decisionHistory.count,
            averageDecisionCost: decisionHistory.isEmpty ? 0 : decisionHistory.map(\.decision.cost).reduce(0, +) / Double(decisionHistory.count),
            strongestDepartment: findStrongestDepartment(company),
            weakestDepartment: findWeakestDepartment(company),
            keyStrengths: identifyStrengths(company),
            areasForImprovement: identifyWeaknesses(company),
            leadershipStyle: determineLeadershipStyle()
        )
    }
    
    private func findStrongestDepartment(_ company: Company) -> DepartmentType {
        return company.departments.max(by: { $0.performance < $1.performance })?.type ?? .sales
    }
    
    private func findWeakestDepartment(_ company: Company) -> DepartmentType {
        return company.departments.min(by: { $0.performance < $1.performance })?.type ?? .sales
    }
    
    private func identifyStrengths(_ company: Company) -> [String] {
        var strengths: [String] = []
        
        if company.budget > 75000 {
            strengths.append("Strong Financial Management")
        }
        
        if company.reputation > 70 {
            strengths.append("Excellent Brand Reputation")
        }
        
        if company.overallPerformance > 70 {
            strengths.append("High-Performance Operations")
        }
        
        if company.departments.allSatisfy({ $0.morale > 60 }) {
            strengths.append("Great Team Morale")
        }
        
        if calculateConsistencyBonus() > 15 {
            strengths.append("Consistent Decision Making")
        }
        
        return strengths.isEmpty ? ["Resilience Under Pressure"] : strengths
    }
    
    private func identifyWeaknesses(_ company: Company) -> [String] {
        var weaknesses: [String] = []
        
        if company.budget < 30000 {
            weaknesses.append("Cash Flow Management")
        }
        
        if company.reputation < 40 {
            weaknesses.append("Brand Reputation Recovery")
        }
        
        if company.overallPerformance < 40 {
            weaknesses.append("Operational Efficiency")
        }
        
        let lowMoraleDepts = company.departments.filter { $0.morale < 40 }.count
        if lowMoraleDepts > 1 {
            weaknesses.append("Employee Satisfaction")
        }
        
        if decisionHistory.count > 8 {
            let expensiveDecisions = decisionHistory.suffix(8).filter { $0.decision.cost > 20000 }.count
            if expensiveDecisions > 4 {
                weaknesses.append("Budget Optimization")
            }
        }
        
        return weaknesses.isEmpty ? ["Strategic Vision"] : weaknesses
    }
    
    private func determineLeadershipStyle() -> LeadershipStyle {
        guard !decisionHistory.isEmpty else { return .balanced }
        
        let totalDecisions = decisionHistory.count
        let aggressiveDecisions = decisionHistory.filter { $0.decision.cost > 25000 }.count
        let conservativeDecisions = decisionHistory.filter { $0.decision.cost == 0 }.count
        
        let aggressiveRatio = Double(aggressiveDecisions) / Double(totalDecisions)
        let conservativeRatio = Double(conservativeDecisions) / Double(totalDecisions)
        
        if aggressiveRatio > 0.4 {
            return .aggressive
        } else if conservativeRatio > 0.4 {
            return .conservative
        } else {
            return .balanced
        }
    }
    
    public func getDecisionHistory() -> [ScoredDecision] {
        return decisionHistory
    }
    
    public func getTopPerformingDecisions() -> [ScoredDecision] {
        return decisionHistory
            .filter { $0.decision.impact.performanceChange > 5 || $0.decision.impact.reputationChange > 3 }
            .sorted { $0.decision.impact.performanceChange > $1.decision.impact.performanceChange }
            .prefix(5)
            .map { $0 }
    }
}

public struct ScoredDecision {
    public let decision: DecisionOption
    public let quarterMade: Int
    public let companyStateBefore: CompanySnapshot
    public let timestamp: Date
    
    public init(decision: DecisionOption, quarterMade: Int, companyStateBefore: CompanySnapshot, timestamp: Date) {
        self.decision = decision
        self.quarterMade = quarterMade
        self.companyStateBefore = companyStateBefore
        self.timestamp = timestamp
    }
}

public struct CompanySnapshot {
    public let budget: Double
    public let reputation: Double
    public let overallPerformance: Double
    public let departmentPerformances: [DepartmentType: Double]
    
    public init(from company: Company) {
        self.budget = company.budget
        self.reputation = company.reputation
        self.overallPerformance = company.overallPerformance
        self.departmentPerformances = Dictionary(uniqueKeysWithValues: 
            company.departments.map { ($0.type, $0.performance) })
    }
}

public struct PerformanceMetrics {
    public var totalBudgetSpent: Double = 0
    public var averagePerformance: Double = 50
    public var averageMorale: Double = 50
    public var currentReputation: Double = 50
    
    public init() {}
}

public struct PerformanceAnalysis {
    public let totalScore: Int
    public let quartersSurvived: Int
    public let decisionsMade: Int
    public let averageDecisionCost: Double
    public let strongestDepartment: DepartmentType
    public let weakestDepartment: DepartmentType
    public let keyStrengths: [String]
    public let areasForImprovement: [String]
    public let leadershipStyle: LeadershipStyle
    
    public init(
        totalScore: Int,
        quartersSurvived: Int,
        decisionsMade: Int,
        averageDecisionCost: Double,
        strongestDepartment: DepartmentType,
        weakestDepartment: DepartmentType,
        keyStrengths: [String],
        areasForImprovement: [String],
        leadershipStyle: LeadershipStyle
    ) {
        self.totalScore = totalScore
        self.quartersSurvived = quartersSurvived
        self.decisionsMade = decisionsMade
        self.averageDecisionCost = averageDecisionCost
        self.strongestDepartment = strongestDepartment
        self.weakestDepartment = weakestDepartment
        self.keyStrengths = keyStrengths
        self.areasForImprovement = areasForImprovement
        self.leadershipStyle = leadershipStyle
    }
}

public enum LeadershipStyle: String, CaseIterable {
    case aggressive = "Aggressive Growth"
    case conservative = "Conservative Steward"
    case balanced = "Balanced Strategic"
    
    public var description: String {
        switch self {
        case .aggressive:
            return "You make bold, high-investment decisions focused on rapid growth and market capture."
        case .conservative:
            return "You prefer measured, low-risk approaches that prioritize stability and gradual improvement."
        case .balanced:
            return "You balance risk and reward, making strategic decisions that consider multiple factors."
        }
    }
}