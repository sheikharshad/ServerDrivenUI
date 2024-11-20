# ServerDrivenUI

A lightweight, flexible framework for implementing Server-Driven UI in iOS applications using SwiftUI.

## Overview

ServerDrivenUI is a framework that allows you to dynamically create and update your iOS app's user interface based on JSON configurations received from a server. This approach provides several benefits:

- Dynamic UI updates without app releases
- Consistent UI across platforms
- Reduced maintenance overhead

## Architecture

The framework follows SOLID principles and is built with a modular architecture:

### Core Components

```
ServerDrivenUI/
├── Models/
│   ├── Screen.swift        # Screen and component models
│   └── Event.swift         # Event handling models
│   └── Types.swift         # Event Types
├── Components/
│   ├── FormComponent       # Form container
│   ├── ContainerComponent  # Generic container
│   ├── TextComponent       # Text display
│   ├── InputComponent      # User input
│   └── ButtonComponent     # Action buttons
│   └── DefaultComponentFactory    # Component Factory
│   └── ComponentType      # Component Type
├── Services/
│   └── EventHandler       # Event processing
├── Protocols/
│   └── ViewFactory        # Component creation
├── Themes/
│   └── ThemeConstants     # Theme Constants
│   └── ViewModifiers      # ViewModifiers
└── Views/
    └── DynamicScreenView  # Main view renderer
```

### Design Patterns Used
- Factory Pattern: For dynamic component creation
- Dependency Injection: For loose coupling
- Observer Pattern: For event handling
- Protocol-Oriented Programming: For flexibility and testability

## Installation

### CocoaPods

```ruby
pod 'ServerDrivenUI', :git => 'https://github.com/sheikharshad/ServerDrivenUI.git'
```

## Usage

### Basic Implementation

1. Initialize the framework:
```swift
import ServerDrivenUI

class YourViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ServerDrivenUIMain.shared.initialize { eventType, data in
            // Handle events
            switch eventType {
            case "SUBMIT":
                print("Form submitted:", data)
            default:
                break
            }
        }
    }
}
```

2. Create UI from JSON:
```swift
// Using UIKit
if let screenVC = ServerDrivenUIMain.shared.createUIViewController(from: jsonString) {
    addChild(screenVC)
    view.addSubview(screenVC.view)
    screenVC.didMove(toParent: self)
}

// Using SwiftUI
struct ContentView: View {
    var body: some View {
        if let dynamicView = ServerDrivenUIMain.shared.createView(from: jsonString) {
            dynamicView
        }
    }
}
```

### JSON Configuration

The framework expects JSON in this format:
```json
{
    "screens": [{
        "id": "screen-id",
        "components": [{
            "componentType": "Form",
            "components": [{
                "componentType": "Input",
                "name": "fieldName",
                "label": "Field Label"
            }]
        }]
    }],
    "events": [{
        "type": "SUBMIT",
        "actions": [{
            "type": "log",
            "args": [{
                "fieldName": "{{fieldName}}"
            }]
        }]
    }]
}
```

## Component Types

- **Form**: Container for form elements
- **Container**: Generic container for components
- **Text**: Text display
- **Input**: User input field
- **Button**: Action button

## Event Handling

Events are defined in JSON and processed through the EventHandler:
- Form submission
- Button actions
- Input validation

## Validation

Built-in validation support:
- Required fields
- Custom validation rules

## Example App

There is a seperate Example app. for a working example of implementation. Refer below URL for implementation.
https://github.com/sheikharshad/ExampleServerDrivenUI

## Requirements

- iOS 15.0+
- Swift 5.0+
- Xcode 15.3+

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
