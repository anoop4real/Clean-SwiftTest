//
//  AlbumStore.swift
//  CleanSwiftTest
//
//  Created by anoop mohanan on 25/03/17.
//  Copyright © 2017 anoop mohanan. All rights reserved.
//

import Foundation

class AlbumStore{
    
    private var albums:[Album] = []
    
    // We only have one network request at a time, so using a singleton instance of network manager
    private var networkManager = NetworkDataManager.sharedNetworkmanager
    
    func fetchAlbumDetails(completion:@escaping (_ albums:[Album])->Void) -> Void {
        
        let url = createURLFromParameters(parameters: [:], pathparam: nil)
        let urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 2.0)
        
        networkManager.fetchDataWithUrlRequest(urlRequest) {[weak self] (status, anyData) in
            if let albumArray = anyData as? [[String:Any]] {
               
                for dict in albumArray{
                    if let album = Album(albumDict: dict as! [String : String]){
                        self?.albums.append(album)
                    }
                    
                }
                completion((self?.albums)!)
            }
            print(anyData)
        }
    }
    
    private func createURLFromParameters(parameters: [String:Any], pathparam: String?) -> URL {
        
        var components = URLComponents()
        components.scheme = Constants.AlbumAPIDetails.APIScheme
        components.host   = Constants.AlbumAPIDetails.APIHost
        components.path   = Constants.AlbumAPIDetails.APIPath
        if let paramPath = pathparam {
            components.path = Constants.AlbumAPIDetails.APIPath + "\(paramPath)"
        }
        if !parameters.isEmpty {
            components.queryItems = [URLQueryItem]()
            for (key, value) in parameters {
                let queryItem = URLQueryItem(name: key, value: "\(value)")
                components.queryItems!.append(queryItem)
            }
        }
        
        return components.url!
    }
}
