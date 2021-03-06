//
//  valueTableViewController.swift
//  Jeopardy
//
//  Created by TARUN GUDELA on 6/8/18.
//  Copyright © 2018 Mayago. All rights reserved.
//

import UIKit

class valueTableViewController: UITableViewController {

    var valueArray = [Int]()
    var catName = ""
    var finalArray = [[String : AnyObject]]()
    
    var category = "sfasfsaf"
    var answer = "asfasd"
    var question = "asdfasdfsa"
    var value22 = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        print(catName)
        
        let catArray = Singleton.sharedInstance.AllcategoryObject
        
        
        for element in catArray{
            
            print(element["category"]!["title"] as! String)
            print(element["value"])
        
            
            if element["category"]!["title"] as! String == catName{
        
                finalArray.append(element)
              var elementValue = nullToNil(value: element["value"])
                
                
                
                
                let value: Int? = elementValue != nil ? Int(truncating: elementValue as! NSNumber ) : 50
                
                valueArray.append(value!)
//                valueArray.append(Int(truncating: element["value"] != ? element["value"] as! NSNumber: 0 ) )
                
                
            }
            
            
            
            
        }
        
        print( valueArray)
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func nullToNil(value : AnyObject?) -> AnyObject? {
        if value is NSNull {
            return nil
        } else {
            return value
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return valueArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = String(valueArray[indexPath.row])

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let value2 = valueArray[indexPath.row]
        print(value2)
        for element in finalArray{
            var elementValue = nullToNil(value: element["value"])
            let value: Int? = elementValue != nil ? Int(truncating: elementValue as! NSNumber ) : 50
            if value2 == value {
                category = catName
                answer = element["answer"] as! String
                question = element["question"] as! String
                value22 = value!
                
                
            }
            
        }
       performSegue(withIdentifier: "values-questions", sender: self)
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "values-questions"
        {
            let vc: QuestionsViewController = segue.destination as! QuestionsViewController
            
            vc.category = category
            vc.value = value22
            vc.question = question
            vc.answer = answer
        }
    }
    

}
