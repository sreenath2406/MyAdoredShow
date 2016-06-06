//
//  ViewController.swift
//  MyAdoredShow
//
//  Created by Sreeanth Reddy on 04/06/16.
//  Copyright © 2016 Sreeanth Reddy. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var movies = [Entity]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Adored Shows"
        
        tableView.delegate = self
        tableView.dataSource = self

    }

    override func viewDidAppear(animated: Bool) {
        fetchAndSetResults()
        tableView.reloadData()
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("MovieCustomCell") as? MovieCustomCell {
            let movie = movies[indexPath.row]
            cell.configureCell(movie)
            cell.movieImg.layer.cornerRadius = 10.0
            cell.movieImg.clipsToBounds = true
            return cell
        }
        return MovieCustomCell()
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150
    }
    func fetchAndSetResults() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Entity")
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.movies = results as! [Entity]
        } catch let err as NSError {
            print(err.localizedDescription)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let viewController:DetailedMovieVC = segue.destinationViewController as? DetailedMovieVC
        let indexPath = self.tableView.indexPathForSelectedRow()
    }
}

