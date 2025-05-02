//
//  perfil_vista_basica.swift
//  RedesSociales
//
//  Created by alumno on 28/3/25.
//

import SwiftUI
import PhotosUI

struct PerfilBasicovista : View {
    @Environment(ControladorAplicacion.self) var controlador
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
        
        Text("User: \(controlador.perfil_a_mostrar?.username ?? "Sapphie ")")
        Text("Nombre: \(controlador.perfil_a_mostrar?.name ?? "Paola ")")
        Text("Correo: \(controlador.perfil_a_mostrar?.email ?? "no hay correo u.u ")")
            .onDisappear(){
                print("Esto se muestra cuando destruimos la vista")
            }
        
    }
}


#Preview {
    PerfilBasicovista()
        .environment(ControladorAplicacion())
}
