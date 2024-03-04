//
//  DetailPetViewController.swift
//  Network&APITask
//
//  Created by Nada Alshaibani on 04/03/2024.
//

import UIKit
import SnapKit
import Kingfisher

class DetailPetViewController: UIViewController {

    var pet: Pet?
   
    var imageView = UIImageView()
    var recievedName = UILabel()
    var recievedGender = UILabel()
    var recievedAdopted = UILabel()
    var recievedAge = UILabel()
    var recievedId = UILabel()
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Pet Details"
        // Do any additional setup after loading the view.
        
        view.addSubview(imageView)
        view.addSubview(recievedName)
        view.addSubview(recievedGender)
        view.addSubview(recievedAdopted)
        view.addSubview(recievedAge)
        view.addSubview(recievedId)
        
        let url = URL(string: pet?.image ?? "")
        imageView.kf.setImage(with: url)
        
        setupLAyout()
        configureWithPet()
    }
    
    func configureWithPet(){
        imageView.image = UIImage(named: pet?.image ?? "")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        recievedName.text = "name: \(pet?.name ?? "")"
        recievedGender.text = "Gender: \(pet?.gender ?? "")"
        recievedAge.text = "Age: \(pet?.age ?? 0)"
        recievedAdopted.text = "Adopted? \(pet?.adopted ?? false)"
        recievedId.text = "Pet ID: \(pet?.id ?? 0)"
        
    }
    func setupLAyout(){
           imageView.snp.makeConstraints { make in
               make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
               make.centerX.equalToSuperview()
               make.width.height.equalTo(200)
           }

           recievedName.snp.makeConstraints { make in
               make.top.equalTo(imageView.snp.bottom).offset(60)
               make.centerX.equalToSuperview()
           }

           recievedAge.snp.makeConstraints { make in
               make.top.equalTo(recievedName.snp.bottom).offset(60)
               make.centerX.equalToSuperview()
           }

           recievedAdopted.snp.makeConstraints { make in
               make.top.equalTo(recievedAge.snp.bottom).offset(60)
               make.centerX.equalToSuperview()
           }
           recievedGender.snp.makeConstraints { make in
               make.top.equalTo(recievedAdopted.snp.bottom).offset(60)
               make.centerX.equalToSuperview()
           }
        recievedId.snp.makeConstraints { make in
            make.top.equalTo(recievedGender.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
        }
    
       }

    

}
