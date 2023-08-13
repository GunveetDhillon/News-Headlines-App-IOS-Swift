//
//  ViewController.swift
//  News Headlines App
//
//  Created by Gunveet Singh Dhillon on 2023-08-13.
//

import UIKit

class ViewController: UIViewController {

    var articlesList = [ArticleData]()

    @IBOutlet var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func fetchData()
    {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=39700c8af12a473d8b3f7b4f31a1acfd")
        
        let dataTask = URLSession.shared.dataTask(with: url!, completionHandler: {( data, response, error ) in
            guard let data = data, error == nil else
            {
                print("Error Occuered While Accessing Data with URL")
                return
            }
            var newsFullList:NewsData?
            do
            {
                newsFullList = try JSONDecoder().decode(NewsData.self, from: data)
            }
            catch
            {
                print("Error Occured While Decoding JSON into Swift Structure \(error)")
            }
            self.articlesList = newsFullList!.articles
            DispatchQueue.main.async {
                self.myTableView.reloadData()
                }
            })
        
            dataTask.resume()
    }

}

extension UIImageView
{
    func downloadImage(from url:URL)
    {
        contentMode = .scaleToFill
        let dataTask = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
                  let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                  let data = data, error == nil,
                  let image = UIImage(data: data)
                    else
            {
                return
            }
            DispatchQueue.main.async {
                self.image = image
            }
                  
        })
        dataTask.resume()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        if articlesList[indexPath.row].author != nil
        {
            cell.myLabel2.text = "Author: \(articlesList[indexPath.row].author!)"
        }
        else{
            cell.myLabel2.text = "No Author Available"
        }
        cell.myLabel1.text = articlesList[indexPath.row].title
        if articlesList[indexPath.row].urlToImage != nil
        {
            let url = URL(string: articlesList[indexPath.row].urlToImage!)
            cell.myImageView.downloadImage(from: url!)
            cell.myImageView.contentMode = .scaleToFill
        }
        else
        {
            cell.myImageView.image = UIImage(named: "empty-image")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlesList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "NewsContentHome") as? NewsContentViewController
        vc?.newsContent = articlesList[indexPath.row]
        navigationController?.pushViewController(vc!, animated: true)
    }
        
}

