//
//  TableVCViewController.swift
//  UITableViewProject
//
//  Created by Ruslan Murin on 03.06.2020.
//  Copyright © 2020 Ruslan Murin. All rights reserved.
//

import UIKit
struct Settings{
    var settingName: String
    let shouldShowSwitch: Bool

    init(name: String, shouldShowSwitch: Bool = false) {
        self.settingName = name
        self.shouldShowSwitch = shouldShowSwitch
    }
}
class SortedSettings{
    static func settings() -> [[Settings]]{

        return [
            [Settings(name: "Авиарежим", shouldShowSwitch: true), Settings(name: "Wi-Fi"), Settings(name: "Bluetooth"), Settings(name: "Сотовая связь"), Settings(name: "Режим модема")],
            [Settings(name: "Уведомления"), Settings(name: "Звуки, тактильные сигналы"), Settings(name: "Не беспокоить"), Settings(name: "Экранное время")],
            [Settings(name: "Основные"), Settings(name: "Пункт управления"), Settings(name: "Экран и яркость"), Settings(name: "Универсальный доступ"), Settings(name: "Обои"), Settings(name: "Siri и Поиск") ]]
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
        return settings[section].count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let vw = UIView()
    vw.backgroundColor = UIColor.systemGray5
        return vw
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! MainTableViewCell
        let name = settings[indexPath.section][indexPath.row]
        cell.settingsLabel.text = name.settingName
        cell.settingsSwitch.isHidden = true
        if name.shouldShowSwitch == true{
            cell.settingsSwitch.isHidden = false
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
