//
//  FileManager.swift
//  MrsWriter for writers
//
//  Created by Edson De Carvalho on 18/08/2024.
//

import Foundation
import UIKit

// Function to create a .txt file
func createTextFile(from texts: [TextStruct], fileName: String) {
    var fileContent = ""

    // Date formatter to convert Date to a string
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    dateFormatter.timeStyle = .short

    // Loop through each TextStruct and format its data
    for textStruct in texts {
        fileContent += "\(textStruct.title)\n"
        fileContent += "\n"
        fileContent += "\n"
        fileContent += "\n"
        fileContent += "\(textStruct.text)\n"
    }

    // Get the path for the file
    if let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
        let fileURL = directory.appendingPathComponent("\(fileName).txt")

        // Write the content to the file
        do {
            try fileContent.write(to: fileURL, atomically: true, encoding: .utf8)
            print("File created at: \(fileURL)")
        } catch {
            print("Error writing file: \(error)")
        }
    }
}





func saveFile(to texts: [TextClass], defaultFileName: String, viewController: UIViewController) {
    let temporaryDirectoryURL = FileManager.default.temporaryDirectory
    let fileURL = temporaryDirectoryURL.appendingPathComponent("\(defaultFileName).txt")

    var fileContent = ""

    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    dateFormatter.timeStyle = .short

    for textStruct in texts {
        fileContent += "Title: \(textStruct.title)\n"
        fileContent += "\n"
        fileContent += "\n"
        fileContent += "Text: \(textStruct.text)\n"
        fileContent += "\n"
        fileContent += "\n"
        fileContent += "\n"
        fileContent += "\n"
        fileContent += "\n"
        fileContent += "\n"
        fileContent += "\n"
        fileContent += "\n"
    }

    do {
        try fileContent.write(to: fileURL, atomically: true, encoding: .utf8)

        let documentPicker = UIDocumentPickerViewController(forExporting: [fileURL], asCopy: true)
        viewController.present(documentPicker, animated: true, completion: nil)
    } catch {
        print("Error creating file: \(error)")
    }
}

// Example ViewController
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton(type: .system)
        button.setTitle("Save File", for: .normal)
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        button.center = self.view.center
        self.view.addSubview(button)
    }
    
    @objc func saveButtonTapped() {
        let sampleTexts = [
            TextClass(title: "First Title", text: "This is the first text.", book_id: "001", color: "", lastModificationDate: Date()),
            TextClass(title: "Second Title", text: "This is the second text.", book_id: "002", color:"", lastModificationDate: Date())
        ]
        
        saveFile(to: sampleTexts, defaultFileName: "MyTextFile", viewController: self)
    }
}
