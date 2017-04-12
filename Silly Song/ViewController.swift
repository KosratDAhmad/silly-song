//
//  ViewController.swift
//  Silly Song
//
//  Created by Kosrat D. Ahmad on 4/12/17.
//  Copyright © 2017 Kosrat D. Ahmad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lyricsView: UITextView!
    @IBOutlet weak var nameField: UITextField!
    
    let bananaFanaTemplate = [
        "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
        "Banana Fana Fo F<SHORT_NAME>",
        "Me My Mo M<SHORT_NAME>",
        "<FULL_NAME>"].joined(separator: "\n")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func reset(_ sender: Any) {
        
        nameField.text = String()
        lyricsView.text = String()
    }
    
    @IBAction func displayLayrics(_ sender: Any) {
        
        var name:String = nameField.text!
        if name.characters.count != 0 {
            let layric = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: name)
            lyricsView.text = layric
        }
    }
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ nameField: UITextField) -> Bool {
        nameField.resignFirstResponder()
        return false
    }
}

func shortenNameForName(name:String) -> String {
    
    let lowercaseName = name.lowercased()
    let vowelSet = CharacterSet(charactersIn: "ouiae")
    
    let range = lowercaseName.rangeOfCharacter(from: vowelSet)
    return lowercaseName.substring(from: (range!.lowerBound))
}

func lyricsForName(lyricsTemplate: String, fullName:String) -> String {
    
    let shortName = shortenNameForName(name: fullName)
    
    let lyrics = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    
    return lyrics
}
