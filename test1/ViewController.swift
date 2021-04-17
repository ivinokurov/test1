//
//  ViewController.swift
//  test1
//
//  Created by И.В. Винокуров 
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var imagesTableView: UITableView!
    private var imagesCount = 100
    private var imageHeight: CGFloat = 150.0
    private var baseURL = URL(string: "http://placehold.it/375x150")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagesCount
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return imageHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageTableViewCell
        
        // Метод изменил на более подходящий задаче
        cell.cellImageView.downloadImage(withBaseURL: baseURL!, cellForRowAt: indexPath.row)
        
        return cell
    }
}

