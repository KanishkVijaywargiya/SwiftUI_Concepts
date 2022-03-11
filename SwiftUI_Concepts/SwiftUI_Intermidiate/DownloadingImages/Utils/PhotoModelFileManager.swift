//
//  PhotoModelFileManager.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 11/03/22.
//

import Foundation
import SwiftUI

class PhotoModelFileManager {
    static let instance = PhotoModelFileManager() // singleton
    let folderName = "downloaded_photos"
    
    private init() {
        createFolderIfNeeded()
    }
    
    private func createFolderIfNeeded() {
        guard let path = getFolderPath() else { return }
        
        if !FileManager.default.fileExists(atPath: path.path) {
            do {
                try FileManager
                    .default
                    .createDirectory(at: path, withIntermediateDirectories: true, attributes: nil)
                print("Success creating the folder")
            } catch let error {
                print("Error creating folder: \(error.localizedDescription)")
            }
        }
    }
    
    private func getFolderPath() -> URL? {
        return FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(folderName)
    }
    
    func saveImage(image: UIImage, name: String) {
        guard
            let data = image.pngData(),
            let path = getPathForImage(name: name) else { return }
        
        do {
            try data.write(to: path)
            print("Success saving")
        } catch let error {
            print("Error saving: \(error.localizedDescription)")
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
    
    func getPathForImage(name: String) -> URL? {
        guard let path = getFolderPath() else { return nil }
        return path.appendingPathComponent(name + ".png")
    }
}
