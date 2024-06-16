import UIKit
import SwiftUI

class SimpleViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    func mimeType(for data: Data) -> String {
        var b: UInt8 = 0
        data.copyBytes(to: &b, count: 1)
        switch b {
        case 0xFF:
            return "image/jpeg"
        case 0x89:
            return "image/png"
        case 0x47:
            return "image/gif"
        case 0x49, 0x4D:
            return "image/tiff"
        case 0x52:
            // Check for 'RIFF' which indicates WebP
            if data.count >= 12, let string = String(data: data[0...11], encoding: .ascii), string.hasPrefix("RIFF") {
                return "image/webp"
            }
        default:
            return "application/octet-stream"
        }
        return "application/octet-stream" // Default type
    }
    
    
    // UI Elements
    private var imageView: UIImageView!
    private var uploadButton: UIButton!
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupUI()
//    }
//    
//    private func setupUI() {
//        // Image View Setup
//        imageView = UIImageView(frame: CGRect(x: 20, y: 50, width: self.view.frame.width - 40, height: 300))
//        imageView.contentMode = .scaleAspectFit
//        imageView.backgroundColor = .lightGray
//        self.view.addSubview(imageView)
//        
//        // Choose Image Button
//        let chooseImageButton = UIButton(frame: CGRect(x: 50, y: 360, width: self.view.frame.width - 100, height: 50))
//        chooseImageButton.setTitle("Choose Image", for: .normal)
//        chooseImageButton.backgroundColor = .blue
//        chooseImageButton.addTarget(self, action: #selector(promptForImage), for: .touchUpInside)
//        self.view.addSubview(chooseImageButton)
//        
//        // Upload Button Setup
//        uploadButton = UIButton(frame: CGRect(x: 50, y: 420, width: self.view.frame.width - 100, height: 50))
//        uploadButton.setTitle("Upload Image", for: .normal)
//        uploadButton.backgroundColor = .black
//        uploadButton.addTarget(self, action: #selector(uploadImage), for: .touchUpInside)
//        uploadButton.isEnabled = false  // Disabled initially
//        self.view.addSubview(uploadButton)
//    }
//    
//    @objc func promptForImage() {
//        let imagePicker = UIImagePickerController()
//        imagePicker.delegate = self
//        imagePicker.sourceType = .photoLibrary
//        self.present(imagePicker, animated: true, completion: nil)
//    }
//    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        picker.dismiss(animated: true)
//        
//        if let image = info[.originalImage] as? UIImage {
//            imageView.image = image
//            uploadButton.isEnabled = true  // Enable upload button after image is selected
//        }
//    }
    
    @objc func uploadImage() {
        guard let image = imageView.image,
              let imageData = image.jpegData(compressionQuality: 0.8) else { return }  // Convert image to JPEG

        // Create URL request
        let url = URL(string: "http://52.87.212.144:8000/upload")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        // Create multipart form data
        let boundary = "Boundary-\(UUID().uuidString)"
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        var body = Data()
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"image\"; filename=\"image3.jpeg\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
        body.append(imageData)
        body.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)

        // Send the request
        request.httpBody = body

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Upload error: \(error.localizedDescription)")
                return
            }
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                print("Image uploaded successfully")
            } else {
                print("Failed to upload image")
            }
            if let data = data, let responseString = String(data: data, encoding: .utf8) {
                print("Server response: \(responseString)")
            }
        }.resume()
    }
}

// SwiftUI view that hosts the UIKit view controller
struct SimpleViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> SimpleViewController {
        SimpleViewController()
    }
    
    func updateUIViewController(_ uiViewController: SimpleViewController, context: Context) {
        // Update the view controller if needed
    }
}

// SwiftUI Preview Provider
struct SimpleViewController_Previews: PreviewProvider {
    static var previews: some View {
        SimpleViewControllerWrapper()
            .edgesIgnoringSafeArea(.all)
    }
}
