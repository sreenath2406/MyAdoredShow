//
//  MovieCustomCell.swift
//  MyAdoredShow
//
//  Created by Sreeanth Reddy on 04/06/16.
//  Copyright © 2016 Sreeanth Reddy. All rights reserved.
//

import UIKit

class MovieCustomCell: UITableViewCell {

    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescr: UILabel!
    @IBOutlet weak var movieIMDBLink: UILabel!
    
    func configureCell(movie: Entity) {
        movieImg.image = movie.getMovieImageIMDB()
        movieTitle.text = movie.movieName
        movieDescr.text = movie.movieDesc
        movieIMDBLink.text = movie.movieIMDBLink
    }
    
}
