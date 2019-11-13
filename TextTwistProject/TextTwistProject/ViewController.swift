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
    
    
    var getRandomWord = Word.getRandomWord().scrambled
    
    
    //  var randomWordArray:[Character] = []
    
    // var emptyArr:[Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        inputTextField.delegate = self
        nameLabel.text = "Try To Unscramble The Word!"
        displayRandomWord.text = getRandomWord
        
        //  print(randomWordArray)
        
        
    }
    
    
}

extension ViewController: UITextFieldDelegate {
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing")
        
        return true
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if displayRandomWord.text?.contains(string) ?? false {
            
            
            
            displayRandomWord.text?.remove(at: (displayRandomWord.text?.firstIndex(of: Character(string)))!)
            print(Word.getRandomWord().unscrambled)
            
        } else if string == "" {
            displayRandomWord.text?.insert(textField.text?.last ?? "a", at: displayRandomWord.text!.endIndex)
        } else {
            
            return false}
        
        
        return true
        
        
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if inputTextField.text == Word.getRandomWord().unscrambled {
            
            nameLabel.text = "You Win!"
        }
        return true
        
    }
    
    
    
}



