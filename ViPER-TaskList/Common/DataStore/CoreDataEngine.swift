//
//  CoreDataEngine.swift
//  ViPER-TaskList
//
//  Created by Green on 06.11.2022.
//

import Foundation
import CoreData

enum CDEntity: String {
    case tasks = "CDTaskEntity"
}

final class CoreDataEngine {
    static let sharedInstance = CoreDataEngine()
    private let coreDataManager = CoreDataManager()
    
    // MARK: - Engine responsobities
    func save(_ data: Entity, cdEntity: CDEntity) {
        guard let entity = NSEntityDescription.entity(forEntityName: cdEntity.rawValue,
                                                      in: coreDataManager.context) else { return }
        
        switch cdEntity {
        case .tasks:
            let task = CDTaskEntity(entity: entity, insertInto: coreDataManager.context)
            task.task = data.dictionary?[.task] as? String
            task.uuid = data.dictionary?[.uuid] as? UUID
            task.date = data.dictionary?[.date] as? Date
            task.creator = data.dictionary?[.user] as? NSObject
        }
        
        do {
            try coreDataManager.context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetch(cdEntity: CDEntity) -> [Entity]? {
        switch cdEntity {
        case .tasks:
            let fetchRequest: NSFetchRequest<CDTaskEntity> = CDTaskEntity.fetchRequest()
            guard let tasks = try? coreDataManager.context.fetch(fetchRequest) else {
                return nil
            }
            let convertedTasks = tasks.map {
                Task(uuid: $0.uuid ?? UUID(),
                     task: $0.task ?? "",
                     creator: $0.creator as! User,
                     date: $0.date ?? Date()) }
            
            return convertedTasks
        }
    }
    
    func delete(_ data: Entity, cdEntity: CDEntity) {
        let predicateRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: cdEntity.rawValue)
        predicateRequest.predicate = NSPredicate(format: "uid == %@",
                                                 (data.dictionary?[.uuid] as? UUID)?.uuidString ?? "")
        
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: predicateRequest)
        do {
            try coreDataManager.context.execute(deleteRequest)
        } catch {
            print(error.localizedDescription)
        }
    }
}
