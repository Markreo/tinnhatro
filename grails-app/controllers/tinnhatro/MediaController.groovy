package tinnhatro

import com.tinnhatro.Photo
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_SYSADMIN'])
class MediaController {

    def index() { }

    @Secured('permitAll')
    def getImage(String id) {
        String path = Photo.get(id)?.path
        if(path) {
            File file = new File(path)
            if(!file.length()) {
                //println("${grailsAttributes.getApplicationContext().getResource("grails-app\\assets\\images\\default-item.png").getFile()}")
                //D:\Project\tinnhatro\src\main\webapp\grails-app\assets\images\default-item.png
                file = new File('D:\\Project\\tinnhatro\\grails-app\\assets\\images\\default-item.png')
            }

            response.setHeader('Content-length', file.size().toString())
            response.contentType = "image/jpg" // or the appropriate image content type
            response.outputStream << file.bytes
            response.outputStream.flush()
        }
    }

    @Secured('permitAll')
    def getVideo(String id) {

    }
}
