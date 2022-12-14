//
//  TopViewController.swift
//
//  "TopViewController" was created based on the following repositories and articles.
//  GitHub          : https://github.com/tukuyo/AirPodsPro-Motion-Sampler
//  Article (Qiita) : https://qiita.com/tukutuku_tukuyo/items/ea949ee2dbb499d6e7ca
//

import UIKit

class TopViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private lazy var table: UITableView = {
        let table = UITableView(frame: self.view.bounds, style: .plain)
        table.autoresizingMask = [
          .flexibleWidth,
          .flexibleHeight
        ]
        table.rowHeight = 60
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    private var items: [UIViewController] = [InformationViewController(), SK3DViewController(), BLEViewController(), ExportCSVViewController()]
    private var itemTitle: [String] = ["加速度センサ情報", "姿勢追従3Dアニメーション", "周囲Bluetooth受信", "センサ情報CSV化"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "AirPodsPro加速度センサAPIデモ"
        
        table.dataSource = self
        table.delegate = self
        view.addSubview(table)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = itemTitle[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(items[indexPath.row], animated: true)
    }

}
