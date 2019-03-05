//
//  ViewController.swift
//  TMDB
//
//  Created by Monali on 05/03/19.
//  Copyright © 2019 Monali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblMovieList: UITableView!
    var arrmovie : Array<Any> = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblMovieList.dataSource = nil
        self.tblMovieList.delegate = nil
        callapi()
        // Do any additional setup after loading the view, typically from a nib.
    }


    func callapi() {
    
        let strUrl = AppConstants.baseUrl
        
        let webserviceManger = WebserviceManager()
        
        webserviceManger.getMovieList(url1: strUrl) { (result, error) in
            if let result = result {
                print("success: \(result)")
            } else if let error = error {
                print("error: \(error.localizedDescription)")
            }
            self.arrmovie = result!["results"] as! Array<Any>
            guard self.arrmovie != nil else {
                return
            }
            DispatchQueue.main.async {

            self.tblMovieList.delegate = self
            self.tblMovieList.dataSource = self
            self.tblMovieList.reloadData()
            }
            
        }    }
    
    
    
}

extension ViewController :UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.arrmovie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListTableViewCell", for: indexPath) as! MovieListTableViewCell
        
        let dict1 = self.arrmovie[indexPath.row] as! [String :Any]
        cell.lblMovieName.text = dict1["title"] as? String
        
        let strimg = dict1["poster_path"] as! String
        let strimgurl = AppConstants.domainImage + strimg
        let url = URL(string: strimgurl)
        let data = try? Data(contentsOf: url!)
        
        if let imageData = data {
            cell.imhMovieLogo.image = UIImage(data: imageData)
        }
        return cell
    }
}

