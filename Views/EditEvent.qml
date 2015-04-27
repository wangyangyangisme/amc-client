import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2
import QtQuick.LocalStorage 2.0
import QtQuick.Controls.Styles 1.2
import QtQuick.Window 2.2
import "." as Local
import "../controllers" as Cont
import "../scripts/moment.js" as D
import "../components" as Comp
Rectangle {
    id: editev

    property var index
    property var setDate
    width: parent.width
    height: parent.height



    Component.onCompleted:  {
        if (visible) {

        console.log("Booooo",Screen.width,Screen.height)
        if (editev.index > 0 ) {
            cont1.getEvent(editev.index)
        }
        else {
            df1.date = editev.setDate
        }
        }
    }
    //x: (Screen.desktopAvailableWidth - width)/2
    //y: (Screen.desktopAvailableHeight - height)/2
    signal returning(string whereFrom)





Rectangle {
    id: top
    width: parent.width
    height: parent.height
    color: "linen"
    property int actionheight

    onVisibleChanged: {
        if (visible) {

        console.log("Booooo",Screen.width,Screen.height)
        if (editev.index > 0 ) {
            cont1.getEvent(editev.index)
        }
        else {
            df1.date = editev.setDate
        }
        }
    }

   function initModel() {
        //console.log("init")
        if (cont1.model2.count > 0) {
        // console.log("doinit")
        textField1.text = cont1.model2.get(0).title
        df1.date = cont1.model2.get(0).eventdate
        te1.time = cont1.model2.get(0).eventstart
        te2.time = cont1.model2.get(0).eventend
         if (cont1.model2.get(0).volunteersheets.count) {
             sheets.visible = true
             actionheight = 4
         }
         else {
             sheets.visible = false
             actionheight = 3
         }

        }

    }
   function stringUp() {

       var jsn = {"event":{"title": textField1.text, "eventdate": df1.date, "eventstart": te1.time, "eventend": te2.time }}
       return JSON.stringify((jsn))

   }


        Row {
            height: parent.height
            width: parent.width

        Column {
            id: column2
            //anchors.left: parent.left
            height:parent.height
            //anchors.top: eventSelect.bottom
            //anchors.bottom: parent.bottom
            width: parent.width*7/16

            Rectangle {

                width: parent.width
                y: parent.height/5
                color: "beige"
                radius: 4
                height: parent.height/5



            Text {
                id: text1

                text: qsTr("Title")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: parent.width/6
                verticalAlignment: Text.AlignVCenter


            }
            }
            Rectangle {
                width: parent.width
                color: "beige"
                radius: 4
                height: parent.height/5

            Text {
                id: text2

                text: qsTr("Date")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: parent.width/6
                verticalAlignment: Text.AlignVCenter
                height: parent.height

            }
            }
            Rectangle {
                width: parent.width
                color: "beige"
                radius: 4
                height: parent.height/5

            Text {
                id: text3

                text: qsTr("Start time")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: parent.width/6
                verticalAlignment: Text.AlignVCenter
                height: parent.height

            }
            }
            Rectangle {
                width: parent.width
                color: "beige"
                radius: 4
                height: parent.height/5

            Text {
                id: text4

                text: qsTr("End")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: parent.width/6
                verticalAlignment: Text.AlignVCenter
                height: parent.height
            }


            }
            Rectangle {
                width: parent.width
                color: "beige"
                radius: 4
                height: parent.height/5

            Text {
                id: text5

                text: qsTr("Type")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: parent.width/6
                verticalAlignment: Text.AlignVCenter
                height: parent.height


            }
            }
        }

        Rectangle {
            id: rectangle1
            //anchors.left: column2.right
            //anchors.top: eventSelect.bottom
            //anchors.bottom: parent.bottom
            height:parent.height
            width: parent.width/8


            color: "#ffffff"

            MouseArea {
                anchors.fill: parent
                onClicked: {

 //                   entry.lists.loaded = top.record
   //                 console.log("mmm", entry.lists.loaded.date)
     //               entry.pop()
                }
            }
            Column {
                width: parent.width
                height: parent.height

            Rectangle {
                id: upcreate
                radius: 6
                width: parent.width
                height: parent.height/top.actionheight
                color: "lightyellow"
                Text {
                    anchors.verticalCenter:  parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: editev.index === 0 ? "Create" : "Update"
                }
                MouseArea {
                    width: parent.width
                    height: parent.height
                    onClicked:  {
                        if (editev.index > 0) {
                            //tim2.dt = D.moment(entry.lists.loaded.date)
                            cont1.updateEvent(top.stringUp(), editev.index)
                            console.log(top.stringUp())

                            //tim2.start()
                        }
                        else {
                            //top.newp = false
                            //entry.lists.update = true
                            //entry.lists.create = false
                            //tim2.dt = D.moment(entry.lists.loaded.date)
                            cont1.newEvent(top.stringUp())
                            console.log(top.stringUp())

                            //tim2.start()


                        }


                    }
                }

            }
            Rectangle {
                id: save
                radius: 6
                width: parent.width
                height: parent.height/top.actionheight
                color: "skyblue"
                Text {
                    anchors.verticalCenter:  parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "New"
                }
                MouseArea {
                    width: parent.width
                    height: parent.height
                    onClicked:  {
                        console.log(editev.index)
                        if (editev.index > 0 ) {
                            cont1.getEvent(index)
                        }

 //                       top.record.id_type_ae = cont1.model3.get(0).id_amc_event_type




                    }
                }

            }
            Rectangle {
                id: del
                radius: 6
                width: parent.width
                height: parent.height/top.actionheight
                color: "red"
                Text {
                    anchors.verticalCenter:  parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Delete"
                }
                MouseArea {
                    width: parent.width
                    height: parent.height
                    onClicked:  {

                       cont1.deleteEvent(editev.index)


                    }
                }
            }
            Rectangle {
                id: sheets
                radius: 6
                width: parent.width
                height: parent.height/top.actionheight
                color: "steelblue"
                visible: false
                Text {
                    anchors.verticalCenter:  parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Volunteer Sheet"
                }
                MouseArea {
                    width: parent.width
                    height: parent.height
                    onClicked:  {

                       entry.push({item: sheet, properties: {index: editev.index}})


                    }
                }
            }
            }
        }
        Column {
            id: column1
            //anchors.left: rectangle1.right
            //anchors.top: eventSelect.bottom
            //anchors.bottom: parent.bottom
            height:parent.height
            width: parent.width*7/16


            TextField {
                id: textField1

                width: parent.width
                placeholderText: qsTr("Text Field")

                height: parent.height/5
                onEditingFinished: {


                }
            }

            Comp.DateEdit {
                id: df1

                width: parent.width
                height: parent.height/5
                ratio: 0.8
                bcolor: "white"
                //date:
                onGoodDateChanged: {
                    //if (!top.newp) entry.lists.update = true
                   // else entry.lists.create = true
                    //console.log(date,top.record.date)
                    //top.record.events.date = D.moment(date).format("YYYY-MM-DD")
                    //console.log(date,top.record.events.date)
                }

            }


            Comp.TimeEdit {
                id: te1
                width: parent.width
                //time:
                height: parent.height/5
                ratio: 0.8
                bcolor: "white"
                onTimeChanged: {

                }
                onFocusChanged: {
                    if (!focus) {
                        Qt.inputMethod.hide()
                    }
                }

            }
            Comp.TimeEdit {
                id:te2
                width: parent.width
                //time:
                height: parent.height/5
                ratio: 0.8
                bcolor: "white"
                onTimeChanged: {

                }
                onFocusChanged: {
                    if (!focus) {
                        Qt.inputMethod.hide()
                    }
                }

            }

        }
        }
        Component {
            id:sheet
        Local.EditVolunteerSheet {

        }
        }

    Cont.EventController {
        id:cont1
        onM2readyChanged: {
            if (m2status == 200) {
                 top.initModel()
            }
        }

        onReadyChanged: {
            console.log("readyChangedevcomp")

                if (status == 200) {
                    //GET
                    top.initModel()

                }
                if (status == 201) {
                    //POST
                    //cont1.getAll()
                    console.log("popop")
                    editev.returning("Post")
                    //editev.parent.repop()
                    if (ready) entry.pop()



                }
                if (status == 202) {
                    //PUT
                    editev.returning("Put")
                    console.log("popop")
                    //editev.parent.repop()
                     if (ready) entry.pop()

                }
                if (status == 203) {
                    //PUT
                    //cont1.getAll()

                }
                if (status == 204) {
                    //DELETE
                   // cont1.getAll()
                    editev.returning("Delete")
                    console.log("popop")
                    //editev.parent.repop()
                     if (ready) entry.pop()

                }
                if (status == 422) {

                    //error
                    console.log(JSON.stringify(JSON.parse(jsn).errors))
                    entry.status = JSON.stringify(JSON.parse(jsn).errors)


                }
        }

    }
}
}




