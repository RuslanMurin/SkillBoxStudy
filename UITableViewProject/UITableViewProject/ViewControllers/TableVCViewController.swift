//
//  TableVCViewController.swift
//  UITableViewProject
//
//  Created by Ruslan Murin on 03.06.2020.
//  Copyright © 2020 Ruslan Murin. All rights reserved.
//

import UIKit
struct Settings{
    var settingsNames:[String] = []
}
class SortedSettings{
    static func settings() -> [Settings]{

        return [
                Settings(settingsNames: ["Авиарежим", "Wi-Fi", "Bluetooth", "Сотовая связь", "Режим модема"]),
                Settings(settingsNames: ["Уведомления", "Звуки, тактильные сигналы", "Не беспокоить", "Экранное время"]),
                Settings(settingsNames: ["Основные", "Пункт управления", "Экран и яркость", "Универсальный доступ", "Обои", "Siri и Поиск"])
        ]
    }
}

class TableVCViewController: UIViewController {
    @IBOutlet weak var mainTableview: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        self.mainTableview.rowHeight = 50
        self.mainTableview.sectionHeaderHeight = 40
        // Do any additional setup after loading the view.
    }
    
    let settings = SortedSettings.settings()

}

extension TableVCViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].settingsNames.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let vw = UIView()
    vw.backgroundColor = UIColor.systemGray5
        return vw
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! MainTableViewCell
        let name = settings[indexPath.section].settingsNames[indexPath.row]
        cell.settingsLabel.text = name
        cell.settingsSwitch.isHidden = true
        if name == "Авиарежим"{
            cell.settingsSwitch.isHidden = false
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
