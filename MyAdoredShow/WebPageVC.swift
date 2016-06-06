//
//  WebPageVC.swift
//  MyAdoredShow
//
//  Created by primesoft on 06/06/16.
//  Copyright © 2016 Sreeanth Reddy. All rights reserved.
//

import UIKit

class WebPageVC: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    @IBOutlet weak var pageTitleView: UINavigationItem!
    @IBOutlet weak var navBar: UINavigationBar!
    var pageTitle: String!
    var pageURL: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = pageTitle
        pageTitleView.title = pageTitle
        webView.loadRequest(NSURLRequest(URL: NSURL(string: pageURL)!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cancelWebPage(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
