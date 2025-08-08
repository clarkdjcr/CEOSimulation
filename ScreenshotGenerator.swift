import SwiftUI
import UIKit

struct ScreenshotGenerator {
    
    static func generateScreenshots() {
        // Generate screenshots for App Store
        let screenshots = [
            createMainGameView(),
            createAdvisorsView(),
            createMetricsView(),
            createQuarterlyReportView()
        ]
        
        for (index, view) in screenshots.enumerated() {
            saveViewAsImage(view: view, filename: "screenshot_\(index + 1).png")
        }
    }
    
    static func createMainGameView() -> some View {
        // Mock the main game screen
        VStack {
            Text("CEO Business Simulation")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            // Mock scenario card
            VStack(alignment: .leading, spacing: 16) {
                Text("Budget Crisis")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("Your company is facing a budget shortfall of $500K. The marketing team needs funds for a crucial campaign, while engineering requires server upgrades.")
                    .font(.body)
                    .lineLimit(nil)
                
                HStack {
                    Button("Cut Marketing Budget") {
                        // Mock action
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button("Delay Server Upgrades") {
                        // Mock action
                    }
                    .buttonStyle(.bordered)
                }
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 4)
            .padding()
            
            Spacer()
            
            // Mock metrics bar
            HStack {
                MetricView(title: "Budget", value: "$2.1M", color: .green)
                MetricView(title: "Reputation", value: "85%", color: .blue)
                MetricView(title: "Morale", value: "78%", color: .orange)
                MetricView(title: "Performance", value: "92%", color: .purple)
            }
            .padding()
        }
        .frame(width: 430, height: 932) // iPhone 14 Pro Max size
        .background(LinearGradient(colors: [.blue.opacity(0.1), .white], startPoint: .top, endPoint: .bottom))
    }
    
    static func createAdvisorsView() -> some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Department Advisors")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 16) {
                    AdvisorCard(name: "Sarah Chen", department: "Engineering", advice: "Server upgrades critical for Q3")
                    AdvisorCard(name: "Marcus Johnson", department: "Sales", advice: "New leads looking promising")
                    AdvisorCard(name: "Elena Rodriguez", department: "Marketing", advice: "Campaign ROI exceeding targets")
                    AdvisorCard(name: "David Kim", department: "HR", advice: "Team morale needs attention")
                }
                .padding()
                
                Spacer()
            }
        }
        .frame(width: 430, height: 932)
    }
    
    static func createMetricsView() -> some View {
        VStack {
            Text("Company Performance")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            // Mock charts would go here
            VStack(spacing: 24) {
                ChartMockView(title: "Budget Trends", color: .green)
                ChartMockView(title: "Reputation Over Time", color: .blue)
                ChartMockView(title: "Team Performance", color: .purple)
            }
            .padding()
            
            Spacer()
        }
        .frame(width: 430, height: 932)
        .background(LinearGradient(colors: [.blue.opacity(0.05), .white], startPoint: .top, endPoint: .bottom))
    }
    
    static func createQuarterlyReportView() -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Q2 2024 Report")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Executive Summary")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text("Strong performance this quarter with 15% revenue growth. Marketing campaigns exceeded targets while engineering delivered key infrastructure improvements.")
                        .font(.body)
                }
                
                HStack {
                    VStack {
                        Text("$3.2M")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Revenue")
                            .font(.caption)
                    }
                    .frame(maxWidth: .infinity)
                    
                    VStack {
                        Text("89%")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Reputation")
                            .font(.caption)
                    }
                    .frame(maxWidth: .infinity)
                    
                    VStack {
                        Text("94%")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Performance")
                            .font(.caption)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
            }
            .padding()
        }
        .frame(width: 430, height: 932)
    }
    
    static func saveViewAsImage<V: View>(view: V, filename: String) {
        let controller = UIHostingController(rootView: view)
        controller.view.frame = CGRect(x: 0, y: 0, width: 430, height: 932)
        
        let renderer = UIGraphicsImageRenderer(size: controller.view.bounds.size)
        let image = renderer.image { _ in
            controller.view.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
        
        if let data = image.pngData() {
            let documentsPath = FileManager.default.urls(for: .documentsDirectory, in: .userDomainMask)[0]
            let filePath = documentsPath.appendingPathComponent(filename)
            try? data.write(to: filePath)
            print("Screenshot saved to: \(filePath)")
        }
    }
}

struct MetricView: View {
    let title: String
    let value: String
    let color: Color
    
    var body: some View {
        VStack {
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(color)
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
    }
}

struct AdvisorCard: View {
    let name: String
    let department: String
    let advice: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(name)
                .font(.headline)
                .fontWeight(.semibold)
            Text(department)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text(advice)
                .font(.caption)
                .lineLimit(3)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}

struct ChartMockView: View {
    let title: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            
            // Mock chart representation
            RoundedRectangle(cornerRadius: 8)
                .fill(color.opacity(0.3))
                .frame(height: 120)
                .overlay(
                    // Mock trend line
                    Path { path in
                        path.move(to: CGPoint(x: 20, y: 80))
                        path.addLine(to: CGPoint(x: 60, y: 60))
                        path.addLine(to: CGPoint(x: 100, y: 40))
                        path.addLine(to: CGPoint(x: 140, y: 30))
                        path.addLine(to: CGPoint(x: 180, y: 25))
                    }
                    .stroke(color, lineWidth: 3)
                )
        }
    }
}