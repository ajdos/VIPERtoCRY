//
//  CreateProfileViewController.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 29.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

protocol CreateViewInput: class {
    
}

class CreateViewController: UIViewController {
    
    var presenter: CreateViewOutput?
    var photo = UIImageView()
    var nameTF = UITextField()
    var birthdayPicker = UIDatePicker()
    var phoneNumberTF = UITextField()
    var aboutTextView = UITextView()
    var imageIsChanged = false
    var choiseImage = UIButton()
    var scrollView = UIScrollView()
    var pickBirthLabel = UILabel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
        setupNavigationBar()
        aboutTextView.delegate = self
        self.navigationItem.hidesBackButton = true
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    @objc private func keyboardDidShow(notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        self.scrollView.contentSize = CGSize(width: self.view.bounds.width, height: self.view.bounds.height + keyboardSize.height)
        self.scrollView.showsVerticalScrollIndicator = false
    }
    @objc private func keyboardDidHide() {
        self.scrollView.contentSize = CGSize(width: self.view.bounds.width, height: self.view.bounds.height)
    }
    
    @objc private func saveTap() {
        presenter?.saveButtonTapped(photo: photo.image, phoneNumber: phoneNumberTF.text, about: aboutTextView.text, birthday: birthdayPicker.date)
    }
    @objc private func imagePickerTap() {
        let cameraIcon = #imageLiteral(resourceName: "camera")
        let photoIcon = #imageLiteral(resourceName: "photo")
        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let camera = UIAlertAction(title: "Camera", style: .default) { _ in
            self.chooseImagePicker(source: .camera)}
        camera.setValue(cameraIcon, forKey: "image")
        camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
        
        let photo = UIAlertAction(title: "Photo", style: .default) { _ in
            self.chooseImagePicker(source: .photoLibrary)}
        photo.setValue(photoIcon, forKey: "image")
        photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        actionSheet.addAction(camera)
        actionSheet.addAction(photo)
        actionSheet.addAction(cancel)
        
        present(actionSheet, animated: true)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension CreateViewController: CreateViewInput {
    
}

extension CreateViewController {
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        setDarkNavigationBar()
        setTitleColor(color: .white)
        setSaveBarButtonItem(tintColor: .white, target: self, action: #selector(saveTap))
        self.title = "Create your profile"
    }
    private func setupSubViews() {
        view.backgroundColor = .orange
        
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 4000)
        view.addSubview(scrollView)
        scrollView.autoPinEdgesToSuperviewEdges()
        photo.clipsToBounds = true
        photo.contentMode = .scaleAspectFill
        photo.target(forAction: #selector(imagePickerTap), withSender: nil)
        photo.image = #imageLiteral(resourceName: "images")
        photo.autoSetDimensions(to: CGSize(width: 130, height: 130))
        photo.layer.cornerRadius = 65
        
        choiseImage.backgroundColor = .black
        choiseImage.autoSetDimensions(to: CGSize(width: view.bounds.size.width / 2, height: 45))
        choiseImage.setTitle("Choise photo", for: .normal)
        choiseImage.tintColor = .white
        choiseImage.clipsToBounds = true
        choiseImage.layer.cornerRadius = 15
        choiseImage.addTarget(self, action: #selector(imagePickerTap), for: .touchUpInside)
        
        
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 20
        stackView.addArrangedSubview(photo)
        stackView.addArrangedSubview(choiseImage)
        scrollView.addSubview(stackView)
        stackView.autoSetDimensions(to: CGSize(width: view.bounds.size.width, height: view.bounds.size.height / 4))
        stackView.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
        stackView.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
        stackView.autoPinEdge(toSuperviewEdge: .right, withInset: 20)
        
        phoneNumberTF.placeholder = "Phone Number"
        phoneNumberTF.backgroundColor = .white
        phoneNumberTF.keyboardType = .numberPad
        phoneNumberTF.borderStyle = .roundedRect
        phoneNumberTF.clearButtonMode = .whileEditing
        phoneNumberTF.keyboardAppearance = .dark
        phoneNumberTF.returnKeyType = .default
        scrollView.addSubview(phoneNumberTF)
        phoneNumberTF.layer.masksToBounds = true
        phoneNumberTF.autoSetDimension(.height, toSize: 50)
        phoneNumberTF.autoAlignAxis(toSuperviewAxis: .vertical)
        phoneNumberTF.autoPinEdge(.top, to: .bottom, of: stackView, withOffset: 10)
        phoneNumberTF.autoPinEdge(toSuperviewEdge: .right, withInset: 30)
        phoneNumberTF.autoPinEdge(toSuperviewEdge: .left, withInset: 30)
        
        
        
        
        textViewDidEndEditing(aboutTextView)
        textViewDidBeginEditing(aboutTextView)
        aboutTextView.backgroundColor = .white
        aboutTextView.keyboardType = .default
        
        aboutTextView.autocapitalizationType = .allCharacters
        aboutTextView.textAlignment = .justified
        aboutTextView.keyboardAppearance = .dark
        aboutTextView.returnKeyType = .default
        scrollView.addSubview(aboutTextView)
        aboutTextView.text = "Tell other people about yourself..."
        aboutTextView.textColor = UIColor.lightGray
        aboutTextView.font = .italicSystemFont(ofSize: 18)
        aboutTextView.clipsToBounds = true
        aboutTextView.layer.cornerRadius = 5
        aboutTextView.autoSetDimension(.height, toSize: 150)
        aboutTextView.autoAlignAxis(toSuperviewAxis: .vertical)
        aboutTextView.autoPinEdge(.top, to: .bottom, of: phoneNumberTF, withOffset: 10)
        aboutTextView.autoPinEdge(toSuperviewEdge: .right, withInset: 30)
        aboutTextView.autoPinEdge(toSuperviewEdge: .left, withInset: 30)
        
        pickBirthLabel.text = "Pick your birthday:"
        pickBirthLabel.font = .italicSystemFont(ofSize: 18)
        pickBirthLabel.textColor = .black
        pickBirthLabel.textAlignment = .left
        pickBirthLabel.numberOfLines = 1
        scrollView.addSubview(pickBirthLabel)
        pickBirthLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 30)
        pickBirthLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 30)
        pickBirthLabel.autoPinEdge(.top, to: .bottom, of: aboutTextView, withOffset: 10)
        
        birthdayPicker.datePickerMode = .date
        birthdayPicker.backgroundColor = .white
        birthdayPicker.tintColor = .orange
        scrollView.addSubview(birthdayPicker)
        birthdayPicker.clipsToBounds = true
        birthdayPicker.layer.cornerRadius = 5
        birthdayPicker.autoSetDimension(.height, toSize: 150)
        birthdayPicker.autoAlignAxis(toSuperviewAxis: .vertical)
        birthdayPicker.autoPinEdge(.top, to: .bottom, of: pickBirthLabel, withOffset: 10)
        birthdayPicker.autoPinEdge(toSuperviewEdge: .right, withInset: 30)
        birthdayPicker.autoPinEdge(toSuperviewEdge: .left, withInset: 30)
        
        
        
    }
}
extension CreateViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        photo.image = info[.editedImage] as? UIImage
        photo.contentMode = .scaleAspectFill
        photo.clipsToBounds = true
        imageIsChanged = true
        dismiss(animated: true)
    }
}

extension CreateViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
            textView.font = .boldSystemFont(ofSize: 24)
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Tell other people about yourself..."
            textView.textColor = UIColor.lightGray
            textView.font = .italicSystemFont(ofSize: 18)
        }
    }
}
