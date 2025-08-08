#!/bin/bash

echo "🔍 Validating CEO Simulation Project Structure..."
echo

# Check for required files
required_files=(
    "CEOSimulation.xcworkspace/contents.xcworkspacedata"
    "CEOSimulation.xcodeproj/project.pbxproj"
    "Package.swift"
    "CEOSimulation/CEOSimulationApp.swift"
    "CEOSimulation/ContentView.swift"
    "Sources/CEOSimulationCore/Models/Company.swift"
    "Sources/CEOSimulationCore/Controllers/GameController.swift"
)

for file in "${required_files[@]}"; do
    if [ -f "$file" ]; then
        echo "✅ $file"
    else
        echo "❌ Missing: $file"
    fi
done

echo
echo "📁 Project Structure:"
echo "├── CEOSimulation.xcworkspace (Main workspace - open this in Xcode)"
echo "├── CEOSimulation.xcodeproj (Xcode project)"
echo "├── Package.swift (Swift Package Manager)"
echo "├── CEOSimulation/ (Main app target)"
echo "│   ├── Views/ (SwiftUI views)"
echo "│   └── Assets.xcassets (App resources)"
echo "├── Sources/CEOSimulationCore/ (Core business logic)"
echo "│   ├── Models/ (Data models)"
echo "│   ├── Controllers/ (Game controllers)"
echo "│   ├── Managers/ (Business logic)"
echo "│   └── Agents/ (AI department heads)"
echo "└── Tests/ (Unit tests)"

echo
echo "🚀 To open the project:"
echo "1. Double-click CEOSimulation.xcworkspace (NOT the .xcodeproj file)"
echo "2. Select your target device (Mac, iPad, or Simulator)"
echo "3. Click Build and Run"

echo
echo "✨ Project Features:"
echo "• Cross-platform SwiftUI app (macOS 14+ and iPadOS 17+)"
echo "• 5 AI department advisors with unique personalities"
echo "• Dynamic scenario generation with 15+ templates"
echo "• Comprehensive scoring and analytics system"
echo "• Rich quarterly reporting dashboard"
echo "• Educational business simulation gameplay"

if [ -f "CEOSimulation.xcworkspace/contents.xcworkspacedata" ]; then
    echo
    echo "🎯 The project is ready to open in Xcode!"
    echo "Use: CEOSimulation.xcworkspace"
else
    echo
    echo "⚠️  Project validation failed - some files are missing"
fi