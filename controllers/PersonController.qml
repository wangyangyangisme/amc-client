import QtQuick 2.4

import "../scripts/servReq.js" as F
import "../scripts/globals.js" as G
import "." as L
Item {
    property alias model1: model1.model
    property alias model2: model2.model
    property alias model3: model3.model
    property alias ready: http.ready
    property int readyId
    property alias jsn: http.jsn
    property alias status: http.status

    property alias m1ready: model1.ready
    property alias m1status: model1.status



    id: peopleController
    Component.onCompleted: {
        F.internalQmlObject.servDone.connect(internalRefresh);

        //G.apiRoot=Qt.platform.os == "android" ? "192.168.0.103:8080" : "127.0.0.1:8080"

    }
    L.JSONListModel {
        id:model1
    }
    L.JSONListModel {
        id:model2
    }
    L.JSONListModel {
        id:model3
    }
    function internalRefresh(callid) {
        peopleController.readyId = callid
        if (callid == 2) {
            peopleController.ready = true
            getAll()
        }
    }
    function getAll() {

        model1.method = "GET"
        model1.source = ""
        model1.source = G.apiRoot + "/people"
        //console.log("source ", model1.source)
        model1.commit()
    }
    function getPerson(pid) {
        model2.method = "GET"
        model2.source = ""
        model2.source = G.apiRoot + "/people/" + pid.toString()
        model2.commit()
    }
    function getPersonRoles(pid) {
        model3.method = "GET"
        model3.source = ""
        model3.source = G.apiRoot + "/people/" + pid.toString() + "/roles"
        model3.commit()

    }

    function newPerson(user){
        peopleController.ready = false
        var method = 'POST';
        var params =  user;
        var url = G.apiRoot + "/people";
        http.servReq(method, params, url, 2)
    }

    function newPersonRole(pid,rid) {
        peopleController.ready = false
        var method = 'POST';
        var params =  JSON.stringify({role_id: rid});

        //console.log(params)

        var url = G.apiRoot + "/people/"  + pid.toString() + "/roles";
        http.servReq(method, params, url, 2)
    }


    function updatePerson(role, rid) {
        peopleController.ready = false
        var method = "PUT"
        var params = role
        var url = G.apiRoot + "/people/" + rid.toString()
        http.servReq(method, params, url, 2)
    }
    function deletePerson(pid) {
        peopleController.ready = false
        var method = "DELETE"
        var params = ""
        var url = G.apiRoot + "/people/" + pid.toString()
        http.servReq(method, params, url, 2)
    }
    function deletePersonRole(pid,rid) {
        peopleController.ready = false
        var method = 'DELETE';
        var params =  JSON.stringify({role_id: rid});

        //console.log(params)

        var url = G.apiRoot + "/people/"  + pid.toString() + "/roles/?role_id=" + rid.toString();
        http.servReq(method, params, url, 2)
    }
    L.HTTP {
        id: http

    }
}

