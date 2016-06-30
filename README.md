# It's Raining Confetti!

![Raining Confetti](https://s3.amazonaws.com/learn-verified/raining-confetti.gif)

## Objectives

1. Install a third party framework using the Cocoapods Dependency Manager
2. Integrate the pod into an existing project
3. Connect user interface controls to the pod

## Instructions

### 1. Add the [SAConfettiView](https://cocoapods.org/pods/SAConfettiView) pod
1. Navigate to your project folder in Terminal and enter `pod init` (This will create an empty Podfile in your project folder)
2. Open your Podfile. It should look similar to this:
 ```
# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'

target 'ItsRainingConfetti' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks! // necessary for Swift

  # Pods for ItsRainingConfetti

end
 ```
 The second line specifies the platform and version supported. The target code block is defined to allow you to add pods to your project.
3. Add `pod "SAConfettiView"` inside your target block.
4. Save changes to your Podfile and close it.
5. Navigate to your project folder in Terminal and run `pod install`.
6. Close your Xcode project and reopen your new .xcworkspace file. Use this file to open your project from now on.


### 2. Add a `SAConfettiView` as a subview in your view controller 

1. Add `import SAConfettiView` inside your view controller file under `import UIKit`
2. Build `⌘+B` the project so that Xcode recognizes the newly added framework. 
3. Build and run `⌘+R` the project to see what it looks like so far. You'll notice some user interface controls. More on those in a moment.
4. Add a property to your view controller class of type `SAConfettiView` called `confettiView`.
5. Assign a value to your property in the `viewDidLoad()` function of your view controller.
 -Read the pod's documentation to see how you can create a SAConfettiView and assign it to your property.
6. Add the confetti view as a subview of the view controller's view
 -*Hint*: Usually you would just use `addSubview(_:)` but your confetti view needs to be below the user interface controls in order for the user to interact with them. Is there another view hierarchy function that uses the index of the subviews property array? Could you use that function to add the confetti view as the first object in the array?

### 3. Wire up the user interface controls

1. Go to the main storyboard to check out your view controller. You'll notice a button, a slider, a segmented control and two labels. Most of the controls are nested inside stackviews. 
2. Create IBOutlets (Control+Drag) in your view controller class for your button and your slider.
3. Create IBActions (Control+Drag) in your view controller class for your button, your slider, and your segmented control. 
 ![IBAction Settings](https://s3.amazonaws.com/learn-verified/raining-confetti-lab-actions.png)
 -Update `AnyObject` to the corresponding class name.
 ```
    @IBAction func confettiButtonTouched(sender: UIButton) {
    }
    
    @IBAction func confettiIntensityChanged(sender: UISlider) {
    }
    
    @IBAction func confettiTypeChanged(sender: UISegmentedControl) {
    }
 ```
4. Add the following block of code to your `viewDidLoad()` to make your button round with a border.
  ```
  // Set up button properties
  let appleBlueColor = UIColor.init(red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0)
  self.confettiButton.backgroundColor = appleBlueColor.colorWithAlphaComponent(0.1)
  self.confettiButton.layer.cornerRadius = self.confettiButton.frame.size.width / 2
  self.confettiButton.layer.borderWidth = 1
  self.confettiButton.layer.borderColor = appleBlueColor.CGColor
  ```

### 4. Define your button IBAction function

 -This function should start and stop the confetti using the properties available for the `SAConfettiView`.
 -*Hint*: Does the pod's documentation mention anything about starting and stopping the confetti, as well as checking a view's status? Don't be afraid to run often and see if it's working.

### 5. Define your slider IBAction function

 -This function should change the intensity of the confetti effect. 
 -*Hint*: Does the pod's documentation mention anything about changing the value of the intensity? Does your slider have a value property you could use to get the current value?
 -*Hint*: If the slider is moved while the confetti is falling, will the new intensity value be reflected? What functions of `SAConfettiView` might help with this?

 ### 6. Define your segmented control IBAction function

  -This function should change the type of the confetti that falls.
  -*Hint*: Does the pod's documention mention anything about changing the type of confetti?
  -*Hint*: `UISegmentedControl` has a `.selectedSegmentedIndex` property that indicates which segment is currently selected. Try using this with a switch statement to swap out different types. 
  -*Hint*: If the type is changed while the confetti is falling, will the new type be reflected? What functions of `SAConfettiView` might help with this?

### 7. Celebrate!
 ![IBAction Settings](https://s3.amazonaws.com/learn-verified/raining-confetti-john-oliver.gif)