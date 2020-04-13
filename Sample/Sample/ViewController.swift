//
//  ViewController.swift
//  Sample
//
//  Created by commeasure on 12/04/20.
//  Copyright © 2020 SarveshSingh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var txtfldSearch: UITextField!
    
    var isExpanded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.setTextField(setExpand: isExpanded)
        isExpanded = true
    }

    @IBAction func btnSearchAction(_ sender: UIButton) {
        
        if isExpanded{
            isExpanded = false
            self.setTextField(setExpand: true)
        }else{
            isExpanded = true
            self.setTextField(setExpand: false)
        }
        
    }
    
    
    
    func setTextField(setExpand:Bool = false){
        
        self.txtfldSearch.delegate = self
        self.txtfldSearch.borderStyle = UITextField.BorderStyle.none
        self.txtfldSearch.translatesAutoresizingMaskIntoConstraints = true
        let bottomLine = CALayer()
        bottomLine.backgroundColor = UIColor.red.cgColor
        UIView.animate(withDuration: 0.5) {
            if setExpand{
                self.txtfldSearch.frame = CGRect(x: self.viewContainer.frame.origin.x + 8, y: self.txtfldSearch.frame.origin.y, width: (self.btnSearch.frame.origin.x - (self.viewContainer.frame.origin.x + 16)), height: self.txtfldSearch.frame.size.height)
                bottomLine.frame = CGRect(x: 0.0, y: self.txtfldSearch.frame.size.height-2, width: self.txtfldSearch.frame.size.width, height: 2.0)
            }
            else{
                self.txtfldSearch.frame = CGRect(x: self.btnSearch.frame.origin.x - 8, y: self.txtfldSearch.frame.origin.y, width: 0, height:  self.txtfldSearch.frame.size.height)
                bottomLine.frame = CGRect(x: 0.0, y: self.txtfldSearch.frame.size.height-2, width: self.txtfldSearch.frame.size.width, height: 2.0)
            }
        }
        self.txtfldSearch.layer.addSublayer(bottomLine)
    }
}


extension ViewController : UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
}

