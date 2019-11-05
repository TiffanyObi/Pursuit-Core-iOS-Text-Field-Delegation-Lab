# Text Field Delegation Lab

![textTwistGif](textTwistGif.gif)

Build a simplified version of Text Twist.

When the VC loads, it should present a scrambled six letter word.  Use the `Word` struct in the project to get a random word.

Typing in the text field should remove letters from the label as they are added to the text field.

When the user taps "return", if the word has been unscrambled correctly, the screen should turn green and a button should appear that resets the VC to a different random word.

## Tips:

The following code will show you what the new string will be in the `textField:shouldChangeCharactersInRange:replacementString:` delegate method
`

```swift
// https://stackoverflow.com/questions/25138339/nsrange-to-rangestring-index


func textField(_ textField: UITextField,
               shouldChangeCharactersIn range: NSRange,
               replacementString string: String) -> Bool {

    if let oldString = textField.text {
        let newString = oldString.replacingCharacters(in: Range(range, in: oldString)!,
                                                      with: string)
        // ...
    }
    // ...
}
```
