//
//  LOGIN1ViewController.swift
//  LOGINPAGEVIEWER
//
//  Created by Shaja on 11/07/24.
//

import UIKit
import  CoreData

class LOGIN1ViewController: UIViewController {

    @IBOutlet weak var PAS1: UITextField!
    @IBOutlet weak var USE1: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    @IBAction func login(_ sender: Any) {
        
        CheckForUserNameAndPasswordMatch(username: USE1.text!, password: PAS1.text!)
        let storybrd=UIStoryboard(name: "Main", bundle: nil)
        let new = storybrd.instantiateViewController(identifier: "HOM1")as!
        HOMEViewController
        self.navigationController?.pushViewController(new, animated: true)
    }
    
    
    func CheckForUserNameAndPasswordMatch( username: String, password : String)
    {
        let app = UIApplication.shared.delegate as! AppDelegate

        let context = app.persistentContainer.viewContext

        let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Signuppage")

        let predicate = NSPredicate(format: "username ==%@", username)

        fetchrequest.predicate = predicate
        do
        {
           let result = try context.fetch(fetchrequest) as NSArray

            if result.count>0
            {
                let objectentity = result.firstObject as! Signuppage

                if objectentity.username == username && objectentity.password == password
                {
                    print("Login Succesfully")
                }
                else
                {
                    print("Wrong username or password !!!")
                }
            }
        }

        catch
        {
            let fetch_error = error as NSError
            print("error", fetch_error.localizedDescription)
        }

    }

    

}
