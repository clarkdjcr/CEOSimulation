# 🚀 CEO Simulation - Launch Guide

## Quick Start

1. **Open the Project**
   ```
   Double-click: CEOSimulation.xcodeproj
   ```

2. **Select Target**
   - For Mac: Choose "My Mac" 
   - For iPad: Choose iPad Simulator or connect your iPad

3. **Build & Run**
   - Press `⌘ + R` or click the Play button

## Project Structure

```
CEOSimulation/
├── CEOSimulationApp.swift    # Main app entry point
├── ContentView.swift         # Welcome screen and navigation
├── Views/                    # All SwiftUI views
│   ├── GameView.swift       # Main game interface
│   ├── AdvisorsView.swift   # AI department heads
│   ├── MetricsView.swift    # Performance dashboard
│   └── QuarterlyReportView.swift # Detailed reports
├── Models/                   # Data structures
│   ├── Company.swift        # Company state
│   ├── Department.swift     # Department management
│   └── Scenario.swift       # Business scenarios
├── Controllers/
│   └── GameController.swift # Game state management
├── Managers/
│   ├── ScenarioManager.swift # Dynamic scenario generation
│   └── ScoreManager.swift    # Performance analytics
└── Agents/
    ├── AIAgent.swift         # AI protocol
    └── DepartmentAgents.swift # 5 department heads
```

## How to Play

1. **Start Game** - Click "Start Your CEO Journey"
2. **Make Decisions** - Choose from 3 options for each business scenario
3. **Get Advice** - Consult AI department heads for guidance
4. **Monitor Progress** - Track budget, reputation, and performance
5. **Quarterly Reviews** - Analyze results every 4 scenarios
6. **Survive & Thrive** - Manage your company for 12+ quarters

## Features

### 🤖 AI Department Heads
- **Sales** - Results-oriented, competitive, enthusiastic
- **Marketing** - Creative, diplomatic, brand-focused  
- **Engineering** - Technical, analytical, perfectionist
- **HR** - Empathetic, people-focused, collaborative
- **Finance** - Cautious, detail-oriented, data-driven

### 📊 Business Scenarios
- **Budget Crisis** - Financial challenges and cash flow
- **Technical Challenge** - Infrastructure and innovation
- **Marketing Crisis** - Brand reputation and PR
- **HR Issues** - Team management and culture
- **Market Opportunities** - Growth and expansion

### 🎯 Scoring System
- **Base Performance** - Budget, reputation, department metrics
- **Longevity Bonus** - Quarters survived
- **Decision Quality** - Strategic consistency
- **Leadership Style** - Aggressive, Conservative, or Balanced

## Troubleshooting

**Build Errors?**
- Clean build folder: `⌘ + Shift + K`
- Restart Xcode
- Check deployment target (macOS 14+, iOS 17+)

**Game Not Loading?**
- All source files are included in single target
- No external dependencies required
- Should run immediately after build

## Educational Uses

Perfect for:
- **Business Schools** - Strategic management courses
- **Corporate Training** - Leadership development
- **Entrepreneurship** - Decision-making practice
- **Team Building** - Collaborative gameplay

---

🎮 **Ready to lead your education technology company to success?**

Start by double-clicking `CEOSimulation.xcodeproj` and begin your CEO journey!