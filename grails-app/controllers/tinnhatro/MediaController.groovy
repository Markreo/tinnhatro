package tinnhatro

import com.tinnhatro.Photo
import grails.plugin.springsecurity.annotation.Secured
import grails.util.Holders

@Secured(['ROLE_ADMIN', 'ROLE_SYSADMIN'])
class MediaController {

    def index() { }

    @Secured('permitAll')
    def getImage(String id) {
        String path = id != 'undefined' ? Photo.get(id)?.path : ''

        File file = new File(path)
        if(!file.length() || !path) {
            file = new File("${Holders.config.folder.item}")
        }
        response.setHeader('Content-length', file.size().toString())
        response.contentType = "image/jpg" // or the appropriate image content type
        response.outputStream << file.bytes
        response.outputStream.flush()

    }

    @Secured('permitAll')
    def getVideo(String id) {

    }
}
