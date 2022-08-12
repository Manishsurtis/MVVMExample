//
//  UserViewModel.swift
//  JsonExample
//
//  Created by Manish on 11/08/22.
//

import Foundation

class UserViewModel{
    private var sourceURL = URL(string:APIList.BaseUrl)
  
    func getAllUserDetails(completion: @escaping ([UserModel]) -> Void) {
      
        URLSession.shared.dataTask(with: sourceURL!) { data, response, error in
            do{
                if error != nil{
                 
                }else{
                    var jsonData = [UserModel]()
                    jsonData  = try JSONDecoder().decode([UserModel].self, from: data!)
                    completion(jsonData)
                    return
                }
                
            }catch{
                print(error.localizedDescription)
            }
            
        }.resume()
    }
   
}
