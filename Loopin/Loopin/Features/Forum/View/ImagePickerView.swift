//
//  ImagePickerView.swift
//  Loopin
//
//  Created by Celine Margaretha on 12/01/24.
//

import Foundation
import SwiftUI
import Firebase

struct ImagePickerView: View {
    @Binding var selectedImage: UIImage?
    @State private var sourceType: ImagePicker.SourceType = .photoLibrary
    @State private var showImagePicker = false
    var onClear: () -> Void
    
    var body: some View {
        ZStack (alignment: .center) {
            
            VStack(alignment: .center){
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .clipped()
                    
                } else {
                    Spacer()
                    Text("Belum ada gambar terpilih")
                        .font(.outfit(.regular, size: .label1))
                    Spacer()
                }
            }
            .frame(maxWidth: UIScreen.main.bounds.width - 8, minHeight: 200, maxHeight: UIScreen.main.bounds.width)
            .background(Color("Black").opacity(0.05))
            .cornerRadius(20)
//            .padding(5)
           
            VStack() {
                HStack() {
                    Button(action: {}) {
                        Menu {
                            Button(action: {
                                selectedImage = nil // Reset any previous selection
                                sourceType = .photoLibrary
                                showImagePicker.toggle()
                            }) {
                                Text("Photo Library")
                            }
                            .padding(.horizontal, 5)
                            
                            Button(action: {
                                selectedImage = nil // Reset any previous selection
                                sourceType = .camera
                                showImagePicker.toggle()
                            }) {
                                Text("Camera")
                            }
                            .padding(.horizontal, 5)
                        }
                    label: {
                        Text("Pilih Gambar")
                            .font(.outfit(.regular, size: .body3))
                            .foregroundColor(.gray)
                        
                    }
//                    .padding(.horizontal, 5)
                    .padding(.leading, 8)
//                    .padding(.top, 5)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    
                    Spacer()
                    
                    Button() {
                        selectedImage = nil
                        onClear() // Notify the parent view
                    } label: {
                        Image(systemName: "trash")
                            .foregroundColor(.gray)
                    }
                    .disabled(selectedImage == nil)
                }
                Spacer()
            }
            .padding()
        }
        .padding()
        .frame(maxWidth: UIScreen.main.bounds.width)
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(selectedImage: $selectedImage, sourceType: $sourceType)
                .edgesIgnoringSafeArea(.bottom)
                
        }.edgesIgnoringSafeArea(.bottom)
        
    }
}

//struct CobaImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImagePickerView()
//    }
//}

