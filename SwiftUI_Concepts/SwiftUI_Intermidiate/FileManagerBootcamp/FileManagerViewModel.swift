//
//  FileManagerViewModel.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 10/03/22.
//

import Foundation
import UIKit

class LocalFileManager {
    static let instance = LocalFileManager() // singleton
    let folderName = "MyApp_Images"
    
    init() {
        createFolderIfNeeded()
    }
    
    func createFolderIfNeeded() {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .path else { return }
        
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager
                    .default
                    .createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
                print("Success creating the folder")
            } catch let error {
                print("Error creating folder: \(error.localizedDescription)")
            }
        }
    }
    
    func saveImage(image: UIImage, name: String) -> String {
        guard let data = image.jpegData(compressionQuality: 1.0),
              let path = getPathForImage(name: name) else {
                  //print("Error getting data")
                  return "Error getting data"
              }
        //image.pngData()
        
        //let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        //let directory3 = FileManager.default.temporaryDirectory
        //let directory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
        //let path = directory?.appendingPathComponent("\(name).jpg")
        
        do {
            try data.write(to: path)
            //print("SUCCESS SAVING")
            print(path)
            return "SUCCESS SAVING"
        } catch let error {
            //print("Error Saving: \(error.localizedDescription)")
            return "Error Saving: \(error.localizedDescription)"
        }
    }
    
    func getImage(name: String) -> UIImage? {
        guard
            let path = getPathForImage(name: name)?.path,
            FileManager.default.fileExists(atPath: path) else {
                print("Error getting path.")
                return nil
            }
        return UIImage(contentsOfFile: path)
    }
    
    func deleteImage(name: String) -> String {
        guard
            let path = getPathForImage(name: name)?.path,
            FileManager.default.fileExists(atPath: path) else {
                //print("Error getting path.")
                return "Error getting path."
            }
        
        do {
            try FileManager.default.removeItem(atPath: path)
            //print("Successfully deleted !")
            return "Successfully deleted !"
        } catch let error {
            //print("Error deleting image. \(error)")
            return "Error deleting image. \(error)"
        }
    }
    
    func deleteFolderIfNeeded() {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .path else { return }
        
        do {
            try FileManager.default.removeItem(atPath: path)
            print("Successfully deleting folder !")
        } catch let error {
            print("Error deleting folder. \(error)")
        }
    }
    
    func getPathForImage(name: String) -> URL? {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .appendingPathComponent("\(name).jpg") else {
                    print("Error getting path.")
                    return nil
                }
        return path
    }
}

class FileManagerViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    let imageName: String = "mengto"
    let manager = LocalFileManager.instance
    @Published var infoMessage: String = ""
    
    init() {
        //getImageFromAssetFolder()
        getImageFromFileManager()
    }
    
    func getImageFromAssetFolder() {
        image = UIImage(named: imageName)
    }
    
    // after saving to file manager, we are retrieving the data
    func getImageFromFileManager() {
        image = manager.getImage(name: imageName)
    }
    
    func saveImage() {
        guard let image = image else { return }
        infoMessage = manager.saveImage(image: image, name: imageName)
    }
    
    func deleteImage() {
        infoMessage = manager.deleteImage(name: imageName)
    }
    
    func deleteFolder() {
        manager.deleteFolderIfNeeded()
    }
}
