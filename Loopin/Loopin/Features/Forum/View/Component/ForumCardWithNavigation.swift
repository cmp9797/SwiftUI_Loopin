//
//  ForumCardWithNavigation.swift
//  Loopin
//
//  Created by Celine Margaretha on 13/01/24.
//

import SwiftUI

struct ForumCardWithNavigation: View {
    @ObservedObject var postViewModel: PostViewModel
    
    var body: some View {
        NavigationLink {
            CommentView(postViewModel: postViewModel, commentListViewModel: postViewModel.commentListViewModel!)
                .toolbar(.hidden, for: .tabBar)
        } label: {
            ForumCard(postViewModel: postViewModel)
        }
    }
}
