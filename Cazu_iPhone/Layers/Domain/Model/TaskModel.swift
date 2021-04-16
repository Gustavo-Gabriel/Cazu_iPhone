//
//  TaskModel.swift
//  Cazu_iPhone
//
//  Created by Gustavo Anjos on 15/04/21.
//

import Foundation

struct Task: Identifiable {
    var id = UUID()
    var descricao: String
    var horarioInicial: String
    var horarioFinal: String
    var status: TaskStatus
}

let data: [Task] = [
    Task(descricao: "Dar comida para o cachorro", horarioInicial: "10:30", horarioFinal: "10:42", status: .emAndamento),
    Task(descricao: "Dar comdia pakmra ooh cachorro", horarioInicial: "10:29", horarioFinal: "10:30", status: .cancelada),
    Task(descricao: "Regar as plantas da varanda", horarioInicial: "09:29", horarioFinal: "09:32", status: .concluida),
    Task(descricao: "Regar as plantas da varanda", horarioInicial: "09:29", horarioFinal: "09:32", status: .emAndamento)
]

let tasksSorted = data.sorted {
    $0.status.rawValue < $1.status.rawValue
}
