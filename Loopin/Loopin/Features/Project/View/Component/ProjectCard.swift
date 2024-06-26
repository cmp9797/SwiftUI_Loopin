//
//  ProjectCard.swift
//  Loopin
//
//  Created by Intan Saliya Utomo on 24/12/23.
//

import SwiftUI

struct ProjectCard: View {
    @StateObject var projectViewModel: ProjectViewModel
    
    @State private var showDeleteAlert = false
    @State private var isEditProjectViewPresented = false
//    let projectName: String
//    let projectDesc: String
    
    var body: some View {
        HStack(){
            VStack(alignment: .leading, spacing: 10) {
                Text(projectViewModel.project.name)
                    .font(.outfit(.bold, size: .heading4))
                
                Text(projectViewModel.project.description)
                    .font(.outfit(.regular, size: .body2))
                
            }
            
            Spacer()
            
            Button(action: {}) {
                Menu {
                    Button(action: {
                        isEditProjectViewPresented.toggle()
                    }) {
                        Label("Ubah", systemImage: "pencil")
                    }
                    .padding(.horizontal, 5)
                    
                    Button(action: {
                        showDeleteAlert.toggle()
                        print("heee")
                    }) {
                        Label("Hapus", systemImage: "trash")
                            .foregroundColor(.red)
                    }
                    .padding(.horizontal, 5)
                }
            label: {
                Image(systemName: "ellipsis.circle")
                    .foregroundColor(.black)
                    .scaleEffect(1.2)
            }
            .padding(.horizontal, 5)
            .padding(.leading, 8)
            .padding(.vertical, 5)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding(.horizontal)
        .frame(minWidth: 358, maxHeight: 100)
        .multilineTextAlignment(.leading)
        .foregroundColor(Color("Black"))
        .padding(.vertical, 15)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(Color.white)
        )
        .shadow(color:.black .opacity(0.05), radius: 10, x: 0, y: 4)
        .sheet(isPresented: $isEditProjectViewPresented) {
            EditProjectView(projectToEdit: projectViewModel)
        }
        .alert(isPresented: $showDeleteAlert) {
            Alert(
                title: Text("Hapus Unggahan"),
                message: Text("Apakah anda yakin ingin menghapus unggahan?"),
                primaryButton: .destructive(Text("Batal")),
                secondaryButton: .default(Text("Hapus")) {
                    /// Handle delete action
                    projectViewModel.remove()
                }
            )
        }
    }
}

//struct ProjectCard_Previews: PreviewProvider {
//    static var previews: some View {
//        ProjectCard(projectViewModel: ProjectViewModel())
//    }
//}
