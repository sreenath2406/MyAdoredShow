//
//  AddMovieVC.swift
//  MyAdoredShow
//
//  Created by Sreeanth Reddy on 04/06/16.
//  Copyright © 2016 Sreeanth Reddy. All rights reserved.
//

import UIKit
import CoreData

class AddMovieVC: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieTitle: UITextField!
    @IBOutlet weak var movieDesc: UITextField!
    @IBOutlet weak var movieIMDBPlot: UITextField!
    @IBOutlet weak var movieIMDBLink: UITextField!
    @IBOutlet weak var addMovie: UIButton!
    @IBOutlet weak var addImage: UIButton!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addMovie.layer.cornerRadius = 12.0
        addMovie.clipsToBounds = true
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        self.title = "Add Movie"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addMovie(sender: AnyObject!) {
        if let title = movieTitle.text where title != ""{
            let description = movieDesc.text
            let imdbPlot  = movieIMDBPlot.text
            let imdbLink = movieIMDBLink.text
            
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context  = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Entity", inManagedObjectContext: context)!
            
            let movie = Entity(entity: entity, insertIntoManagedObjectContext: context)
            movie.movieName = title
            movie.movieDesc = description
            movie.movieIMDBPlot = imdbPlot
            movie.movieIMDBLink = imdbLink
            movie.setMovieImageIMDB(movieImg.image!)
            
            context.insertObject(movie)
            
            do {
               try context.save()
            } catch {
                print("Errorrrrr...!!!!!")
            }
            
             self.navigationController?.popViewControllerAnimated(true)
        }
    }

    @IBAction func addImage(sender: AnyObject!) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        movieImg.image = image
    }
   
}
