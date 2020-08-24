//
//  GalleryViewController.swift
//  10.1. Additional
//
//  Created by Ruslan Murin on 23.06.2020.
//  Copyright © 2020 Ruslan Murin. All rights reserved.
//

import UIKit
//класс альбомов
class AlbumsContainer {
    static var names: [String]{
        return  ["cities", "cats", "meal", "nature"]
    }
    
    static var images: [[UIImage?]] {
        return [ (1...6).map { UIImage(named: "c\($0)") },
                 (1...8).map { UIImage(named: "cat\($0)") },
                 (1...8).map { UIImage(named: "m\($0)") },
                 (1...6).map { UIImage(named: "n\($0)") } ]
    }
}
//VC
class GalleryViewController: UIViewController{
    @IBOutlet weak var albumTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        albumTableView.delegate = self
        albumTableView.dataSource = self
    }
}
//таблица
extension GalleryViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return AlbumsContainer.names.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell") as! AlbumTableViewCell
        cell.images = AlbumsContainer.images[indexPath.section]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return AlbumsContainer.names[section]
    }
}


