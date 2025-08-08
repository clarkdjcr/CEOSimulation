import Foundation

public enum DepartmentType: String, CaseIterable {
    case sales = "Sales"
    case marketing = "Marketing" 
    case engineering = "Engineering"
    case hr = "Human Resources"
    case finance = "Finance"
    
    public var icon: String {
        switch self {
        case .sales: return "chart.line.uptrend.xyaxis"
        case .marketing: return "megaphone"
        case .engineering: return "hammer"
        case .hr: return "person.2"
        case .finance: return "dollarsign.circle"
        }
    }
}

@Observable
public class Department {
    public let type: DepartmentType
    public var performance: Double
    public var morale: Double
    public var budget: Double
    public var quarterlyReports: [String]
    
    public init(type: DepartmentType) {
        self.type = type
        self.performance = Double.random(in: 40...60)
        self.morale = Double.random(in: 40...60)
        self.budget = 20000
        self.quarterlyReports = []
    }
    
    public func applyDecisionImpact(_ impact: DecisionImpact) {
        performance = max(0, min(100, performance + impact.performanceChange))
        morale = max(0, min(100, morale + impact.moraleChange))
        budget += impact.budgetChange
    }
    
    public func generateQuarterlyReport() -> String {
        let report = "\(type.rawValue) Q\(quarterlyReports.count + 1): Performance \(Int(performance))%, Morale \(Int(morale))%"
        quarterlyReports.append(report)
        return report
    }
}