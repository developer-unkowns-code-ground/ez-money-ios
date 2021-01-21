//
//  RootView.swift
//  Bobot
//
//  Created by Muhammad Rizky Hasibuan on 13/01/21.
//

import SwiftUI

struct RootView: View {
    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
    }
    
    @ObservedObject private var viewModel: RootViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = RootViewModel()
        RootView(viewModel: viewModel)
    }
}
