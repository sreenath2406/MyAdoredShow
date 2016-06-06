//
//  DetailedMovieVC.swift
//  MyAdoredShow
//
//  Created by Sreeanth Reddy on 05/06/16.
//  Copyright © 2016 Sreeanth Reddy. All rights reserved.
//

import UIKit

class DetailedMovieVC: UIViewController, UIGestureRecognizerDelegate{

    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieDesc: UILabel!
    @IBOutlet weak var movieIMDBPlot: UILabel!
    @IBOutlet weak var movieIMDBLink: UILabel!
    
    var mvTitle:String!
    var mvDesc:String!
    var mvIMDBPlot: String!
    var mvIMDBLink: String!
    var mvImage: UIImage!
    
    var tapGuesture: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieDesc.text = mvDesc
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: mvIMDBLink)
        attributedString.addAttribute(NSUnderlineStyleAttributeName, value: 1, range: NSMakeRange(0, attributedString.length))
        attributedString .addAttribute(NSUnderlineColorAttributeName, value: UIColor.init(red: 242/255, green: 77/255, blue: 44/255, alpha: 1.0), range:NSMakeRange(0, attributedString.length))
        tapGuesture = UITapGestureRecognizer(target: self, action: "openBrowser:")
        tapGuesture.delegate = self
        movieIMDBLink.addGestureRecognizer(tapGuesture)
        movieIMDBLink.attributedText = attributedString
        movieIMDBPlot.text = mvIMDBPlot
        movieImg.image = mvImage
        
        self.title = mvTitle
        

        
    }
    func openBrowser(sender: AnyObject!) {
        performSegueWithIdentifier("WebPageVC", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "WebPageVC") {
            let webView = segue.destinationViewController as? WebPageVC
            webView?.pageTitle = mvTitle
            webView?.pageURL = mvIMDBLink
            
        }
    }
    

}
