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
    @State var foto_seleccionada: PhotosPickerItem? = nil
    @State var foto_a_mostrar : UIImage? = nil
    var body: some View {
        VStack(spacing: 30) {
            PhotosPicker(selection: $foto_seleccionada) {
                Image(uiImage: foto_a_mostrar ?? UIImage(resource: .avatar))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
            }
            .onChange(of: foto_seleccionada) { _, nuevo in
                Task {
                    if let nuevo, let datos = try? await nuevo.loadTransferable(type: Data.self),
                       let imagen = UIImage(data: datos) {
                        foto_a_mostrar = imagen
                    }
                }
            }
 
            VStack(alignment: .leading, spacing: 15) {
                Text("Usuario: \(controlador.perfil_a_mostrar?.username ?? "Sapphie")")
                Text("Nombre: \(controlador.perfil_a_mostrar?.name ?? "Paola")")
                Text("Correo: \(controlador.perfil_a_mostrar?.email ?? "no hay correo u.u")")
            }
            .font(.title3)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.teal.opacity(0.5))
            .cornerRadius(12)
            .padding(.horizontal)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(gradient: Gradient(colors: [.mint, .cyan]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()
        )
        .onDisappear {
            print("Esto se muestra cuando destruimos la vista")
        }
    }
}


#Preview {
    PerfilBasicovista()
        .environment(ControladorAplicacion())
}
