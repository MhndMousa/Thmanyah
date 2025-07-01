//
//  WebImage.swift
//  Remu
//
//  Created by Muhannad Alnemer on 10/5/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct OnlineImage: View {
    @State private var didFail: Bool = false
    
    private var url: URL? {
        URL(string: urlString)
    }
    
//    private var indicator: ReturnClosure<IndicatorView> //TODO: Custom loading progress indicator
    
    var urlString: String
    init(urlString: String) {
        self.urlString = urlString
    }
    
    var body: some View {
        ZStack {
            image
            
            if didFail {
                Image(systemName: "x.mark.circle.fill")
            }
        }
        
    }
    
    private var placeholder: some View {
        Image("placeholder")
            .resizable()
            .scaledToFill()
    }
    
    @ViewBuilder
    private var image: some View {
        if let url {
            WebImage(url: url) { image in
                image.resizable()
            } placeholder: {
                placeholder
            }
            .onFailure { error in
                didFail = true
            }
            .indicator(.activity)
        }
    }
}

struct OnlineImage_Previews: PreviewProvider {
    static let urlString = "https://i.scdn.co/image/ab67616d00001e02ff9ca10b55ce82ae553c8228"
    static var previews: some View {
        OnlineImage(urlString: urlString)
    }
}
