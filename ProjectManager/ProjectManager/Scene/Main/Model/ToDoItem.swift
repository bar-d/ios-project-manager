//
//  ToDoItem.swift
//  ProjectManager
//
//  Created by brad, bard on 2022/09/19.
//

import Foundation

struct ToDoItem: Codable, Equatable {
    
    // MARK: - Properties
    
    private let uuid = UUID()
    let title: String
    let description: String
    let timeLimit: Date
    
    // MARK: - Initializers
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
        timeLimit = try container.decode(Date.self, forKey: .timeLimit)
    }
    
    init(title: String = "", description: String = "", timeLimit: Date = Date()) {
        self.title = title
        self.description = description
        self.timeLimit = timeLimit
    }
    
    // MARK: - CodingKey

    private enum CodingKeys: CodingKey {
        
        case title
        case description
        case timeLimit
    }
}
