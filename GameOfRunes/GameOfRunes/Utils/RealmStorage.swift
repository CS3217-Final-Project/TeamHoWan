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
    
    init(useAppBundle: Bool = true) {
        setUpDb(useAppBundle: useAppBundle)
    }

    /**
     The database is now configured to use the `default.realm` file included
     in the App Bundle. This allows state to be persisted across launches of the
     application as state changes are saved to the same realm file everytime.
     - Parameters:
        - useAppBundle: Boolean indicating whether Realm should use the `default.realm`
     file provided in the App Bundle. If `false`, Realm will use the default file URL, which is randomly
     created everytime the application is built.
     */
    private func setUpDb(useAppBundle: Bool) {
        // Use Realm File in App Bundle
        guard let bundleRealmPath = Bundle.main.path(forResource: "default", ofType: "realm") else {
            return
        }

        var config: Realm.Configuration
        if useAppBundle {
            let bundleRealmURL = URL(string: bundleRealmPath)
            config = Realm.Configuration(fileURL: bundleRealmURL)
        } else {
            config = Realm.Configuration(fileURL: Realm.Configuration.defaultConfiguration.fileURL)
        }

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
