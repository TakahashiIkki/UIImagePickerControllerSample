//
//  ViewController.swift
//  UIImagePickerControllerSample
//
//  Created by 一騎高橋 on 2016/07/01.
//  Copyright © 2016年 IkkiTakahashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var cameraView: UIImageView!
    
    @IBOutlet weak var cameraStartButton: UIButton!
    @IBOutlet weak var photoSaveButton: UIButton!
    @IBOutlet weak var showAlbumButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cameraStart(sender: AnyObject) {
        let sourceType = UIImagePickerControllerSourceType.Camera
        
        // カメラが利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.presentViewController(cameraPicker, animated: true, completion: nil)
        } else {
            print("error")
        }
        
    }
    
    // 撮影完了後に呼ばれる
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            cameraView.contentMode = .ScaleAspectFit
            cameraView.image = pickedImage
        }
        
        // 閉じる処理
        picker.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    // 撮影がキャンセルされた後に呼ばれる
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // 写真を保存
    @IBAction func savePhoto(sender: AnyObject) {
        let image: UIImage! = cameraView.image
        
        if image != nil {
            UIImageWriteToSavedPhotosAlbum(image, self, #selector(ViewController.image(_:didFinishSavingWithError:contextInfo:)), nil)
            
        } else {
            print("image Failed")
        }
    }
    
    // 書き込み完了結果の受け取り
    func image(image: UIImage, didFinishSavingWithError error: NSError!, contextInfo: UnsafeMutablePointer<Void>) {
        if error != nil {
            print(error.code)
        } else {
            
        }
    }
    
    // アルバムを表示
    @IBAction func showAlbum(sender: AnyObject) {
        let sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.presentViewController(cameraPicker, animated: true, completion: nil)
        } else {
            print("error")
        }
    }
    
}

