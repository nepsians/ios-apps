//
//  SecondViewController.swift
//  BeginnerApp
//
//  Created by Nihal on 12/2/20.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchPostData { (posts) in
            for (id, post) in posts.enumerated() {
                if(id == 0){
                    print(post.address)
                }
            }
        }
    }
    
    func fetchPostData(completionHandler: @escaping ([Users]) -> Void){
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!;
        
       
        
        let task = URLSession.shared.dataTask(with: url) { (data,response, error) in
            guard let data = data else {return}
            
            do{
                let postData = try JSONDecoder().decode([Users].self, from: data)
                
                completionHandler(postData)
            }catch{
                let error = error
                print(error.localizedDescription)
            }
        }
        
        task.resume();
    }

}
