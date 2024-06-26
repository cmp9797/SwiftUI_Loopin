//
//  ContentView.swift
//  Loopin
//
//  Created by Intan Saliya Utomo on 20/11/23.
//

import SwiftUI

struct ContentView: View {
//    @State private var navigateToWelcomePage = false
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var appManager : AppManager
    @State var showNavigationBar = true
    
    var body: some View {
        NavigationView {
            TabView(selection: $appManager.selectedContentMenuTab){
                // Tab 1
                NavigationStack {
                    TutorialPage()
                }
                .tabItem {
                    Image(uiImage: UIImage(named: "tutorial")!)
                    Text("Tutorial")
                        .font(.outfit(.semiBold, size: .label2))
                }
                .tag(0)
                
                // Tab 2
                NavigationStack {
                    ProjectsView()
                }
                    .tabItem {
                        Image(uiImage: UIImage(named: "project")!)
                        Text("Proyek")
                            .font(.outfit(.semiBold, size: .label2))
                    }
                    .tag(1)
                
                
                // Tab 3
                NavigationStack {
                    ForumView()
                }
                    .tabItem {
                        Image(uiImage: UIImage(named: "forum")!)
                        Text("Forum")
                            .font(.outfit(.semiBold, size: .label2))
                    }
                    .tag(2)
                
                
                // Tab 4
                NavigationStack {
                    ProfileView()
                }
                    .tabItem {
                        Image(uiImage: UIImage(named: "profile")!)
                        Text("Profil")
                            .font(.outfit(.semiBold, size: .label2))
                    }
                    .tag(3)
            }
//            .toolbar(.visible, for: .tabBar)
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
