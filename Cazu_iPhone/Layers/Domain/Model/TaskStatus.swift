//
//  TaskStatus.swift
//  Cazu_iPhone
//
//  Created by Gustavo Anjos on 15/04/21.
//

import Foundation
import UIKit

enum TaskStatus: Int {
    
    case emAndamento
    case cancelada
    case concluida
    
    func getStatus() -> String{

        switch self {
        
        case .emAndamento:
            return "em andamento"
            
        case .cancelada:
            return "cancelada"
            
        case .concluida:
            return "concluída"
            
        }
    }
    
    func getColor() -> UIColor{
        switch self {
        
        case .emAndamento:
            return #colorLiteral(red: 0.4666666667, green: 0.4862745098, blue: 0.968627451, alpha: 1)
            
        case .cancelada:
            return #colorLiteral(red: 0.9803921569, green: 0.06666666667, blue: 0.3098039216, alpha: 1)
            
        case .concluida:
            return #colorLiteral(red: 0, green: 0.7568627451, blue: 0.7647058824, alpha: 1)
            
        }
    }
    
}
