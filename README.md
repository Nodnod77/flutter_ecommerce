# flutter_ecommerce

## Assignment Questions

### 1. Explain what are stateless widgets and stateful widgets, and explain the difference between them

In Flutter, widgets are the building blocks of the user interface, and they fall into two main types:

- **Stateless Widgets**: These are immutable widgets, meaning that their state cannot change once created. Stateless widgets are ideal for static content or when the UI does not need to react to user interactions or dynamic changes. Examples include Text, Icon, and Image.

- **Stateful Widgets**: These widgets maintain a mutable state that can change during the widget's lifecycle. Stateful widgets are used when the UI must update dynamically based on user input or other variables. Examples include Checkbox, TextField, and any widget that involves interactivity or animations.

**Difference**: The key difference lies in whether the widget can hold and change its state:

- **Stateless widgets**: No state change, static rendering.

- **Stateful widgets**: Maintains internal state, re-renders upon state changes.

## 2. Mention the widgets that you have used for this project and its uses

Here are some of the widgets used in this project and their purposes:

- **Container**: Used to create rectangular visual elements with customizable properties like padding, margin, and color.
- **Text**: Displays static text in the interface.
- **TextField**: Collects user input in the form of text.
- **ElevatedButton**: Renders a button that the user can tap to trigger actions.
- **ListView**: Enables vertical or horizontal scrolling of child widgets, often used to display lists of data.
- **Icon**: Displays an icon to enhance the UI.
- **Scaffold**: Provides a basic structure, including an AppBar and body, for organizing the app layout.

Each of these widgets contributes to the app’s interface and functionality, helping structure and present the content interactively.

## 3. What is the use-case for setState()? Explain the variable that can be affected by setState()

setState() is a method used in stateful widgets to update the UI in response to state changes. When setState() is called, Flutter marks the widget tree as dirty, triggering a rebuild. This method is commonly used in cases like user interactions, animations, or any situation where the UI needs to react to changes in the state.

Example variable that could be affected by setState():

- **Counter variable** in a counter app, where each button press increments the counter and updates the displayed number.
- **Boolean variables** controlling visibility or toggling states, like showing or hiding a widget when a button is pressed.

## 4. Explain the difference between const and final keyword.

- **const**: Declares compile-time constants. The value of a const variable must be assigned during compilation and cannot change at runtime. Constants declared with const are deeply immutable.

- **final**: Declares a runtime constant. The value is assigned only once and cannot be reassigned, but it can be determined at runtime. final variables are used for values that might depend on runtime input but should stay constant afterward.
