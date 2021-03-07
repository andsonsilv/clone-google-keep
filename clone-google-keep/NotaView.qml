import QtQuick 2.9
import QtQuick.Window 2.12
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.3
import QtQuick.Layouts 1.3

import Models 1.0

ListView {
    signal addButtonPressed(var nota)
    signal removeButtonPressed(var nota)
    signal updateButtonPressed(var nota)
    clip: true
    spacing: 8
    delegate: Card {
        width: parent.width
        height: 64
        color: model.cor;
        GridLayout {
            columnSpacing: 8
            columns: parent.width/90
            anchors.fill: parent
            anchors.margins: 8

            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Text {
                    text: "Titulo"
                    anchors.fill: parent
                }
            }

            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Text {
                    text: "Descricao"
                    anchors.fill: parent
                }
            }

            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Text {
                    text: "Cor"
                    anchors.fill: parent
                }
            }

            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Text {
                    text: "Data"
                    anchors.fill: parent
                }
            }


            Button {
                Layout.rowSpan: 2

                Image {
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    anchors.margins: 16
                    source: "qrc:/icons/carrinho.png"
                }

                onPressed: {
                    const nota = {
                        id: model.id,
                        titulo: model.titulo,
                        descricao: model.descricao,
                        cor: model.cor,
                        data: model.data
                    }
                    addButtonPressed(nota)
                }
            }

            Button {
                Layout.rowSpan: 2

                Image {
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    anchors.margins: 16
                    source: "qrc:/icons/editar.png"
                }

                onPressed: {
                    const nota = {
                        titulo: model.titulo,
                        descricao: model.descricao,
                        cor: model.cor,
                        data: model.data,
                        index: index,
                        id: model.id
                    }
                    updateButtonPressed(nota)
                }
            }

            Button {
                Layout.rowSpan: 2

                Image {
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    anchors.margins: 16
                    source: "qrc:/icons/remover.png"
                }

                onPressed: {
                    const nota = {
                        titulo: model.titulo,
                        index: index,
                        id: model.id
                    }
                    removeButtonPressed(nota)
                }
            }

            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Text {
                    text: model.titulo
                    anchors.fill: parent
                    font.pixelSize: 22
                }
            }


            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Text {
                    text: model.descricao
                    anchors.fill: parent
                    font.pixelSize: 22
                }
            }
            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Text {
                    text: model.cor
                    anchors.fill: parent
                    font.pixelSize: 22
                }
            }
            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Text {
                    text: model.data
                    anchors.fill: parent
                    font.pixelSize: 22
                }
            }
        }
    }
}
