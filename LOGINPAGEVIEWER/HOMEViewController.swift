//
//  HOMEViewController.swift
//  LOGINPAGEVIEWER
//
//  Created by Shaja on 11/07/24.
//

import UIKit

class HOMEViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var jsondata = NSArray()
    var dict = NSDictionary()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsondata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tcell = tableView.dequeueReusableCell(withIdentifier: "HOM12")as! HOME1TableViewCell
        self.dict = self.jsondata[indexPath.row] as! NSDictionary
        tcell.name.text = String(describing: self.dict["author"]!)
        let imgurl=String(describing: self.dict["download_url"]!)
        let urlimg=URL(string: imgurl)
        let dataimg=try?Data(contentsOf: urlimg!)
        tcell.imge.image=UIImage(data: dataimg!)
        
        return tcell
    }
      func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }

    @IBOutlet weak var imgviw: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let urlstr = URL(string:"https://picsum.photos/v2/list")
        let urlreq = URLRequest(url:urlstr!)
        let task = URLSession.shared.dataTask(with: urlreq)
        {
            (data,request,error)in
            
            if let mydata=data
            {
                print("mydata",mydata)
                do{
                    self.jsondata = try JSONSerialization.jsonObject(with: mydata, options: [])as! NSArray
                    print("jsondata",self.jsondata)
                    DispatchQueue.main.async{
                        self.imgviw.reloadData()
                    }
                
            }
                catch{
                    print("error",error.localizedDescription)
                }
        }
    }
    
        task.resume()

}
}
