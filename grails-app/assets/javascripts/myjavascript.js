/**
 * Created by giapn on 4/16/2017.
 */
function createLink(params) {
    if (params.hasOwnProperty('uri')) {
        if(params.uri.indexOf('/') !=0){
            return contextPath + "/" + params.uri;
        } else{
            return contextPath + params.uri;
        }
    } else if (params.hasOwnProperty('controller') && params.hasOwnProperty('action')) {
        if (params.hasOwnProperty('id')) {
            return contextPath + '/' + params.controller + '/' + params.action + '/' + params.id;
        }
        return contextPath + '/' + params.controller + '/' + params.action;
    }
    return contextPath;
}