//
//  AcercaDe.swift
//  Menu2
//
//  Created by Tamara Rodriguez Romo on 14/05/23.
//

import SwiftUI

struct AcercaDe: View {
    let name: String = "Tamara Rodríguez Romo"
    let phone: String = "9811683822"
    let email: String = "al066186@uacam.mx"
    
    var body: some View {
        VStack {
            Image("Foto")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .padding(.top, 10)
            
            VStack(spacing: 10) {
                Text(name)
                    .font(.title)
                
                Text(phone)
                
                Text(email)
            }
            .padding()
            
            Spacer()
        }
    }
}




struct AcercaDe_Previews: PreviewProvider {
    static var previews: some View {
        AcercaDe()
    }
}
