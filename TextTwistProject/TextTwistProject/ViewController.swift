//
//  ViewController.swift
//  TextTwistProject
//
//  Created by Benjamin Stone on 11/4/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayRandomWord: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    
    var getRandomWord = Word.getRandomWord()
    
    
    //  var randomWordArray:[Character] = []
    
    var emptyStr = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        inputTextField.delegate = self
        nameLabel.text = "Try To Unscramble The Word!"
        displayRandomWord.text = getRandomWord.scrambled
        
        //  print(randomWordArray)
        
        
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        displayRandomWord.text = Word.getRandomWord().scrambled
        nameLabel.text = "Try To Unscramble The Word!"
        inputTextField.text = ""
    }
    
    func getCorrectWord () {
        if inputTextField.text == getRandomWord.unscrambled {
            
             nameLabel.text = "You Win! Restart The Game"
        } else { nameLabel.text = "Sorry. Wrong Answer! Try Again!"}
    }
}

extension ViewController: UITextFieldDelegate {
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing")
        
        return true
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if displayRandomWord.text?.contains(string) ?? false {
            
            
            emptyStr.append(string)
            
            displayRandomWord.text?.remove(at: (displayRandomWord.text?.firstIndex(of: Character(string)))!)
            
           print(emptyStr)
            
        } else if string == "" {
            
            emptyStr.removeLast()
            
            displayRandomWord.text?.insert(textField.text?.last ?? "a", at: displayRandomWord.text!.endIndex)
            print(emptyStr)
            
        } else {
            
            return false}
        
        
        return true
        
        
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        getCorrectWord()
        
        return true
        
        }
        
    
}


