//
//  GalleryViewController.swift
//  10.1. Additional
//
//  Created by Ruslan Murin on 23.06.2020.
//  Copyright © 2020 Ruslan Murin. All rights reserved.
//

import UIKit


class AlbumsContainer {
    static func albumsNames() -> [String]{
        return ["cities", "cats", "meal", "nature"]
    }
}

class GalleryViewController: UIViewController{
    @IBOutlet weak var albumTableView: UITableView!
    let albumView = AlbumTableViewCell()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        albumTableView.delegate = self
        albumTableView.dataSource = self
    }
}

extension GalleryViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return AlbumsContainer.albumsNames().count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell") as! AlbumTableViewCell
        cell.sendedIndex = indexPath.section
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180.0
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return AlbumsContainer.albumsNames()[section].self
    }
}


