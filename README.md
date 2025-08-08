# CEO Business Simulation

An educational business simulation game for macOS and iPadOS where players take on the role of a CEO managing an education technology company.

## Overview

This SwiftUI application provides an interactive learning experience about business leadership, strategic decision-making, and company management. Players navigate realistic business scenarios while receiving advice from AI-powered department heads.

## Features

### 🎮 Core Gameplay
- **Strategic Decision Making**: Face realistic business challenges across budget, technical, marketing, HR, and growth scenarios
- **Company Management**: Manage 5 key departments (Sales, Marketing, Engineering, HR, Finance)
- **Quarterly Progression**: Track performance over multiple business quarters
- **Dynamic Scoring**: Comprehensive scoring system based on financial performance, reputation, and team management

### 🤖 AI Department Advisors
- **Unique Personalities**: Each department head has distinct traits, communication styles, and risk tolerances
- **Contextual Advice**: AI agents provide scenario-specific recommendations based on company state
- **Realistic Interactions**: Department heads react to decisions with authentic professional responses

### 📊 Performance Analytics
- **Real-time Dashboards**: Monitor budget, reputation, performance, and morale metrics
- **Quarterly Reports**: Detailed analysis of company performance and department status
- **Leadership Assessment**: Analysis of decision patterns and leadership style
- **Progress Tracking**: Historical performance data and trend analysis

### 🎯 Educational Value
- **Business Strategy**: Learn long-term planning vs. short-term optimization
- **Resource Management**: Practice budget allocation and prioritization
- **Team Leadership**: Understand departmental dynamics and employee satisfaction
- **Crisis Management**: Navigate unexpected challenges and market pressures
- **Decision Analysis**: Evaluate trade-offs and consequences of business choices

## Technical Architecture

### Core Components
- **GameController**: Central game state management and flow orchestration
- **ScenarioManager**: Dynamic scenario generation based on company metrics
- **AIAgent Protocol**: Extensible system for department head personalities
- **ScoreManager**: Comprehensive performance tracking and analysis
- **Company/Department Models**: Business entity representation

### UI Design
- **Cross-Platform**: Native SwiftUI implementation for macOS and iPadOS
- **Adaptive Layout**: Responsive design optimized for different screen sizes
- **Navigation**: Tab-based interface with sidebar for metrics
- **Interactive Elements**: Card-based decision interface with visual feedback

### Data Management
- **Observable Pattern**: Reactive state management throughout the app
- **Swift Collections**: Efficient data structures for game history
- **Protocol-Oriented Design**: Flexible and extensible architecture

## Getting Started

### Requirements
- iOS 17.0+ / macOS 14.0+
- Xcode 15.0+
- Swift 5.9+

### Installation
1. Open `CEOSimulation.xcodeproj` in Xcode
2. Select your target device (Mac, iPad, or iPad Simulator)
3. Build and run the application

### First Time Setup
1. Launch the app
2. Read the welcome screen overview
3. Click "Start Your CEO Journey" to begin
4. Navigate through scenarios using the tab interface
5. Consult department advisors for strategic guidance

## Game Mechanics

### Scenario Types
- **Budget Crisis**: Financial challenges requiring strategic resource allocation
- **Technical Challenge**: Infrastructure and technology investment decisions  
- **Marketing Crisis**: Brand reputation and customer relations management
- **HR Issues**: Team management, culture, and retention challenges
- **Market Opportunities**: Growth, partnership, and expansion decisions

### Decision Impact
- **Performance**: Affects departmental and overall company efficiency
- **Morale**: Influences employee satisfaction and productivity
- **Budget**: Direct financial impact on company resources
- **Reputation**: Long-term brand value and market perception
- **Department-Specific**: Targeted effects on particular business areas

### Winning Strategies
- **Balanced Approach**: Maintain performance across all departments
- **Strategic Investment**: Make calculated decisions for long-term growth
- **Crisis Response**: React appropriately to different challenge types
- **Resource Optimization**: Maximize impact while managing constraints
- **Team Development**: Keep employee morale high for sustained success

## Development

### Project Structure
```
CEOSimulation/
├── CEOSimulation/           # Main app target
│   ├── Views/              # SwiftUI view components
│   ├── Assets.xcassets/    # App icons and resources
│   └── Info.plist         # App configuration
├── Sources/
│   └── CEOSimulationCore/  # Core business logic
│       ├── Models/         # Data models
│       ├── Controllers/    # Game controllers
│       ├── Managers/       # Business logic managers
│       └── Agents/         # AI agent system
└── Tests/                  # Unit tests
```

### Key Classes
- `GameController`: Main game orchestration
- `Company`: Central business entity model
- `ScenarioManager`: Dynamic content generation
- `AIAgent`: Department advisor protocol
- `ScoreManager`: Performance analytics

### Testing
Run unit tests to verify core functionality:
```bash
⌘ + U in Xcode
```

## Educational Applications

### Learning Objectives
- **Strategic Thinking**: Develop long-term planning skills
- **Financial Literacy**: Understand budget management and ROI analysis
- **Leadership Skills**: Practice team management and communication
- **Problem Solving**: Navigate complex business challenges
- **Decision Making**: Evaluate risks, benefits, and trade-offs

### Classroom Integration
- **Business Courses**: Strategic management and entrepreneurship
- **Leadership Training**: Executive development programs  
- **Economics Education**: Applied microeconomics and market dynamics
- **Team Building**: Collaborative decision-making exercises

## Future Enhancements

### Planned Features
- **Multiplayer Mode**: Compete against other players
- **Custom Scenarios**: User-generated business challenges
- **Industry Specialization**: Focus on specific market sectors
- **Advanced Analytics**: Detailed performance dashboards
- **Save/Resume**: Persistent game state across sessions
- **Difficulty Levels**: Adjusted market conditions and complexity

### Technical Improvements
- **Cloud Sync**: Cross-device game progress
- **Machine Learning**: Enhanced AI advisor behavior
- **Performance Optimization**: Improved rendering and responsiveness
- **Accessibility**: Enhanced support for assistive technologies

## Contributing

This project demonstrates advanced Swift and SwiftUI development patterns:
- Protocol-oriented programming
- Observable state management
- Dynamic content generation
- AI behavior modeling
- Cross-platform UI design

## License

This educational simulation is designed for learning and demonstration purposes.

---

*Experience the challenge of business leadership in a risk-free environment. Make strategic decisions, learn from mistakes, and develop the skills needed for real-world business success.*