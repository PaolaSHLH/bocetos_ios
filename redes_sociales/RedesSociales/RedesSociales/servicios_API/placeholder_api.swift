//
//  placeholder_api.swift
//  RedesSociales
//
//  Created by alumno on 24/3/25.
//

import SwiftUI


class PlaceHolderAPI: Codable {
    let url_de_servicio = "https://jsonplaceholder.typicode.com"

    func descargar_publicaciones() async -> [Publicacion]?{
        let ubicacion_recurso = "/post"
        return await descargar(recurso: ubicacion_recurso)
    }
    
    func descargar_comentarios(postId: Int) async -> [Comentario]?{
        let ubicacion_recurso = "/post/\(postId)/comments"
        return await descargar(recurso: ubicacion_recurso)
    }
    
    func descargar_perfil(id: Int) async -> Perfil?{
        let ubicacion_recurso = "/users/\(id)/"
        return await descargar(recurso: ubicacion_recurso)
    }
    
    func descargar<TipoGenerico:Codable>(recurso: String) async -> TipoGenerico?{
        do{
            guard let url = URL(string: "\(url_de_servicio)/posts") else {throw ErroresDeRed.badUrl}
            let(datos, respuesta) = try await URLSession.shared.data(from: url)
            guard let respuesta = respuesta as? HTTPURLResponse else {throw  ErroresDeRed.badResponse}
            guard respuesta.statusCode >= 200 && respuesta.statusCode < 300 else {throw ErroresDeRed.badStatus}
            guard let respuesta_decodificada = try? JSONDecoder().decode(TipoGenerico.self, from: datos) else {throw ErroresDeRed.fallaAlConvertirLaRespuesta}
            
            return respuesta_decodificada
            
        }catch ErroresDeRed.badUrl{
            print("Tienes mala conexion, matate")
        }
        catch ErroresDeRed.badResponse{
            print("Algo salio mal con la respuesta, revisa porfi")
        }
        catch ErroresDeRed.badStatus{
            print("Como puedes tener un error en algo que no se mueve?")
        }
        catch ErroresDeRed.fallaAlConvertirLaRespuesta{
            print("Tienes mal el modelo o la implementacion de este")
        }
        catch ErroresDeRed.invalidRequest {
            print("como llegaste aqui? 0-0")
        }
        catch{
            print("algo muy malo paso y no se que es, no deberias de ver esto")
        }
        return nil
    }
}
