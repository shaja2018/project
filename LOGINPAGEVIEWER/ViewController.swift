//
//  ViewController.swift
//  LOGINPAGEVIEWER
//
//  Created by Shaja on 11/07/24.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    var context = (UIApplication.shared.delegate as! AppDelegate)  .persistentContainer.viewContext
    @IBOutlet weak var USER1: UITextField!
    
    @IBOutlet weak var PASS1: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func SIGN(_ sender: Any) {
        
        let valu = NSEntityDescription.insertNewObject(forEntityName: "Signuppage", into: context)
        
        valu.setValue(self.USER1.text, forKey: "username")
        valu.setValue(self.PASS1.text, forKey: "password")
        do{
            try context.save()
            self.USER1.text=""
            self.PASS1.text=""
            
        }
        catch
        {
            print("error")
        
        }
        let storybrd=UIStoryboard(name: "Main", bundle: nil)
        let new = storybrd.instantiateViewController(identifier: "LOG1")as!
        LOGIN1ViewController
        self.navigationController?.pushViewController(new, animated: true)
        
    }
    

}

