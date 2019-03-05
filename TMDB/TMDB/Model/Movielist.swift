//
//  Movielist.swift
//  TMDB
//
//  Created by Monali on 05/03/19.
//  Copyright © 2019 Monali. All rights reserved.
//

import Foundation

struct movielist {
    
    /// Id from db
    let id              : Int
    /// Principal title of the Movie
    let title           : String
    /// Average from votes
    let vote_average    : Float
    /// Synopsis of the movie or Tv Show
    let overview        : String
    /// Release date
    let release_date    : String
    /// Image for poster portrait
    let poster_path     : String
    /// Image for landscape
    let backdrop_path   : String
    /// Genre of the item
    let genres          : [Int]
    /// Name of tv show
    let name            : String
    /// Type of the item (tv or movie)
    let media_type      : String
    /// First air date for the Tv Show
    let first_air_date  : String

    
    ///Receive parameters for initializer the struct from api, is called from init JSON
    init(id:Int,title:String,vote_average:Float,overview:String,release_date:String,poster_path:String,backdrop_path:String,genres:[Int],name:String,media_type:String,first_air_date:String){
        self.id            = id
        self.title         = title
        self.vote_average  = vote_average
        self.overview      = overview
        self.release_date  = release_date
        self.poster_path   = poster_path
        self.backdrop_path = backdrop_path
        self.genres        = genres
        self.name          = name
        self.media_type    = media_type
        self.first_air_date = first_air_date
    }
    
    
    
}
