//
//  GalleryViewController.swift
//  10.1. Additional
//
//  Created by Ruslan Murin on 23.06.2020.
//  Copyright © 2020 Ruslan Murin. All rights reserved.
//

import UIKit
//класс альбомов
struct Album {
    let name: String
    let images: [UIImage?]
}

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
    
    let albums = [Album(name: AlbumsContainer.names[0], images: AlbumsContainer.images[0]),
                  Album(name: AlbumsContainer.names[1], images: AlbumsContainer.images[1]),
                  Album(name: AlbumsContainer.names[2], images: AlbumsContainer.images[2]),
                  Album(name: AlbumsContainer.names[3], images: AlbumsContainer.images[3])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        albumTableView.delegate = self
        albumTableView.dataSource = self
    }
}
//таблица
extension GalleryViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell") as! AlbumTableViewCell
        cell.images = albums[indexPath.section].images
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return albums[section].name
    }
}


