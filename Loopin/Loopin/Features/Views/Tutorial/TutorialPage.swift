//
//  TutorialPage.swift
//  Loopin
//
//  Created by Intan Saliya Utomo on 20/11/23.
//

import SwiftUI

struct TutorialPage: View {
    let tutorials: [(String, String)] = [
        ("Tutorial-1", "Cara Memegang Hakpen"),
        ("Tutorial-2", "Istilah Dasar Pada Proyek Crochet"),
        ("Tutorial-3", "Cara Membaca Pola Dalam Crochet"),
        ("Tutorial-4", "Tentang Benang Crochet")
    ]
    
    var body: some View {
            VStack(alignment: .leading) {
                NavigationView {
                    ScrollView(.vertical){
                        VStack (spacing: 10){
                            ForEach(1...4, id: \.self) { item in
                                NavigationLink {
                                    switch(item) {
                                    case 1:
                                        HookTutorialView()
                                    case 2:
                                        //crochettermtutorialview
                                        TermTutorialView()
                                    case 3:
                                        //patterntutorialview
                                        PatternTutorialView()
                                    case 4:
                                        //yarntutorialview
                                        YarnTutorialView()
                                    default: EmptyView()
                                    }
                                } label: {
                                    RectangleCard(cardImage: tutorials[item - 1].0, cardText: tutorials[item - 1].1)
                                }
                            }
                        }
                    }
                    .background(Color("White"))
                    .navigationTitle("Tutorial")
                    .navigationBarBackButtonHidden(true)
                }
            }
    }
}

struct TutorialPage_Previews: PreviewProvider {
    static var previews: some View {
        TutorialPage()
    }
}