//
//  NewsContentViewController.swift
//  News Headlines App
//
//  Created by Gunveet Singh Dhillon on 2023-08-13.
//

import UIKit

class NewsContentViewController: UIViewController {

    
    @IBOutlet var myTitleNews: UILabel!
    
    @IBOutlet var newImage: UIImageView!
    
    @IBOutlet var myNewsContent: UILabel!
    
    var newsContent: ArticleData = ArticleData(author: "", title: "", urlToImage: "", content: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTitleNews.text = newsContent.title
        if newsContent.urlToImage != nil
        {
            let url = URL(string: newsContent.urlToImage!)
            newImage.downloadImage(from: url!)
            newImage.contentMode = .scaleToFill
        }
        else
        {
            newImage.image = UIImage(named: "empty-image")
        }
        
        myNewsContent.text = newsContent.content

        // Do any additional setup after loading the view.
    }
    

}
