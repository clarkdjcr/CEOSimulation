import Foundation

 enum ScenarioCategory: String, CaseIterable {
    case budget = "Budget Crisis"
    case technical = "Technical Challenge" 
    case marketing = "Marketing Crisis"
    case hr = "HR Issue"
    case opportunity = "Market Opportunity"
}

 struct DecisionOption: Equatable {
     let title: String
     let description: String
     let cost: Double
     let impact: DecisionImpact
    
     init(title: String, description: String, cost: Double, impact: DecisionImpact) {
        self.title = title
        self.description = description
        self.cost = cost
        self.impact = impact
    }
}

 struct DecisionImpact: Equatable {
     let performanceChange: Double
     let moraleChange: Double
     let budgetChange: Double
     let reputationChange: Double
     let departmentSpecific: DepartmentType?
    
     init(
        performanceChange: Double = 0,
        moraleChange: Double = 0,
        budgetChange: Double = 0,
        reputationChange: Double = 0,
        departmentSpecific: DepartmentType? = nil
    ) {
        self.performanceChange = performanceChange
        self.moraleChange = moraleChange
        self.budgetChange = budgetChange
        self.reputationChange = reputationChange
        self.departmentSpecific = departmentSpecific
    }
}

 struct Scenario: Equatable {
     let id: UUID
     let category: ScenarioCategory
     let title: String
     let description: String
     let options: [DecisionOption]
     let quarter: Int
    
     init(
        category: ScenarioCategory,
        title: String,
        description: String,
        options: [DecisionOption],
        quarter: Int
    ) {
        self.id = UUID()
        self.category = category
        self.title = title
        self.description = description
        self.options = options
        self.quarter = quarter
    }
}