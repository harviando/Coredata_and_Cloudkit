//
//  DatabaseHelper.swift
//  NC3CoredataAndCloudkit
//
//  Created by Muhammad Harviando on 02/09/20.
//  Copyright © 2020 Muhammad Harviando. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DatabaseHelper {
    
    static let shareInstance = DatabaseHelper()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveImage(data: Data) {
        
        let imageInstance = Image(context: context)
        imageInstance.img = data
        
        do {
            try context.save()
            print("Image is saved")
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchImage() -> [Image] {
        var fetchingImage = [Image]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Image")
        
        do {
            fetchingImage = try context.fetch(fetchRequest) as! [Image]
        } catch {
            print("Error while fetching the image")
        }
        
        return fetchingImage
    }
    
}
