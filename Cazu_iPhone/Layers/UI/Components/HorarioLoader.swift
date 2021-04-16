//
//  HorarioLoader.swift
//  Cazu_iPhone
//
//  Created by Gustavo Anjos on 16/04/21.
//

import SwiftUI

struct HorarioLoader: View {
    var body: some View {
        Circle()
            .frame(width: 5, height: 5, alignment: .center)
            .foregroundColor(Color(#colorLiteral(red: 0.4666666667, green: 0.4862745098, blue: 0.968627451, alpha: 1)))
        
        Circle()
            .frame(width: 3, height: 3, alignment: .center)
            .foregroundColor(Color(#colorLiteral(red: 0.4666666667, green: 0.4862745098, blue: 0.968627451, alpha: 1)))
        
        Circle()
            .frame(width: 3, height: 3, alignment: .center)
            .foregroundColor(Color(#colorLiteral(red: 0.4666666667, green: 0.4862745098, blue: 0.968627451, alpha: 1)))
        
        Circle()
            .frame(width: 5, height: 5, alignment: .center)
            .foregroundColor(Color(#colorLiteral(red: 0.4666666667, green: 0.4862745098, blue: 0.968627451, alpha: 1)))
    }
}

struct HorarioLoader_Previews: PreviewProvider {
    static var previews: some View {
        HorarioLoader()
    }
}
