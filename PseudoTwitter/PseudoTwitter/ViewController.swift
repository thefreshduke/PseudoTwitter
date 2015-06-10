//
//  TableViewController.swift
//  PseudoTwitter
//
//  Created by Scotty Shaw on 6/10/15.
//  Copyright (c) 2015 ___sks6___. All rights reserved.
//

import UIKit

struct Character {
    let name : String
    let occupation : String
    let age : Int
    let status : String
}

class ViewController: UITableViewController {
    
    var characters = [
        Character(name: "Ahsoka Tano", occupation: "Jedi", age: 17, status: "MIA"),
        Character(name: "Kyle Broflovski", occupation: "Jew", age: 9, status: "ALIVE")
    ]
    
    override func viewDidLoad () {
        super.viewDidLoad()
        self.refreshControl?.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func refresh (refreshControl : UIRefreshControl) {
        let newCharacter = [
            Character(name: "Butters Stotch", occupation: "Meheecan", age: 9, status: "MIA"),
            Character(name: "Eric Cartman", occupation: "Student", age: 9, status: "ALIVE"),
            Character(name: "Kenny McCormick", occupation: "Dead", age: 9, status: "KIA"),
            Character(name: "Stan Marsh", occupation: "Student", age: 9, status: "ALIVE"),
            Character(name: "Captain America", occupation: "Captain", age: 93, status: "OLD"),
            Character(name: "Speedy Gonzalez", occupation: "Mexican", age: 20, status: "FAST"),
        ]
        
        var randInt : Int = Int(arc4random_uniform(6))
        characters.append(newCharacter[randInt])
        
        // order by youngest to oldest, followed by alphabetical order of name
        characters.sort() { $0.age == $1.age ? ($0.name < $1.name) : ($0.age < $1.age)}
        
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    override func tableView (tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    override func tableView (tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        var name : String = String(characters[indexPath.row].name)
        var occupation : String = String(characters[indexPath.row].occupation)
        var age : String = String(characters[indexPath.row].age)
        var status : String = String(characters[indexPath.row].status)
        cell.textLabel?.text = "\(name), \(age)"
        cell.detailTextLabel?.text = "\(occupation), \(status)"
        return cell
    }
}