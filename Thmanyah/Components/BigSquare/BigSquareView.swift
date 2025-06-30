//
//  Square.swift
//  Thmanyah
//
//  Created by Muhannad Alnemer on 6/30/25.
//



import SwiftUI

struct BigSquareView<ViewModel> : View where ViewModel: BigSquareViewModelProtocol {
    private let viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        content
    }
    
    private var coverImage : some View {
        OnlineImage(urlString: viewModel.imageUrlString)
            .scaledToFill()
            .frame(width: 300, height: 200)
            .cornerRadius(20)
            
    }
    
    private var title: some View {
        Text(viewModel.title)
            .foregroundStyle(Color.textColor)
            .multilineTextAlignment(.leading)
            .font(.heading.weight(.black))
        
    }
    private var subtitle: some View {
        Text(viewModel.subtitle)
            .foregroundStyle(Color.textColor)
            
            .font(.caption)
        
    }
    private var content: some View {
        ZStack(alignment: .bottomLeading){
            coverImage
            VStack(alignment: .leading) {
                Spacer()
                title
                subtitle
            }
            .padding()
        }
        .frame(width: 300, height: 200)
        .onTapGesture {
            viewModel.onClick()
        }
    }
}


#Preview {
    
    class Fixture: BigSquareViewModelProtocol {
        var title: String = .random()
        var subtitle: String = .random(50)
        var imageUrlString: String = Mock.imageUrl
        func onClick() {}
        
        
    }
    
    return BigSquareView(viewModel: Fixture())
}
