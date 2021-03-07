import QtQuick 2.9
import QtQuick.Window 2.12
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.3
import QtQuick.Layouts 1.3

import Models 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Qt Dev.Academy")
    color: "#fafafa"

    RemoveNotaDialog {
        id: removeNotaDialog
        onAccepted: {
            dbNotas.deleteRow(nota.id)
        }
        title: "Excluir nota?"
    }

    AddNotaDialog {
        id: addNotaDialog
        onCancelPressed: {
            addNotaDialog.clearFields()
            addNotaDialog.close()
        }
        onOkPressed: {
            dbNotas.newRow(titulo, descricao)
            addNotaDialog.clearFields()
            addNotaDialog.close()
        }
    }

    AddNotaDialog {
        id: updateNotaDialog
        title: "Editar nota"
        onCancelPressed: {
            updateNotaDialog.close()
        }
        onOkPressed: {
            dbNotas.updateRow(id, titulo, descricao)
            updateNotaDialog.close()
        }
    }

    NotaDatabaseModel {
        id: dbNotas
    }

    ListModel {
        id: carrinho
        function getTotal() {
            let total = 0;
            for(let i = 0; i < carrinho.rowCount(); i++) {
                total += 1 * carrinho.get(i).quantidade
            }
            return total;
        }
    }

    ColumnLayout {
        anchors.fill: parent

        RowLayout {
            Layout.fillWidth: true
            Text {
                text: `Carrinho do ${myModel.nome}`
                Layout.fillWidth: true
                font.pixelSize: 20
            }
            TextField {
                id: nomeField
            }
            Button {
                text: "Salvar nome"
                enabled: nomeField != ""
                onPressed: {
                    if(nomeField != "") {
                        myModel.setNome(nomeField.text, myModel.id)
                    }
                }
            }
        }

        RowLayout {
            Layout.fillWidth: true
            Text {
                text: `Email ${myModel.email}`
                Layout.fillWidth: true
                font.pixelSize: 20
            }
            TextField {
                id: emailField
            }
            Button {
                text: "Salvar email"
                enabled: emailField != ""
                onPressed: {
                    if(emailField != "") {
                        myModel.setEmail(emailField.text, myModel.id)
                    }
                }
            }
        }


        CarrinhoView {
            Layout.fillHeight: true
            Layout.fillWidth: true
            model: carrinho
//            onQuantidadeChanged: {
//                totalText.text = "NOTAS EM DESTAQUE: " + carrinho.getTotal()
//            }

            onRemovePressed: {
                carrinho.remove(index)
                totalText.text = "NOTAS EM DESTAQUE: " + carrinho.getTotal()
            }
        }

        Text {
            id: totalText
            text: "NOTAS EM DESTAQUE: " + carrinho.getTotal()
            Layout.fillWidth: true
            font.pixelSize: 20
        }

        RowLayout {
            Text {
                text: "NOTAS"
                Layout.fillWidth: true
                font.pixelSize: 20
            }
            Button {

                Image {
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    anchors.margins: 16
                    source: "qrc:/icons/adicionar.png"
                }

                onPressed: {
                    addNotaDialog.open()
                }
            }
        }

        NotaView {
            Layout.fillHeight: true
            Layout.fillWidth: true
            model: dbNotas
            onAddButtonPressed: {
                nota.quantidade = 1
                for(let i = 0; i < carrinho.rowCount(); i++) {
                    if(carrinho.get(i).id == nota.id) {
                        totalText.text = "NOTAS EM DESTAQUE: " + carrinho.getTotal() + " - ATENÇÃO! JÁ EM DESTAQUE!"
                        return
                    }
                }
                carrinho.append(nota)

                totalText.text = "NOTAS EM DESTAQUE: " + carrinho.getTotal()
            }
            onUpdateButtonPressed: {
                updateNotaDialog.setFields(nota)
                updateNotaDialog.open()
            }
            onRemoveButtonPressed: {
                removeNotaDialog.nota = nota
                removeNotaDialog.open()
            }
        }
    }
}
