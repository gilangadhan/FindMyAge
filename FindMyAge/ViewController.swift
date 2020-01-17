//
//  ViewController.swift
//  FindMyAge
//
//  Created by Gilang Ramadhan on 15/01/20.
//  Copyright © 2020 Dicoding Indonesia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // ini adalah variabel dari datePicker dan ageLabel
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var ageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

     // ini adalah aksi click dari button
    @IBAction func calculateMyAge(_ sender: Any) {
        // mengambil tanggal dari datePicker
        let birthDate = self.datePicker.date
        // yyyy-mm-dd hh:mm:ss +0000
        
        // mengambil tanggal terbaru
        let today = Date()
        
        // melakukan pengecekan tanggal hari dengan tanggal datepicker
        if birthDate >= today{
            // menambahkan alert
            let alertController = UIAlertController(title: "Error", message: "Masukkanlah tanggal yang valid!", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ya", style: .default, handler: nil)
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion: nil)
            return
        }
        
        // mendapatkan data dari calendar
        let calendar = Calendar.current
        
        // nilai yang berisi dari tahun, bulan dan hari
        let components = calendar.dateComponents([.year, .month, .day], from: birthDate, to: today)
        
        // untuk menambung tahun, bulan dan hari
        guard let ageYears = components.year else {return}
        guard let ageMonths = components.month else {return}
        guard let ageDays = components.day else {return}
        
        // digunakan untuk informasi selisih tahun, bulan dan hari
        self.ageLabel.text = "\(ageYears) tahun, \(ageMonths) bulan, \(ageDays) hari"
    }
}

