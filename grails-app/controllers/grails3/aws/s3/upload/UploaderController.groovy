package grails3.aws.s3.upload

import org.springframework.web.multipart.MultipartFile
import com.amazonaws.services.s3.model.ObjectListing
import com.amazonaws.services.s3.model.S3ObjectSummary

class UploaderController {

  def amazonS3Service

  def index() {
    ObjectListing listObjects = amazonS3Service.listObjects('djamblog', 'testupload/')
    List<S3ObjectSummary> objectSummary = listObjects.getObjectSummaries()

    [objects: objectSummary]
  }

  def uploadFile() {
    MultipartFile multipartFile = request.getFile('file')
    if(multipartFile && !multipartFile.empty) {
      amazonS3Service.storeMultipartFile('djamblog', 'testupload/'+multipartFile.originalFilename, multipartFile)

      flash.message = "File "+multipartFile.originalFilename+" uploaded successfully"
      redirect controller: "uploader"
    } else {
      flash.message = "Upload failed"
      redirect controller: "uploader"
    }
  }

  def deleteFile() {
    def found = amazonS3Service.exists('djamblog', params.filekey)
    if(found) {
      amazonS3Service.deleteFile('djamblog', params.filekey)
      flash.message = "File "+params.filekey+" deleted"
      redirect controller: "uploader"
    }
  }
}
