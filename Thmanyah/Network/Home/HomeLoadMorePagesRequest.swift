//
//  HomeLoadMorePagesRequest.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/29/25.
//

import Foundation

struct HomeLoadMorePagesRequest: APIRequest {
    typealias ResponseType = HomeResponse
    
    var path: String {
        "https://api-v2-b2sit6oh3a-uc.a.run.app/home_sections?page=\(page)"
    }
    
    let method: HTTPMethod = .get
    let headers: [String : String]? = nil
    let body: Data? = nil
    
    private var page: Int
    
    init(page: Int) {
        self.page = page
    }
    
}
