//
//  Storage.swift
//  GameOfRunes
//
//  Created by Jermy on 31/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import RealmSwift

class Storage {
    private var realm: Realm!
    
    init() {
        setUpDb()
    }
    
    private func setUpDb() {
        print("Filepath:", Realm.Configuration.defaultConfiguration.fileURL ?? "Cannot be found")
        
        do {
            realm = try Realm()
            return
        } catch {
            // cleaning
            print(error.localizedDescription)
            Realm.Configuration.defaultConfiguration.deleteRealmIfMigrationNeeded = true
        }
        
        // try again
        do {
            realm = try Realm()
        } catch {
            print(error.localizedDescription)
        }
    }
}
/*
    private func generateImagePath(for levelName: String, view: UIView) -> String {
        let previewImage = view.takeSnapShot()
        return previewImage.saveToDocumentDirectory(name: UUID().uuidString)
    }
    
    func savePreloadedLevel(levelName: String, pegs: [Peg], aspectRatio: CGFloat) {
        if !isUniqueLevelName(levelName: levelName) {
            removeLevel(levelName: levelName)
        }
        
        let imageName = "\(levelName) \(Int((aspectRatio * 100).rounded(.down)))"
        let previewImage = UIImage(named: imageName)
        let imagePath = previewImage?.saveToDocumentDirectory(name: UUID().uuidString)
        
        do {
            let newLevel = Level()
            newLevel.name = levelName
            newLevel.previewImagePath = imagePath ?? ""
            pegs.forEach { newLevel.pegs.append(PegRealmModel(peg: $0)) }
            newLevel.permanent = true
            
            try realm.write {
                realm.add(newLevel, update: .modified)
            }
            
            print("Default level \"\(levelName)\" is successfully loaded")
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension StorageSystem: DataSourceDelegate {
    func isUniqueLevelName(levelName: String) -> Bool {
        loadLevel(levelName: levelName) == nil
    }
    
    func isDefaultLevel(levelName: String) -> Bool {
        loadLevel(levelName: levelName)?.permanent ?? false
    }
    
    func saveLevel(levelName: String, pegs: [Peg], currentView: UIView) -> Level? {
        if isDefaultLevel(levelName: levelName) {
            return nil
        }
        
        if !isUniqueLevelName(levelName: levelName) {
            removeLevel(levelName: levelName)
        }
        
        let imagePath = generateImagePath(for: levelName, view: currentView)
        
        do {
            let newLevel = Level()
            newLevel.name = levelName
            newLevel.previewImagePath = imagePath
            pegs.forEach { newLevel.pegs.append(PegRealmModel(peg: $0)) }
            
            try realm.write {
                realm.add(newLevel, update: .modified)
            }
            
            return newLevel
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func retrieveAllLevels() -> Results<Level> {
        realm.objects(Level.self)
    }
    
    func loadLevel(levelName: String) -> Level? {
        realm.objects(Level.self).first(where: { $0.name == levelName })
    }
    
    func removeLevel(levelName: String) {
        guard let level = loadLevel(levelName: levelName) else {
            return
        }
        if !level.previewImagePath.isEmpty {
            do {
                let imagePath = FileManager.default.getFullPath(pathfromDocuments: level.previewImagePath)
                try FileManager.default.removeItem(atPath: imagePath)
            } catch {
                print(error.localizedDescription)
            }
        }
        
        do {
            try realm.write {
                realm.delete(level.pegs)
                realm.delete(level)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
 */
