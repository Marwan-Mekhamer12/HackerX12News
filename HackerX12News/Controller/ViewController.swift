//
//  ViewController.swift
//  HackerX12News
//
//  Created by Marwan Mekhamer on 24/04/2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var posts = [Post]()
    
    var web = WebManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        
        // ✅ Fetch and user data
        web.fetchData { posts in
            self.posts = posts
            self.tableView.reloadData()
        }
        
    }


}

// Marwan: - Table View Functions

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let post = posts[indexPath.row]
        cell.textLabel?.text = "\(post.points)- \(post.title)"
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let post = posts[indexPath.row]
        if let url = post.url {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "second") as? HackerData {
                vc.urlstring = url
                navigationController?.pushViewController(vc, animated: true)
            }
        }
        
        
    }
}
