import Foundation

@Observable
class Company {
    var budget: Double
    var reputation: Double
    var overallPerformance: Double
    var quarter: Int
    var departments: [Department]
    
    init(
        budget: Double = 100000,
        reputation: Double = 50,
        overallPerformance: Double = 50,
        quarter: Int = 1
    ) {
        self.budget = budget
        self.reputation = reputation
        self.overallPerformance = overallPerformance
        self.quarter = quarter
        self.departments = [
            Department(type: .sales),
            Department(type: .marketing),
            Department(type: .engineering),
            Department(type: .hr),
            Department(type: .finance)
        ]
    }
    
    func updateMetrics() {
        overallPerformance = departments.map(\.performance).reduce(0, +) / Double(departments.count)
    }
    
    func advanceQuarter() {
        quarter += 1
        for department in departments {
            department.generateQuarterlyReport()
        }
    }
}