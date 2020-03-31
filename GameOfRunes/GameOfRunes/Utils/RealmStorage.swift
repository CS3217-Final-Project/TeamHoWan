//
//  Storage.swift
//  GameOfRunes
//
//  Created by Jermy on 31/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import RealmSwift

class RealmStorage: Storage {
    private var realm: Realm!
    
    init() {
        setUpDb()
    }
    
    private func setUpDb() {
        print("Filepath:", Realm.Configuration.defaultConfiguration.fileURL ?? "Cannot be found")
        
        do {
            realm = try Realm()
            print("Successfully load Realm database")
            return
        } catch {
            // cleaning
            print(error.localizedDescription)
            print("Proceed to reset to clean slate")
            resetRealm()
        }
        
        // try again
        do {
            realm = try Realm()
            print("Successfully load Realm database")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func resetRealm() {
        guard let URL = Realm.Configuration.defaultConfiguration.fileURL else {
            return
        }
        let realmURLs = [
            URL,
            URL.appendingPathExtension("lock"),
            URL.appendingPathExtension("note"),
            URL.appendingPathExtension("management")
        ]
        realmURLs.forEach { URL in try? FileManager.default.removeItem(at: URL) }
    }
    
    func save(stages: Stage...) {
        save(stages: stages)
    }
    
    // optimised for saving multiple stages
    func save(stages: [Stage]) {
        do {
            try realm.write {
                stages.forEach { stage in realm.add(StageRealmModel(stage: stage), update: .modified) }
            }
        } catch {
            print("Save stages error:", error.localizedDescription)
        }
    }
    
    func loadAllStages() -> [Stage] {
        realm.objects(StageRealmModel.self).map { stageRealmModel in stageRealmModel.stage }
    }
    
    func loadStages(names: String...) -> [Stage] {
        let nameSet = Set(names)
        return realm.objects(StageRealmModel.self).compactMap { stageRealmModel in
            nameSet.contains(stageRealmModel.name) ? stageRealmModel.stage : nil
        }
    }
    
    func loadStage(name: String) -> Stage? {
        realm.object(ofType: StageRealmModel.self, forPrimaryKey: name)?.stage
    }
}
