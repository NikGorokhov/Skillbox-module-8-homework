
import UIKit

struct Meetup{
    var head = ""
    var imageIcon: [String] = []
    var settings: [String] = []
}

class MeetupFabric {
    static func meetpus() -> [Meetup]{
        return [
            Meetup(head: " ", imageIcon: ["Авиарежим", "Wi-Fi", "Основные", "Сотовая связь", "Режим модема"], settings: ["Авиарежим", "Wi-Fi", "Bluetooth", "Сотовая связь", "Режим модема"]),
            Meetup(head: " ", imageIcon: ["Уведомления", "Звуки, тактильные сигналы", "Не беспокоить", "Экранное время"], settings: ["Уведомления", "Звуки, тактильные сигналы", "Не беспокоить", "Экранное время"]),
            Meetup(head: " ", imageIcon: ["Основные", "Wi-Fi", "Сотовая связь", "Режим модема", "Wi-Fi", "Основные", "Сотовая связь", "Экстренный вызов - SOS", "Аккумулятор", "Конфиденциальность"], settings: ["Основные", "Пункт управления", "Экран и яркость", "Универсальный доступ", "Обои", "Siri и Поиск", "Touch ID и код-пароль", "Экстренный вызов - SOS", "Аккумулятор", "Конфиденциальность"]),
        ]
    }
}

class SecondViewController: UIViewController {
    var meetups = MeetupFabric.meetpus()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return meetups.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meetups[section].settings.count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Header") as! SettingsTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell") as! SettingsTableViewCell
        let nameSetting = meetups[indexPath.section].settings[indexPath.row]
        cell.settingLabel.text = nameSetting
        if cell.settingLabel.text == "Авиарежим" {
            cell.accessoryType = .none
            cell.airplaneSwitch.isHidden = false
        } else if cell.settingLabel.text == "Wi-Fi" {
            cell.attributeLabel.text = "Anvics-YOTA"
        } else if cell.settingLabel.text == "Bluetooth" {
            cell.attributeLabel.text = "Вкл."
        } else if cell.settingLabel.text == "Основные" {
            cell.badgeLabel.isHidden = false
        }
        let iconSetting = meetups[indexPath.section].imageIcon[indexPath.row]
        cell.iconImageView.image = UIImage(named: iconSetting)
        return cell
    }
}
