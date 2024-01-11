//
//  CurrentProjectView.swift
//  Loopin
//
//  Created by Intan Saliya Utomo on 03/01/24.
//

import SwiftUI

struct CurrentProjectView: View {
    @Environment(\.presentationMode) var presentationMode
    let currentProject: Project
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical){
                ZStack(alignment: .top) {
                    ImageSlider(images: [currentProject.image])
                        .frame(maxWidth: 390, maxHeight: 290)
                    RoundedRectangle(cornerRadius: 30)
                        .frame(minHeight: 571)
                        .foregroundColor(Color(.white))
                        .padding(.top, 273)
                    VStack(alignment: .leading, spacing: 20) {
                        Text(currentProject.name)
                            .font(.outfit(.semiBold, size: .heading3))
                        Text("Persiapan")
                            .font(.outfit(.semiBold, size: .body3))
                        Text(currentProject.preparation)
                            .font(.outfit(.regular, size: .body2))
                        
                        ForEach(currentProject.subParts, id: \.self) { subPartItem in
                            Text(subPartItem.name)
                                .font(.outfit(.semiBold, size: .body3))
                            ForEach(subPartItem.steps, id: \.self) { stepItem in
                                AccordionWithPicture(isOpened: false, title: stepItem.text, content: stepItem.guidances)
                            }
                        }
                        
//                        ForEach(currentProject.subPart, id: \.self) { subPartItem in
//                            Text(subPartItem.name)
//                                .font(.outfit(.semiBold, size: .body3))
//                            ForEach(subPartItem.steps, id: \.self) { stepItem in
//                                Accordion(isOpened: false, title: stepItem.title, content: stepItem.content)
//                            }
//                        }
                    }
                    .padding(.top, 300)
                    .padding()
                }
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct CurrentProjectView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentProjectView(
            currentProject: Project(type:"tipe", name: "name", image: "test", description: "description", preparation: "preparation", yarnType: "yarn type", yarnWeight: "yarn weight", hookSize: "hook size", stitchType: "stitch type", subParts: [], samples: []))
    }
}
