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
        // Use Realm File in App Bundle
        guard let bundleRealmPath = Bundle.main.path(forResource: "default", ofType: "realm") else {
            return
        }

        let bundleRealmURL = URL(string: bundleRealmPath)
        let config = Realm.Configuration(fileURL: bundleRealmURL)

        do {
            try realm = Realm(configuration: config)
        } catch {
            print(error.localizedDescription)
            print("Proceed to reset to clean slate")
            resetRealm()
        }

        // Try Again
        do {
            try realm = Realm(configuration: config)
            print("Successfully load Realm database on retry")
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
