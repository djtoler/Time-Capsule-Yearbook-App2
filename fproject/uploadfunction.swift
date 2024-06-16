//import SwiftUI
//
//struct ImageUploader {
//    func uploadImages(_ images: [UIImage]) {
//        let url = URL(string: "54.197.82.22:8000/upload")!
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//
//        let boundary = "Boundary-\(UUID().uuidString)"
//        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
//
//        var body = Data()
//
//        for (index, image) in images.enumerated() {
//            guard let imageData = image.jpegData(compressionQuality: 0.8) else { continue }
//            let filename = "image\(index + 1).jpeg"
//            body.append("--\(boundary)\r\n".data(using: .utf8)!)
//            body.append("Content-Disposition: form-data; name=\"image\(index + 1)\"; filename=\"\(filename)\"\r\n".data(using: .utf8)!)
//            body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
//            body.append(imageData)
//            body.append("\r\n".data(using: .utf8)!)
//        }
//
//        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
//
//        request.httpBody = body
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print("Upload error: \(error.localizedDescription)")
//                return
//            }
//            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
//                print("Images uploaded successfully")
//            } else {
//                print("Failed to upload images")
//            }
//            if let data = data, let responseString = String(data: data, encoding: .utf8) {
//                print("Server response: \(responseString)")
//            }
//        }.resume()
//    }
//}
//
//
//func mimeType(for data: Data) -> String {
//    var b: UInt8 = 0
//    data.copyBytes(to: &b, count: 1)
//    switch b {
//    case 0xFF:
//        return "image/jpeg"
//    case 0x89:
//        return "image/png"
//    case 0x47:
//        return "image/gif"
//    case 0x49, 0x4D:
//        return "image/tiff"
//    case 0x52:
//        if data.count >= 12, let string = String(data: data[0...11], encoding: .ascii), string.hasPrefix("RIFF") {
//            return "image/webp"
//        }
//    default:
//        return "application/octet-stream"
//    }
//    return "application/octet-stream" 
//}
