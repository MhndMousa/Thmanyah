//
//  HomeRequest.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//

import Foundation

struct HomeRequest: APIRequest {
    typealias ResponseType = HomeResponse
    
    let path: String = "https://api-v2-b2sit6oh3a-uc.a.run.app/home_sections"
    let method: HTTPMethod = .get
    var headers: [String : String]?
    var body: Data?
}
