//
//  contentView.swift
//  RedesSociales
//
//  Created by alumno on 30/4/25.
//

import SwiftUI
//para usar la galeria
import PhotosUI

struct contentView: View {
    @State var foto_seleccionada:
    PhotosPickerItem? = nil
    @State var foto_a_mostrar : UIImage? = nil
    
    var body: some View {
        PhotosPicker(selection: $foto_seleccionada){
            Image(uiImage: foto_a_mostrar ?? UIImage(resource: .avatar))
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 300, height: 300)
                .clipShape(.circle)
        }
        .onChange(of: foto_seleccionada) {valor_anterior, valor_nuevo in
            Task{
                if let foto_seleccionada, let datos = try? await
                    foto_seleccionada.loadTransferable(type: Data.self){
                    if let imagen = UIImage(data: datos){
                        foto_a_mostrar = imagen
                    }
                }
            }
        }
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    contentView()
}
