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
    var isFirstInit: Bool {
        realm.objects(FirstInitModel.self).isEmpty
    }

    init() {
        setUpDb()
    }

    /**
     Marks the Realm database as initialised. This is to prevent
     future launches of the application from re-initialising the database
     and thereby wiping out previously saved data. 
     */
    func didInitialise() {
        do {
            try realm.write {
                realm.add(FirstInitModel())
            }
        } catch {
            print("Unable to save init marker: ", error.localizedDescription)
        }
    }

    /**
     Set up database to use the default path determined by Realm.
     */
    private func setUpDb() {
        do {
            realm = try Realm()
            print("Successfully load Realm database")
            return
        } catch {
            // Cleaning of Realm Database
            print(error.localizedDescription)
            print("Proceed to reset to clean slate")
            resetRealm()
        }

        // Try Again
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
        delete(stageNames: stages.map { stage in stage.name })
        do {
            try realm.write {
                stages.forEach { stage in
                    realm.add(StageRealmModel(stage: stage))
                }
            }
        } catch {
            print("Save stages error:", error.localizedDescription)
        }
    }
    
    func loadAllStages() -> [Stage] {
        realm.objects(StageRealmModel.self).map { stageRealmModel in stageRealmModel.stage }
    }
    
    func load(stageNames: String...) -> [Stage] {
        load(stageNames: stageNames)
    }
    
    func load(stageNames: [String]) -> [Stage] {
        let nameSet = Set(stageNames)
        return realm.objects(StageRealmModel.self).compactMap { stageRealmModel in
            nameSet.contains(stageRealmModel.name) ? stageRealmModel.stage : nil
        }
    }
    
    private func loadRealmStage(stageName: String) -> StageRealmModel? {
        realm.object(ofType: StageRealmModel.self, forPrimaryKey: stageName)
    }
    
    func load(stageName: String) -> Stage? {
        loadRealmStage(stageName: stageName)?.stage
    }
    
    func exists(stageName: String) -> Bool {
        load(stageName: stageName) != nil
    }
    
    func delete(stageNames: String...) {
        delete(stageNames: stageNames)
    }
    
    func delete(stageNames: [String]) {
        do {
            try realm.write {
                stageNames.forEach { stageName in
                    guard let stage = loadRealmStage(stageName: stageName) else {
                        return
                    }
                    stage.cascadeDelete(realm: realm)
                    realm.delete(stage)
                }
            }
        } catch {
            print("Delete stages error:", error.localizedDescription)
        }
    }
}
