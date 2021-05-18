//
//  KeyboardViewController.swift
//  keyboardTest2
//
//  Created by 조주혁 on 2021/05/02.
//

import UIKit

var proxy: UITextDocumentProxy!

class KeyboardViewController: UIInputViewController {

    var nextKeyboardButton = UIButton()
    var aButton = UIButton()
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        print("3")
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("0")
        
        proxy = textDocumentProxy as UITextDocumentProxy
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        self.aButton = UIButton(type: .system)
        
        self.aButton.setTitle("a", for: .normal)
//        self.nextKeyboardButton.setImage(.init(named: "switchKeyboard"), for: .normal)
//        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.setTitle("next", for: .normal)
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        self.aButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        self.aButton.addTarget(self, action: #selector(text2), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        self.view.addSubview(self.aButton)
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.aButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.aButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
       
    }
    
    override func viewWillLayoutSubviews() {
        print("2")
        super.viewWillLayoutSubviews()
    }
    
    
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
        print("1")
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        print("5")
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }
    
    @IBAction func text2(sender: UIButton) {
        print(sender.titleLabel?.text)
    }

}
