import QtQuick 2.9
import QtQuick.Window 2.12
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.3
import QtQuick.Layouts 1.3

import Models 1.0

Dialog {
    id: addNotaDialog
    title: "Nova nota"
    x: parent.width/2 - addNotaDialog.width/2
    y: parent.height/2 - addNotaDialog.height/2


    property var notaId: ""
    signal cancelPressed()
    signal okPressed(string id, string titulo, string descricao)

    function clearFields() {
        tituloField.clear()
        descricaoField.clear()
    }

    function setFields(nota) {
        notaId = nota.id
        tituloField.text = nota.titulo
        descricaoField.text = nota.descricao
    }

    ColumnLayout {
        TextField{
            id: tituloField
            placeholderText: "Titulo"
        }
        TextField{
            id: descricaoField
            placeholderText: "Descricao"
//            validator: RegExpValidator { regExp: /[0-9]*/ }
        }
//        TextField{
//            id: priceField
//            placeholderText: "Preço"
//            validator: RegExpValidator { regExp: /[0-9]*.[0-9]{2}/ }
//        }
        RowLayout {
            Button {
                text: "Cancelar"
                flat: true
                Material.foreground: "#C62828"
                onPressed: {
                    cancelPressed()
                }
            }
            Button {
                text: "Ok"
                flat: true
                Material.foreground: "#146d99"
                enabled: (!tituloField.text == ""
                          && !descricaoField.text == "")
//                          && priceField.text.split(".")[1] != "")

                onPressed: {
                    okPressed(notaId, tituloField.text, descricaoField.text) /*Number(priceField.text), Number(calorieField.text))*/
                }
            }
        }
    }
}
