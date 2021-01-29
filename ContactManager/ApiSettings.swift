//
//  ApiSettings.swift
//  ContactManager
//
//  Created by MacBook Pro on 24/01/2021.
//

import Foundation

struct ApiSettings
{

    let baseUrl:String = "http://192.168.43.14:8000/api/";


    func setBaseUrl(_ addedUrl:String) ->String
    {
        let url = self.baseUrl + addedUrl;
        return url;
    }
}
