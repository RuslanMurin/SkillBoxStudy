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

class GalleryViewController: UIViewController{
    @IBOutlet weak var albumTableView: UITableView!
    let albums = [Album(name: "cities", images: (1...6).map { UIImage(named: "c\($0)") }),
    Album(name: "cats", images: (1...6).map { UIImage(named: "cat\($0)") }),
    Album(name: "meal", images: (1...6).map { UIImage(named: "m\($0)") }),
    Album(name: "nature", images: (1...6).map { UIImage(named: "n\($0)") })]

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


